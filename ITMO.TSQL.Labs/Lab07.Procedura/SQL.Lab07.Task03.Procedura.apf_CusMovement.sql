CREATE PROCEDURE CustomerDetails.apf_CusMovement 
@CustID bigint, @FromDate datetime, @ToDate datetime
AS
BEGIN
	/* нам нужны три внутренние переменные:
	 идентификатор транзакции из таблицы будем сохранять в @LastTran
	 @StillCalc используется для проверки цикла WHILE */
	DECLARE @RunningBal money, @StillCalc bit, @LastTran bigint
	SELECT @StillCalc = 1, @LastTran = 0, @RunningBal = 0
	-- выполнение цикла WHILE продолжается, пока инструкция возвращает строку
	-- если строка не получена, значит в диапазоне дат больше нет транзакций
	WHILE @StillCalc = 1
	BEGIN
		-- инструкция SELECT возвращает одну строку, в которой ( WHERE ):
		-- идентификатор TransactionId больше предыдущего возвращенного идентификатора,
		-- транзакция оказывает влияние на баланс клиента и 
		-- транзакция находится в переданном диапазоне дат
		SELECT TOP 1 @RunningBal = @RunningBal + CASE
		WHEN tt.CreditType = 1 THEN t.Amount
		ELSE t.Amount* -1 END,
		@LastTran = t.TransactionId
		FROM CustomerDetails.Customers AS c
			JOIN TransactionDetails.Transactions AS t
			ON t.CustomerId = c.CustomerId
			JOIN TransactionDetails.TransactionTypes AS tt
			ON tt.TransactionTypesId = t.TransactionType
		WHERE t.TransactionId > @LastTran AND
			tt.AffectCashBalance = 1 AND
			DateEntered BETWEEN @FromDate AND @ToDate
			ORDER BY DateEntered
			-- если строка возвращена, то выполнение цикла продолжается
			IF @@ROWCOUNT > 0
			-- здесь следует выполнить расчет процента
				CONTINUE
			ELSE
				BREAK
	END
	SELECT @RunningBal AS 'End Balance'
END;
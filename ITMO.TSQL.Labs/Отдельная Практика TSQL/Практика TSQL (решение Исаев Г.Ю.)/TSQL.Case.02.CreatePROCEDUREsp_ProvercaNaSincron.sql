USE Practica 
GO

ALTER PROCEDURE sp_ProvercaNaSincron @DataParametr date
AS
	DECLARE @DateMax date; 
	Print(@DateMax)
	/*Если переданна дата*/
	IF @DataParametr IS NOT NUlL
		BEGIN
			SELECT @DateMax  = @DataParametr			
		END
	/*Если нет даты проверяем заполнгение нашей таблицы*/
	IF @DateMax IS NUlL
		BEGIN
			SELECT @DateMax  =  MAX(dtReportDate) FROM NashaBaza.OurTable
			Print(@DateMax)
		END
	Print(@DateMax)
	/*Если наша таблица изначальна была пустой и не было переданно даты в параметре берем далекую дату*/
	IF @DateMax IS NUlL
		BEGIN
			Set @DateMax = '1980-01-01'
		END

	IF @DateMax IS NOt NUlL
		BEGIN			
			Print('Начата проверка соответствии данных по дате: ')
			Print(@DateMax)
			DELETE FROM NashaBaza.TempTable	
			
			--DECLARE @DateMax date; 
			--Set @DateMax = '2019-09-30'
			INSERT INTO NashaBaza.TempTable
			(nCanonId,dtReportDate,nTerOtdelenie,nTerPodrazdel,vProcent)
				SELECT
				nPokazatelId, 
				dtEndDate, 
				CAST(SUBSTRING(vTerritoryId,1,2) AS int),
				CAST(SUBSTRING(vTerritoryId,4,4) AS int),
				nValue
				FROM Istochnik.TableSource
				WHERE dtEndDate = @DateMax

			/*Тест совпадения на сумму vProcent Если есть , то данные за эту дату не добавляем */
			--DECLARE @DateMax date; 
			--Set @DateMax = '2019-09-30'
			IF	  (SELECT SUM(nValue)
			FROM Istochnik.TableSource
			WHERE dtEndDate = @DateMax) = ISNULL((SELECT SUM(vProcent)
			FROM NashaBaza.OurTable
			WHERE dtReportDate = @DateMax),0)
				BEGIN					
					DELETE FROM NashaBaza.TempTable	
				END

			/*Добавляем данные по датам старше нашей*/
			INSERT INTO NashaBaza.TempTable
			(nCanonId,dtReportDate,nTerOtdelenie,nTerPodrazdel,vProcent)
				SELECT
				nPokazatelId, 
				dtEndDate, 
				CAST(SUBSTRING(vTerritoryId,1,2) AS int),
				CAST(SUBSTRING(vTerritoryId,4,4) AS int),
				nValue
				FROM Istochnik.TableSource
				WHERE dtEndDate > @DateMax

			
			--Проверяем есть ли значения во временной таблице
			DECLARE @CountStriok int; 
	        SELECT @CountStriok  =  COUNT(vProcent) FROM NashaBaza.TempTable
			IF(@CountStriok > 1)
				BEGIN	
					DELETE FROM NashaBaza.OurTable
					WHERE dtReportDate IN (SELECT dtReportDate FROM NashaBaza.TempTable)						
					--SELECT * FROM NashaBaza.TempTable
					--SELECT * FROM NashaBaza.OurTable

					Print('Объединение данных временной таблицы и главной')
					INSERT INTO NashaBaza.OurTable
						(nCanonId,dtReportDate,nTerOtdelenie,nTerPodrazdel,vProcent)
						SELECT nCanonId,dtReportDate,nTerOtdelenie,nTerPodrazdel,vProcent 
						FROM NashaBaza.TempTable

					SELECT 'Обновленная таблица NashaBaza.OurTable по дате:', @DateMax	
					SELECT 'Строк обновлено', @CountStriok	
					--SELECT * FROM NashaBaza.TempTable
					SELECT * FROM NashaBaza.OurTable
					Print('Данные синхронизированны!')
				END
			ELSE
				BEGIN
					Print('Данные актуальны')
				END		
		END
GO

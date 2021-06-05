/*Вызов созданной процедуры*/
CustomerDetails.apf_insCustomer 'Henry','Williams',1,NULL,431,'22067531',1;

/*Вызов созданной процедуры c указанием параметров*/
EXEC CustomerDetails.apf_insCustomer @CustTitle=1, @FirstName='Julie',
@CustInitials='A', @LastName='Dewson', @AddressId=643,
@AccountNumber='SS865', @AccountTypeId=7;
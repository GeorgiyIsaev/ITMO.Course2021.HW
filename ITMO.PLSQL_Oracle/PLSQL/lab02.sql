/*1: Недоупустимые идентификаторы*/
/*c) today’s_date(недопустимые ’)
d) Number_of_days_in_February_this_year(недопустимые 36символов)
f) #number(недопустимые #)*/



/*2) недопустимые объявление .*/
/*a) number_of_copies 	PLS_NUMBER; (недопустимые)
c) deliver_to 	VARCHAR2(10) := Johnson; (недопустимые)
*/



/**Резулбтат выполнения*/
DECLARE
    v_fname VARCHAR2(20);
    v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_fname ||' ' || v_lname);
END;
/*a) Блок выполнится успешно и выведет «fernandez».*/



/*Задание04*/	
SET SERVEROUTP ON
DECLARE
    v_today DATE :=SYSDATE;
    v_tomorrow v_today%TYPE ;
    v_greeting VARCHAR2(100):='Hello World';
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_greeting);
    DBMS_OUTPUT.PUT_LINE(v_today);
        v_tomorrow:=v_today+1;
    DBMS_OUTPUT.PUT_LINE(v_tomorrow);
END;	



/*Задание05*/	
VARIABLE b_basic_percent NUMBER
VARIABLE b_pf_percent NUMBER
SET SERVEROUTP ON
DECLARE
    v_today DATE :=SYSDATE;
    v_tomorrow v_today%TYPE;
    v_greeting VARCHAR2(100):='Hello World';
BEGIN      
    DBMS_OUTPUT.PUT_LINE(v_greeting);
    DBMS_OUTPUT.PUT_LINE(v_today);
        v_tomorrow:=v_today+1;
    DBMS_OUTPUT.PUT_LINE(v_tomorrow); 
        :b_basic_percent:=45;
        :b_pf_percent:=12;
END;
/
PRINT b_basic_percent
PRINT b_pf_percent

/*Задание 03*/
DECLARE 
v_weight NUMBER(3) := 600;
v_message VARCHAR2(255) := 'Product 10012';
begin
    declare
        v_weight NUMBER(3) := 1;
        v_message VARCHAR2(255) := 'Product 11001';
        v_new_locn VARCHAR2(50) := 'Europe';
    begin
        v_weight := v_weight + 1;
        v_new_locn := 'Western' || v_new_locn;
        DBMS_OUTPUT.PUT_LINE(v_weight);
        DBMS_OUTPUT.PUT_LINE(v_message);
    end;
    v_weight := v_weight + 1;
    v_message := v_message || 'is in stock';
   /* v_new_locn := 'Western' || v_new_locn; */
    DBMS_OUTPUT.PUT_LINE(v_weight);
    DBMS_OUTPUT.PUT_LINE(v_message);
end;

/*Вывод:
a) Значение v_weight в позиции 1 равно: 2
b) Значение v_new_locn в позиции 1 равно: Western Europ
c) Значение v_weight в позиции 2 равно: 601
d) Значение v_message в позиции 2 равно: Product 10012 is in stock
e) Значение v_new_locn в позиции 2 равно: переменная не определена при обращении будит ошибка
*/


/*Задани 02*/
/*Вывод*
a) Значение v_customer во вложенном блоке: 201
b) Значение v_name во вложенном блоке: Unisports
c) Значение v_credit_rating во вложенном блоке: GOOD
d) Значение v_customer в главном блоке: Womansports
e) Значение v_name в главном блоке: переменная не определена
f) Значение v_credit_rating в главном блоке: GOOD
*/

/*Задани 03*/
SET SERVEROUTP ON
DECLARE
    v_today DATE :=SYSDATE;
    v_tomorrow v_today%TYPE;
    v_greeting VARCHAR2(100):='Hello World';
    v_fname VARCHAR2(15);
    v_emp_sal VARCHAR2(10);
    b_basic_percent NUMBER :=33;
    b_pf_percent NUMBER :=22;
BEGIN
    v_tomorrow:=v_today+1;
    SELECT first_name, salary INTO v_fname, v_emp_sal
    FROM employees WHERE employee_id=110;
    DBMS_OUTPUT.PUT_LINE(REPLACE(v_greeting, 'World', v_fname));
    DECLARE
        v_RF v_emp_sal%TYPE := v_emp_sal*0.12*0.45;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('YOUR SALARY IS: '||v_emp_sal);
        DBMS_OUTPUT.PUT_LINE('YOUR CONTRIBUTION TOWARDS PF: '||v_RF);
    END;
END;
/ 

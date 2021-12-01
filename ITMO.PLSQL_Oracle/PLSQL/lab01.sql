/*Задание 01*/
d)	DECLARE
v_amount INTEGER(10);
BEGIN
DBMS_OUTPUT.PUT_LINE(v_amount);
END;


/*2)	Создайте и выполните простой анонимный блок, который выводит фразу «Hello World». Выполните и сохраните скрипт как lab_01_02_soln.sql.*/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;

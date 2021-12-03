/*Практика 4: Взаимодействие с Oracle Server*/

/*Задание01*/
SET SERVEROUTPUT ON
DECLARE
    v_max_depno NUMBER;
BEGIN
    SELECT MAX(department_id) INTO v_max_depno FROM departments ;
    DBMS_OUTPUT.PUT_LINE('The maximum department_id is : '|| v_max_depno);
END;


/*Задание02*/
SET SERVEROUTPUT ON
DECLARE  
    v_max_depno NUMBER;
    v_dept_name departments.department_name%TYPE := 'Education';
    v_dept_id NUMBER;      
BEGIN
    SELECT MAX(department_id) INTO v_max_depno FROM departments;
    DBMS_OUTPUT.PUT_LINE('The maximum department_id is : '|| v_max_depno);
    v_dept_id := v_max_depno + 10;
    DBMS_OUTPUT.PUT_LINE('The new maximum department_id to be INSERTed is : '|| v_dept_id);
    INSERT INTO
        departments (department_id, department_name, location_id)
        VALUES (v_dept_id, v_dept_name, NULL);
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' rows were affected');    
END;
/

SELECT * FROM departments 
WHERE department_id =
(SELECT MAX(department_id) FROM departments);


/*Задание03*/
SET SERVEROUTPUT ON
DECLARE  
    v_max_depno NUMBER;
    v_dept_name departments.department_name%TYPE := 'Education';
    v_dept_id NUMBER;      
BEGIN
    SELECT MAX(department_id) INTO v_max_depno FROM departments;
    DBMS_OUTPUT.PUT_LINE('The maximum department_id is : '|| v_max_depno);
    v_dept_id := v_max_depno + 10;
    DBMS_OUTPUT.PUT_LINE('The new maximum department_id to be INSERTed is : '|| v_dept_id);
    INSERT INTO
        departments (department_id, department_name, location_id)
        VALUES (v_dept_id, v_dept_name, NULL);
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' rows were affected'); 
    UPDATE departments SET location_id = 3000 WHERE department_id = 280;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' rows were affected by UPDATE');
    DELETE FROM departments WHERE department_id = 280;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' rows were affected by DELETE');
END;

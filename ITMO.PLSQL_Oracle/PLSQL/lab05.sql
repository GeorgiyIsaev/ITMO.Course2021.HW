/*Задание01*/

CREATE TABLE messages ( RESULTS NUMBER(6) )
/
SET SERVEROUTPUT ON
SET AUTOPRINT ON
DECLARE 
    i NUMBER:=1;
BEGIN
    LOOP
        IF i NOT IN (6,8) THEN
            INSERT INTO messages VALUES(i);
        END IF;
        i:= i+1;
        EXIT WHEN i>10;
    END LOOP;    
COMMIT;
END;
/
SELECT * FROM messages;



/*Задание02*/
CREATE TABLE emp AS SELECT * FROM employees;
/
ALTER TABLE emp ADD (stars VARCHAR2(50));
/
SET SERVEROUTPUT ON
SET AUTOPRINT ON
DECLARE
    v_empno emp.employee_id%TYPE:= 176;
    v_asterisk emp.stars%TYPE := NULL;
    v_sal emp.salary%TYPE;    
BEGIN       
    SELECT ROUND(salary/1000) INTO v_sal FROM emp WHERE employee_id = v_empno;
    DBMS_Output.Put_Line('Salary level : '||v_sal);
    LOOP
        IF v_sal > 0 
        THEN
            v_asterisk := v_asterisk||'*';
        END IF;
        v_sal:=v_sal-1;
        EXIT WHEN v_sal = 0;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_asterisk);
    UPDATE emp SET stars = v_asterisk WHERE employee_id = v_empno;
    DBMS_Output.Put_Line(SQL%ROWCOUNT||' rows were affected with UPDATE');
END;
/
SELECT employee_id, salary, stars FROM emp WHERE employee_id = 176;	

/*Задание 01: Верный запрос:*/
select employee_id, last_name, salary * 12 "ANNUAL SALARY"
from employees;


/*Задание 02*/
/desc departments;
select * from departments;	

/*Задание 03*/
desc employees;

/*Задание 04*/
select employee_id, first_name||' '||last_name, job_id, hire_date 
from employees;

/*Задание 05*/
select distinct job_id
from employees;

/*Задание 06*/
select last_name||', '||job_id "Employee and Title" 
from employees;	

/*Задание 07*/
select employee_id||','||first_name||','||last_name||','||email||'
,'||phone_number||','||hire_date||','||job_id||','||salary||null||'
,'||commission_pct||null||','||manager_id||null||','||department_id THE_OUTPUT 
from employees;

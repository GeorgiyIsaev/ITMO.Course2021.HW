/*Задание 01: 1.	Создайте запрос для вывода имени и заработной платы служащих, зарабатывающих более $12000*/
select last_name, salary 
from employees 
where salary > 12000;


/*Задание 02: Создайте запрос для вывода фамилии и номера отдела служащего под номером 176*/
select last_name, department_id 
from employees
where employee_id = 176;
	

/*Задание 03: выведите фамилии и оклады всех служащих, чей оклад не входит в диапазон от $5000 до $12000*/
select last_name, salary 
from employees 
where salary not between 5000 AND 12000;


/*4.	Выведите фамилию, идентификатор должности и дату начала работы всех служащих, нанятых в период с 20 февраля 1998 по 1 мая 1998 г. Отсортируйте данные в порядке возрастания даты найма.*/
select last_name, job_id, hire_date 
from employees 
LAST_NAME	JOB_ID	HIRE_DATE
Matos	ST_CLERK	15-MAR-98
Taylor	SA_REP	24-MAR-98
where hire_date between '01.01.1994' and '31.12.1994';


/*5.	Выведите фамилию и номер отдела всех служащих из отделов 20 и 50. Отсортируйте данные по фамилиям в алфавитном порядке.*/
select last_name, department_id
from employees
where department_id in (20, 50)
order by last_name;


/*Задание 06: вывода фамилий и окладов служащих отделов 20 и 50, зарабатывающих от $5000 до $12000. Назовите столбцы Employee и Mounthly Salary, соответственно*/
select last_name as Employee, salary as "Mounthly Salary"
from employees
where department_id in (20, 50) and salary between 5000 and 12000
order by last_name;


/*7.	Выведите фамилию и дату найма всех служащих, нанятых в 1994 г. */
select last_name , hire_date 
from employees
where hire_date between '01.01.1994' and '31.12.1994';


/*8.	Выведите фамилии и должности всех служащих, не имеющих менеджера.*/
select last_name , job_id, manager_id
from employees
where (manager_id is null) ;


/*9.	Выведите фамилию, и комиссионные всех служащих, зарабатывающих комиссионные. Отсортируйте данные в порядке убывания окладов и комиссионных.*/
select last_name , salary, commission_pct
from employees
where commission_pct is not null or commission_pct != 0
order by salary, commission_pct;


/*10.	Выведите все фамилии служащих, в которых третья буква – а.*/
select last_name 
from employees
where last_name like ('__a%');


/*11.	Выведите фамилии всех служащих, в которых есть буквы «а» и «е».*/
select last_name 
from employees
where last_name like ('%a%e%') or last_name like ('%e%a%');


/*12.	запросите фамилии, должности и оклады всех служащих, работающих торговыми представителями (SA_REP) или клерками на складе (ST_CLERK) и с окладом, не равным  $2500, $3500 и $7000.*/
select last_name , job_id, salary
FROM employees
where (job_id = 'SA_REP' or job_id = 'ST_CLERK')
and salary not in (2500,3500,7000);


/*13.	Измените lab2_6.sql так, чтобы получить фамилии оклады и комиссионные всех служащих, у которых сумма комиссионных превышает 20%. Выполните запрос ещё раз. */
select last_name , salary, commission_pct
from employees
where commission_pct > 0.2;



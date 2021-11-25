/*1.	Создайте запрос для вывода фамилии и даты найма каждого служащего, работающего в одном отделе с Zlotkey. Исключите Zlotkey из выходных данных. */
select last_name, hire_date
from employees
where department_id like 
             (select department_id
            from employees
             where last_name like 'Zlotkey') and last_name not in ('Zlotkey');
			 
			 
			 
/*2.	Создайте запрос для вывода номеров и фамилий всех служащих, оклад которых выше среднего. Отсортируйте данные в порядке увеличения окладов. */
select employee_id, last_name, salary
from employees
where salary > (select avg(salary) from employees)
order by salary;



/*3.	Создайте запрос для вывода номеров и фамилий всех служащих, работающих в одном отделе с любым служащим, фамилия которого содержит букву «u». Сохраните свой запрос в тестовом файле lab6_3.sql. Выполните запрос. */
select employee_id, last_name
from employees
where department_id in 
    (select  department_id
    from employees 
    where lower(last_name) like '%u%');



/*4.	Создайте запрос для вывода фамилии, номера отдела и должности каждого служащего, идентификатор местоположения отдела которого равен 1700.*/
select e.last_name, e.department_id, j.job_title
from employees e
join jobs j on e.job_id = j.job_id
where department_id in 
    (select department_id 
    from departments
    where location_id = 1700);
	
	
	
/*5.	Получите список фамилий и окладов всех служащих, подчинённых Кингу. */
select last_name, salary, manager_id
from employees 
where manager_id = 
    (select employee_id
    from employees
    where last_name = 'King' and manager_id is null);
	
	
	
/*6.	Получите номер отдела, фамилию и должность для каждого служащего, работающего в администрации (department_name = ‘Executive’). */
select e.department_id, e.last_name, j.job_title
from employees e
join jobs j
on e.job_id = j.job_id
where department_id = 
     (select department_id
    from departments 
    where department_name = 'Executive');
	
	
	
/*7.	Измените lab6_3.sql для вывода номеров, фамилий и окладов всех служащих, которые работают в одном отделе с любым служащим с буквой «u» в фамилии и оклады которых превышают средний. Сохраните новый запрос в файле lab6_7.sql. Выполните его. */
select employee_id, last_name, salary
from employees
where department_id in 
     (select  department_id
    from employees 
    where lower(last_name) like '%u%' and salary > 
         (select avg(salary) from employees)); 



/*8.	Покажите номер отдела с наивысшей средней заработной платой и наименьший оклад работающего в нём сотрудника. */
select department_id, min(salary)
from employees
where department_id = 
    (select department_id 
    from employees
    where salary >= 
        (select max(avg_sal)
        from
            (select department_id, avg(salary) avg_sal
            from employees
            group by department_id)))
group by department_id;



/*9.	Выведите номера , наименования и местоположения отделов, в которых не работают торговые представители (job_id = ‘SA_REP’). */
select department_id, department_name, manager_id, location_id
from departments
where department_id not in 
    (select nvl(department_id, 0)from employees 
    where job_id = 'SA_REP');

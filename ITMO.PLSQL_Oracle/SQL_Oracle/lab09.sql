/*1.	Создайте запрос для вывода фамилии, номера отдела и оклада всех служащих, чей номер отдела и оклад совпадают с номером отдела и окладом любого служащего, зарабатывающего комиссионные. */
select last_name, department_id, salary
from employees
where (department_id, salary) in
     (select department_id, salary
    from employees
    where commission_pct is not null);
 
 
 
/*2.	Выведите фамилию, название отдела и оклад всех служащих, чей оклад и комиссионные совпадают с окладом и комиссионными любого служащего, работающего в отделе, идентификатор местоположения которого Location_ID = 1700. */
select e.last_name, d.department_name, e.salary
from employees e join departments d on e.department_id = d.department_id
where (e.salary, nvl(e.commission_pct, 0)) in
    (select e.salary,nvl(e.commission_pct, 0)
    from employees e join departments d on e.department_id = d.department_id
    where d.location_id = '1700');
 
 
 
/*3.	Создайте запрос для вывода фамилии, даты найма и оклада всех служащих, которые получают такой же оклад и такие же комиссионные, как Kochhar. Не выводите данные о сотруднике Kochhar. */
select last_name, hire_date, salary
from employees
where (salary, nvl(commission_pct,0)) in
    (select salary, nvl(commission_pct,0)
    from employees
    where last_name = 'kochhar') 
and last_name <> 'kochhar';



/*4.	Выведите фамилию, должность и оклад всех служащих, оклад которых превышает оклад каждого клерка торгового менеджера (JOB_ID = ‘SA_MAN’). Отсортируйте результаты по убыванию окладов. */
select last_name, job_id, salary
from employees
where (salary) > all(select salary
    from employees
    where job_id = 'sa_man')
order by salary desc;
 
 
 
/*5.	Выведите номера, фамилии и отделы служащих, живущих в городах, названия которых начинаются с буквы Т. */
select employee_id, last_name, department_id
from employees
where department_id in 
    (select d.department_id
    from departments d join locations l on d.location_id = l.location_id
    where l.city like 't%');
 
 
 
/*6.	Напишите запрос для нахождения всех сотрудников, которые зарабатывают больше среднего оклада по их отделу. Выведите фамилию, оклад, номер отдела и средний оклад по отделу. Отсортируйте результаты по средней зарплате. Используйте псевдонимы для выбираемых столбцов.*/
select e.last_name, e.salary, e.department_id, round(avg(e2.salary))
from employees e, employees e2
where e.department_id = e2.department_id
and e.salary > 
    (select avg(salary)
    from employees
    where department_id = e.department_id)
group by e.last_name, e.salary, e.department_id
order by avg(e2.salary);



/*7.	Найдите всех сотрудников, не являющихся руководителями. Выполните это с помощью оператора NOT EXIST. */
select last_name
from employees e
where not exists
    (select manager_id
    from employees ev
    where ev.manager_id = e.employee_id);
 
 
 
/*8.	Может ли это же быть сделано с помощью оператора NOT IN?*/
select e.last_name
from employees e
where e.employee_id not in 
    (select manager_id
    from employees ev
    where ev.manager_id = e.employee_id);
	
	
	
/*9.	Выведите фамилии сотрудников, зарабатывающих меньше среднего оклада по их отделу. */
select last_name
from employees e
where e.salary <
    (select avg(salary)
    from employees ev
    where e.department_id = ev.department_id);
 


/*10.	Выведите фамилии сотрудников, у которых есть коллеги по отделу, которые были приняты на работу позже, но имеют более высокий оклад. */
select last_name
from employees e
where exists 
    (select salary
    from employees ev 
    where e.department_id = ev.department_id
        and e.hire_date < ev.hire_date 
        and e.salary < ev.salary);
 
 
 
/*11.	Выведите номера, фамилии и наименования отделов всех сотрудников. Используйте скалярный подзапрос в команде SELECT для вывода наименований отделов. */
select employee_id, last_name,
    (select department_name
    from departments d 
    where e.department_id = d.department_id) as department_name
    from employees e

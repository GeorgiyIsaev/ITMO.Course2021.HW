/*1.	Напишите запрос для вывода фамилии, номера отдела и названия отдела дл всех служащих.*/
select e.last_name, e.department_id, d.department_name 
from employees e join departments d on e.department_id = d.department_id;


/*2.	Выведите список всех должностей в отдел 80 (должности в списке не должны повторяться) и местоположение отдела.*/
select distinct e.job_id, d.location_id
from employees e join departments d on e.department_id = d.department_id
where e.department_id = 80


/*3.	Напишите запрос для вывода фамилий, названия отдела, идентификатора местоположения отдела и города, в котором он находится, для всех служащих, зарабатывающих комиссионные.*/
select e.last_name, d.department_name, d.location_id, l.city
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where e.commission_pct is not null;



/*4.	Выведите фамилии всех служащих, содержащтих букву «а» (в строчном регистре), с названиями отделов. Сохраните свою команду SQL в файле lab4_4.sql.*/
select e.last_name, d.department_name
from employees e join departments d on e.department_id = d.department_id
where lower(e.last_name) like '%a%';



/*5.	Напишите запрос для вывода фамилии, должности, номера отдела и названия отдела всех служащих, работающих в городе Toronto.*/
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where l.city = 'Toronto';



/*6.	Выведите фамилии и номера всех служащих вместе с фамилиями и номерами их менеджеров. Назовите столбцы EMPLOYEE, Emp#, Manager и Mgr#. Сохраните свою команду SQL в файле lab4_6.sql.*/
select e.last_name "Employee", e.employee_id "Emp#"
, m.last_name "Manager", m.employee_id "Mgr#"
from employees e join employees m on e.manager_id = m.employee_id;


/*7.	Измените файл lab4_6.sql так, чтобы получить фамилии всех служащих, включая Кинга, который не имеет менеджера. Упорядочьте результат по возрастанию номера служащего. Сохраните изменённый запрос в текстовом файле lab4_7.sql.*/
select e.last_name "Employee", e.employee_id "Emp#"
, nvl(m.last_name, ' ') "Manager", nvl(to_char(m.employee_id), ' ') "Mgr#"
from employees e left join employees m on e.manager_id = m.employee_id
order by e.employee_id;


/*8.	Создайте запрос для вывода номера отдела, фамилии служащего и фамилий всех служащих, работающих в одном отделе с данным служащим. Дайте столбцам соответствующие имена.*/
select e.department_id as department, e.last_name as employee, c.last_name as colleague 
from employees e join employees c on e.department_id = c.department_id
where e.employee_id <> c.employee_id
order by e.department_id;

/*9.	Покажите структуру таблицы JOB_GRADES.*/
desc job_grades;



/*10.	 Создайте запрос для вывода фамилии, должности, названия отдела, оклада и категории (GRADE_LEVEL) всех служащих.*/
select e.last_name "Name", j.job_title "Job Title", d.department_name "Department"
, e.salary "Salary", g.grade_level "Grade Level"
from employees e 
join departments d on (e.department_id = d.department_id)
join jobs j on (e.job_id = j.job_id)
join job_grades g on e.salary 
between g.lowest_sal and g.highest_sal;



/*11.	Создайте запрос для вывода фамилий и дат найма всех служащих, нанятых после Davies.*/
select e.last_name, e.hire_date
from employees e 
join employees d on (e.hire_date > d.hire_date)
where d.last_name = 'Davies'
order by hire_date;



/*12.	По всем служащим нанятым раньше своих менеджеров, выведите фамилии и даты найма самих служащих, а также фамилии и даты найма их менеджеров. Назовите столбцы Employee, Emp, Manager и Manager Hired.*/
select e.last_name "Employee", e.hire_date "Employee Hired"
, m.last_name "Manager", m.hire_date "Manager Hired"
from employees e 
join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;



/*13.	Выведите номера, наименования и местоположение всех отделов, а также количество работающих в них сотрудников. Обеспечьте вывод отделов в которых нет сотрудников.*/
select d.department_id "Department ID", l.city||', '||l.state_province "Location"
, count(e.employee_id) "Number of Employees"
from employees e 
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
group by d.department_id, l.city, l.state_province;


/*14.	Какие должности имеются в отделах Administration и Executive, а также сколько сотрудников занимают эти должности? Выведите первыми наиболее часто встречаемые должности.*/
select e.job_id, d.department_name, count(e.employee_id) as frequency
from employees e 
join departments d on e.department_id = d.department_id
and d.department_name in ('Administration', 'Executive')
group by e.job_id, d.department_name
order by count(e.employee_id) desc;



/*15.	Покажите сотрудников, менеджеры которых имеют оклад выше $15000. выведите следующие сведения: фамилию сотрудника, фамилию менеджера, его оклад и уровень оклада (GRADE_LEVEL).*/
select e.last_name as employee, m.last_name as manager
, m.salary "Manager's Salary", g.grade_level as grade
from employees e 
join employees m on e.manager_id = m.employee_id
and m.salary > 15000
join job_grades g on m.salary 
between g.lowest_sal and g.highest_sal;

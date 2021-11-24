/*1.	Напишите запрос для вывода самого высокого, самого низкого и среднего оклада по всем служащим, а также суммы всех окладов. Назовите столбцы Maximum, Minimum, Average и Sum. Округлите суммы до ближайшего целого значения. Сохраните свой запрос в файле lab5_6.sql.*/
select max(salary) "Maximum",
    min(salary) "Minimun",
    round(sum(salary)) "Sum",
    round(avg(salary)) "Average" 
from employees;


/*2.	Измените запрос в lab5_6.sql. так, чтобы получить самый низкий, самый высокий и средний оклады, а также сумму окладов по каждой должности. Сохраните изменённый запрос в файле lab5_5.sql. Выполните запрос из lab5_5.sql.*/
select job_id, max(salary) "Maximum",
    min(salary) "Minimun",
    round(sum(salary)) "Sum",
    round(avg(salary)) "Average" 
from employees
group by job_id
order by job_id;


/*3.	Напишите запрос для вывода должности и количества служащих, занимающих каждую должность.*/
select job_id, count(*) 
from employees
group by job_id
order by job_id;


/*4.	Получите количество служащих, имеющих подчинённых, без их перечисления. Назовите столбец Number of Managers. Используйте столбец MANAGER_ID для определения числа менеджеров.*/
select count(distinct nvl(manager_id,0))
as "Number of Managers"
from employees;

/*5.	Напишите запрос для вывода разности между самым высоким и самым низким окладами. Назовите столбец DIFFERENCE*/
select (max(salary)-min(salary)) difference
from employees;


/*6.	Напишите запрос для вывода номера каждого менеджера, имеющего подчинённых, и заработную плату самого низкооплачиваемого из его подчинённых. Исключите менеджеров для которых неизвестны их менеджеры. Исключите все группы, где минимальный оклад составляет менее $6000. Отсортируйте выходные строки в порядке убывания оклада.*/
select manager_id, min(salary)
from employees
where salary > 6000
group by manager_id
having manager_id is not null
order by min(salary) desc;


/*7.	Напишите запрос для вывода названия отдела, местоположения отдела, количества служащих и среднего оклада по этому отделу. Назовите столбцы Name, Location, Number of People и Salary. Округлите средний оклад до ближайшего целого значения.*/
select department_name "name", location_id "location",
count(employee_id) "Number of People", round(avg(salary)) "Salary"
from employees join departments 
using (department_id)
group by department_name,location_id
order by department_name;


/*8.	Напишите запрос для вывода общего количества служащих и количества служащих, нанятых в 1995, 1996, 1997 и 1998 годах. Дайте соответствующие заголовки столбцам.*/
select count(*) "total",
sum(decode(to_char(hire_date, 'yyyy'), '1995', 1, 0)) "1995",
sum(decode(to_char(hire_date, 'yyyy'), '1996', 1, 0)) "1996",
sum(decode(to_char(hire_date, 'yyyy'), '1997', 1, 0)) "1997",
sum(decode(to_char(hire_date, 'yyyy'), '1998', 1, 0)) "1998"
from employees;


/*9.	Напишите матричный запрос для вывода всех должностей и суммы заработной платы служащих, работающих в этой должности в отделах 20, 50, 80 и 90. Последний столбец должен содержать сумму заработной платы служащих этих отделов, занимающих каждую конкретную должность. Дайте столбцам соответствующие заголовки.*/
select job_id,
nvl(to_char(sum(decode(department_id, 20, salary, ''))), ' ') "Dept20",
nvl(to_char(sum(decode(department_id, 50, salary, ''))), ' ') "Dept50",
nvl(to_char(sum(decode(department_id, 80, salary, ''))), ' ') "Dept80",
nvl(to_char(sum(decode(department_id, 90, salary, ''))), ' ') "Dept90",
sum(salary) "total"
from employees
group by job_id
order by job_id;

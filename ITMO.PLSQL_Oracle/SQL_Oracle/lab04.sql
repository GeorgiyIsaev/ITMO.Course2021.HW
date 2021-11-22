/*1.	Для каждого служащего выведите фамилию и вычислите количество месяцев со дня найма до настоящего времени, округлённое до ближайшего целого. Назовите столбец MONTH_WORKED. Результаты отсортируйте по количеству отработанных месяцев. Округлите число до ближайшего целого.*/
select last_name, round(months_between(sysdate, hire_date)) as month_worked
from employees
order by month_worked


/*2.	Получите по каждому служащему отчёт в следующем виде:
<фамилия> зарабатывает <оклад> в месяц, но желает <утроенный оклад>. Назовите столбец Dream Salaries*/
select last_name||' зарабатывает '||salary||' в месяц, но желает '||salary*3 as "Dream Salaries"
from employees


/*3.	Напишите запрос для вывода фамилий и окладов всех служащих. Назовите выходной столбец SALARY. Длина столбца SALARY – 15 символов с заполнением символом $.*/
select last_name, lpad(salary, 15, '$') as SALARY
from employees



/*4.	Для каждого служащего выведите фамилию, дату найма и дату пересмотра зарплаты, которая приходится на первый понедельник после 6 месяцев работы. Назовите столбец REVIEW. Формат даты при выводе имеет вид: “Monday, the Thirty-First of MM, YYYY”.*/
select last_name, hire_date, to_char(next_day(add_months(hire_date, 6), 'понедельник'), 
    'day, "the " ddspth" of "mm, yyyy') as review
from employees



/*5.	По каждому служащему выведите фамилию, дату  найма и день недели, когда он был нанят на работу. Назовите последний столбец DAY. Отсортируйте результаты по датам.*/
select last_name, hire_date, to_char(hire_date, 'day') as day
from employees

 
/*6.	Напишите запрос для вывода фамилии и суммы комиссионных каждого служащего. Если служащий не зарабатывает комиссионных, укажите в столбце «No Commission». Назовите столбец COMM.*/
select last_name, coalesce(to_char(commission_pct), 'No Commission') as comm
from employees


/*7.	Используя функцию DECODE, напишите запрос для отображения должности сотрудника и её разряда (grade). Разряд каждого типа должности JOB_ID приведён в таблице.*/
select job_id, decode(job_id, 'AD_PRES', 'A', 'ST_MAN', 'B', 'IT_PROG'
    , 'C', 'SA_REP', 'D', 'ST_CLERK', 'E', '0') as Grade
from employees


/*8.	Перепешите команду из предыдущего задания, используя синтаксис выражения CASE.*/
select job_id, 
(case when job_id = 'AD_PRES' then 'A'
      when job_id = 'ST_MAN' then 'B'
      when job_id = 'IT_PROG' then 'C'
      when job_id = 'SA_REP' then 'D'
      when job_id = 'ST_CLERK' then 'E'
      else  '0' 
end) as grade
from employees;

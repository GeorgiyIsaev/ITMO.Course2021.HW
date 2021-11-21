/*1.	Напишите запрос для вывода текущей даты. Назовите столбец Date.*/
select sysdate 
from dual

/*2.	Выведите номер служащего, его фамилию, оклад и новый оклад, повышенный на 15% и округлённый до целого. Назовите столбец New Salary. Сохраните команду SQL в текстовом файле lab3_2sql.*/
select employee_id, last_name, salary, round(salary*1.15) as "new salary"
from employees

/*3.	Выполните запрос из файла lab3_2sql.*/


/*4.	Измените lab3_2.sql. добавьте ещё один столбец, который будет содержать результат вычитания старого оклада из нового. Назовите столбец Increase. Сохраните изменённый запрос в lab3_4.sql. Выполните запрос ещё раз.*/
select employee_id, last_name, salary, round(salary*1.15)
as "new salary", round(salary*1.15) - salary as increase
from employees

/*5.	Выведите фамилии служащих (первая буква каждой фамилии должна быть заглавной, а остальные - строчными) и длину каждой фамилии для тех служащих, фамилия которых начинается с символа J, A или М. Присвойте соответствующие заголовки столбцам.*/
select initcap(last_name) as name, length(last_name) as length
from employees
where upper(substr(last_name, 1, 1)) in ('J', 'A', 'M')

/*1.	Напишите отчёт, в котором отражена структура отдела, которым руководит Mourgos. Выведите фамилии, оклады и номер отдела сотрудников. */
select last_name, salary,department_id
from employees
start with last_name = ' Mourgos'
connect by prior employee_id = manager_id;
 
 
 
/*2.	Создайте отчёт, который показывает иерархию менеджеров, которым подчиняется сотрудник Lorentz. Выведите сначала менеджера, перед которым непосредственно отчитывается Lorentz. */
select last_name
from employees
where level <> 1
start with last_name = 'Lorentz'
connect by prior manager_id = employee_id;
 
 
 
/*3.	Создайте отчёт с отступом, в котором отражается иерархия управления, начиная с сотрудника по фамилии Kochhar. Выведите фамилии, номера менеджеров и номера отделов сотрудников. Назовите столбцы как показано в примере выходных результатов. */
select lpad(last_name, length(last_name)+level-1, '_') as name, manager_id, department_id 
from employees 
start with last_name = 'Kochhar' 
connect by prior employee_id = manager_id;
 
 
/*4.	Создайте отчёт, отражающий иерархию управления компанией. Начните с сотрудника самого высокого уровня и исключите из выходных данных всех служащих с идентификатором должности IT_PROG, а также сотрудника De Haan и всех, кто перед ним отчитывается.*/
select last_name, employee_id, manager_id 
from employees
where job_id <> 'it_prog'
start with employee_id = 100
connect by prior employee_id = manager_id
and last_name != 'De Haan';

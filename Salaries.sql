use SF_sallary;
-- 1.Show All Columns and rows in the table 
select * from salaries;

-- 2. Show all EmployeeName and Jobtitle Columns
select EmployeeName, JobTitle 
From salaries;

-- 3.Show The Number Of Employeen the Table
select count(*) as "Total Employees" from salaries;

-- 4.Show the unique job title in the table
select distinct JobTitle
from salaries;

-- 5. Show the jobtitle and over time pay for all employee with 
-- overtime pay greater than 50000 
select JobTitle,Overtimepay
from salaries
where OvertimePay > 50000;

-- 6. Show the Average BasePay for all employees.
select avg(Basepay) as "Avg BasePay"
from salaries;

-- 7. Show top 10 highest paid employees.
select EmployeeName, TotalPay as "Top 10 High Paying Empoyees"
from salaries
order by TotalPay desc limit 10;

-- 8. Show the Average of Basepay,Overtimepay and OtherPay for each employee
select EmployeeName,(BasePay)+(OvertimePay)+(OtherPay)/3 as 'Avg Pay'
from salaries ;

-- 9. Show all employee who have the word "Maneger" in their job title.
select EmployeeName, Jobtitle from salaries
where JobTitle like "%manager%";

-- 10. Show all employees with a job not equal to "manager".
select EmployeeName, Jobtitle from salaries
where JobTitle Not like "%manager%";

-- 11. Show all employees with a total pay between 50,000 and 75,000.
select EmployeeName, Totalpay
from salaries
where totalPay between 50000 and 75000;

-- 12. Show all employees with a base pay less than 50000
-- or a total pay greater than 100000.
select EmployeeName , BasePay,TotalPay
from salaries
where basepay<50000 or Totalpay>1000000;

-- 13. Show all employees with a total pay benefits value 
-- between 125000 and 150000 and job title containing the word "Director"
select Employeename, Totalpaybenefits ,jobtitle
from salaries
where jobtitle like "%Director%"
and totalpaybenefits between 125000 and  150000;

-- 14. Show all employees ordered by their total pay benifits in desending order.
select * from salaries 
order by totalpay;

-- 15. Show all jobtitle with an average base of at least 1000000 and order them 
-- by the average base pay in decending order 
select jobtitle, avg(basepay) as "AVG_BASEPAY"
from salaries
group by jobtitle
having avg(basepay) >= 100000 
order by AVG_BASEPAY desc;

-- 16. Delete the colume
alter table salaries
drop column Notes;
select * from salaries;

-- 17. Update the basepay of all employee with 
-- the job title containing "Manager" by increasing it by 10%
update salaries
set BasePay =BasePay  * 1.1
where jobtitle = '%Manager%';


-- 18. Delete All Emmployee who have no base pay
select count(*) from salaries
where basepay = 0;
delete from salaries
where basepay = 0;
















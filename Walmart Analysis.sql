SELECT * FROM walmart.sales;
-- ------------------------------------------------
-- --------------- Generic ------------------------
-- How many unique cities dose the data have ?
select distinct city
from sales;
-- ------------------------------------------------
-- In Which city is each branch ? 
select distinct branch 
from sales;
 select distinct city,
 branch 
 from sales;
-- ------------------------------------------------
-- ------------------------- Product --------------
-- How many unique product line dose the data have ?
select count(distinct product_line) 
from sales;

-- What is the most comman payment method
select payment_method,count(payment_method) as Count
from sales
group by payment_method  
order by Count desc;

-- What is the most selling product_line ?
select product_line, count(product_line)as Count
from sales
group by product_line
order by Count desc;

-- What is the total revenue by month ?
select month_name as month, sum(total) as Total_Revenue
from sales
group by month_name
order by Total_Revenue desc;

-- What month had the largest COGS ?
select month_name as month, Sum(cogs) as COGS
from sales
group by month_name 
order by COGS desc;


-- What product line had the largest revenue ?
select product_line as Product, sum(total) as Total_revenue
from sales
group by Product_line
order by Total_revenue
desc ;

-- What is the city had the largesr revenue ?
select city , sum(total) as Total_revenue
from sales
group by city
order by Total_revenue desc ;

-- What Product line had largest VAT ?
select product_line , sum(VAT) as AVD_TAX
from sales 
group by product_line
order by AVD_TAX desc;


-- Which branch sold more product then avarage product sold ?
select branch, sum(quantity) as QNT
from sales 
group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- What is the most comman product line by gender ?
select Gender,product_line,count(gender) as total_count
from sales
group by gender,product_line
order by total_count
desc ;

-- What is the average rating of each product line ?
select round( avg(rating), 2)as avg_rating,product_line
from sales
group by product_line
order by avg_rating
desc ;

-- ---------------------------------------------------------------
-- ----------------Sales------------------------------------------
-- Number of sales made in each time of the day per weekday 
select time_of_day, count(*) as Total_sales
from sales
where day_name = 'Monday'
group by time_of_day
order by Total_sales;

-- Which of the customer types brings the most revenue ?

select customer_type,sum( total) as total_rev
from sales
group by customer_type
order by total_rev desc;

-- Which City Has Largest tax percent/VAT (Value Added to Tax)?
select city, avg(VAT) as total_vat from sales
group by city
order by total_vat desc;

-- which customer type pays the most in VAT?
select 
customer_type , round(avg(VAT),3) as total_sales from sales
group by customer_type
order by total_sales desc;

-- ------------------------------------------------------------------
-- ----------------Customer------------------------------------------
-- How Many unique customer types dose the data have ?
select distinct customer_type
from sales ;

-- How Many unique payment methods dose the data have ?
select distinct payment_method
from sales ;

-- What is the most comman coutomer type ?
select count(customer_type) as Number_of_ctype, customer_type from sales
group by customer_type
order by Number_of_ctype desc;

-- which customer type buys the most ?
select customer_type, count(*) as total_quantity from sales
group by customer_type
order by total_quantity desc;

-- what is the gender of most of the customers?
select gender,count(gender) as gender_cnt from sales
group by gender
order by gender_cnt desc;

-- what is the gender distribution per branch 
select gender,count(gender) as gender_cnt 
from sales
where branch = "C"
group by gender
order by gender_cnt desc;

 
-- Which time of the day do customers give most ratings?
select time_of_day,avg(rating) as avg_rating 
from sales
group by time_of_day
order by avg_rating desc;


-- Which time of the day do customers give the most ratings per branch ?
select time_of_day,avg(rating) as avg_rating , branch
from sales
where branch = "A"
group by time_of_day
order by avg_rating desc;

-- Which day of the week has the best avg ratings ?
select avg(rating) as avg_rating, day_name 
from sales 
group by day_name 
order by avg_rating desc;

-- Which day of the week has the best average ratings per branch ?
select avg(rating) as avg_rating, day_name , branch
from sales 
where branch = "A"
group by day_name 
order by avg_rating desc;

create database walmart_db;
use walmart_db;

show tables;
select * from walmart;

#Exploration

select count(*) from walmart;

select payment_method,
       count(*) as Total_count
from walmart
group by payment_method ;

select  count(distinct Branch)
from walmart;

select max(Quantity) as max_quantity,
	   min(Quantity)as min_quantity
from walmart;

/*Q1.What are the different payment methods, and how many transactions and items were sold with each method?*/
select payment_method,
       count(payment_method) as no_payments,
       sum(quantity) as Item_Sold
from walmart
group by payment_method
order by no_payments desc;

/*Q2.: Which category received the highest average rating in each branch?*/
select * from
(  select branch,
       category,
       round(avg(rating),2)  as avg_rating,
       rank() over (partition by branch order by round(avg(rating),2) desc) as rank_
   from walmart
   group by branch,category
) as R
where rank_=1;

/*Q3.What is the busiest day of the week for each branch based on transaction volume?*/

select *
from
(  Select branch,
	 dayname(STR_TO_DATE(date," %d/%m/%yy")) AS day_name,
     count(*) as no_of_transactions,
     rank() over (partition by branch order by count(*) desc ) as rank_
  from walmart
  group by branch,day_name
) as D
where rank_=1;

/*Q4.Calculate the total quantity of items sold per payment method?*/
select payment_method,
       sum(quantity) as Item_Sold
from walmart
group by payment_method;

/*Q5.What are the average, minimum, and maximum ratings for each category in each city?*/
select city,category,
       round(avg(rating),2) as avg_rating,
       max(rating) as max_rating,
       min(rating) as min_rating
from walmart
group by city,category;

/*Q6.What is the total profit for each category, ranked from highest to lowest?*/
select category,
       sum(total*profit_margin) as Total_profit
from walmart
group by category
order by Total_profit desc;

/*Q7.What is the most frequently used payment method in each branch?*/
with cte as 
( select branch,
       payment_method,
	   count(*) as total_transaction,
       rank() over (partition by branch order by count(*) desc) as rank_
       from walmart
group by 1,2
)
select * from cte where rank_=1;

/*Q8.How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?*/
select branch,
case 
   when (hour(time))< 12 then "morning"
   when (hour(time)) between 12 and 17 then "afternoon"
   else "evening"
   end day_time,
   count(*)
from walmart
group by 1,2
order by 1,3 desc;

/*Q9.Which branches experienced the largest decrease in revenue compared to the previous year?*/

with revenue_2022 as
( select branch,
   sum(total) as revenue
from walmart
where year(STR_TO_DATE(date," %d/%m/%yy"))=2022
group by branch
),
revenue_2023 as
(select branch,
   sum(total) as revenue
from walmart
where year(STR_TO_DATE(date," %d/%m/%yy"))=2023
group by branch
)

select ls.branch,
       ls.revenue as last_year_revenue,
       cs.revenue as current_year_revenue,
       round((ls.revenue-cs.revenue)/ls.revenue *100,2) as revenue_decrease_ratio
from revenue_2022 as ls
join
revenue_2023 as cs
on ls.branch=cs.branch
where 
  ls.revenue>cs.revenue
order by 4 desc;



 





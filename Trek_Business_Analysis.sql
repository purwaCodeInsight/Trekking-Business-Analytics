-- check the data
select * from trek;

-- Top 3 Most Profitable Treks
select trek_location,sum(actual_revenue) as total_revenue
from trek
group by trek_location
order by total_revenue desc
limit 3;

--Highest Cancellation Season
select season,sum(number_of_people_cancelled) as cancelled_people
from trek
group by season
order by cancelled_people desc
limit 1;

--Year wise revenue growth
select year,sum(actual_revenue) as total_revenue
from trek
group by year
order by year;

--Average booking value per city
select customer_city,
round(avg(total_amount)::numeric, 2) as avg_revenue
from trek
group by customer_city
order by avg_revenue desc;


-- Peak season price impact
select season,
avg(price_per_person) as avg_price,
sum(actual_revenue) as total_revenue
from trek
group by season
order by avg_price desc;


--Revenue loss due to cancellations
select sum(total_amount - actual_revenue) as total_revenue_loss from trek;


--Cancellation rate
select 
round(sum(number_of_people_cancelled)::numeric /sum (group_size) * 100,2) as cancellation_rate 
from trek;

--Revenue by age group
select age_group,sum(actual_revenue) as total_revenue
from trek
group by age_group
order by total_revenue desc;

--Average Group size by Trek Location
select trek_location,round(avg(group_size)::numeric) as avg_group_size
from trek
group by trek_location
order by avg_group_size;

--Revenue by season
select season,
round(sum(actual_revenue)::numeric,2) as total_revenue
from trek
group by season
order by total_revenue desc;

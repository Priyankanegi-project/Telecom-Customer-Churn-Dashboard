SELECT * FROM customer

--specified columns selection
select "Customer ID",
       "Gender",
	   "Age",
	   "Customer Status"
	   from customer


--only churned customer
select * from customer
where "Customer Status"='Churned'

--specific city customers
select * from customer
where "City"='Camarillo';

--filtering of age
select "Customer ID",
       "Age",
	   "City",
	   "Customer Status"
	   from customer 
	   where "Age">50;

--total customer count by status
select "Customer Status",
       count(*) as total_customer
	   from customer
	   group by "Customer Status"


--average revenue by contract type
select "Contract",
      Avg("Total Revenue") as avg_revenue,
	  count(*) as customer_count
	  from customer 
	  group by "Contract"
	  order by avg_revenue desc;

--city wise churn count
select "City",
       count(*) as churned_customer
	   from customer 
	   where "Customer Status"='Churned'
	   group by "City"
	   order by churned_customer desc 
	   limit 10;

--high value staued customer
select "Customer ID",
       "Total Revenue",
	   "Tenure in Months"
	   from customer
	   where "Customer Status"='Stayed'
	   and "Total Revenue">8000
	   order by "Total Revenue" desc

--revenue lost due to churn
select "Customer Status",
       count(*) as customers,
	   sum("Total Revenue") as total_revenue,
	   avg("Total Revenue") as avg_revenue,
	   max("Total Revenue") as max_revenue,
	   min("Total Revenue") as min_revenue
	   from customer
	   group by "Customer Status"

--rank customer by revenue within city
select "Customer ID",
       "City",
	   "Total Revenue",
	   "Customer Status",
	   rank() over(partition by "City" order by "Total Revenue" desc)
	   as revenue_rank
	   from customer;


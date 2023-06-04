SET SQL_SAFE_UPDATES = 0;

create database db1;
use db1;

select * from data_min_delta;
select * from data_min_total;
select * from timeseries;
select * from data_min_delta;
select * from data_min_delta7;
select * from data_min_delta21_14;
select * from data_min_districts;

UPDATE data_min_districts
SET meta_tested = STR_TO_DATE(meta_tested, '%m/%d/%Y');

-----------------------------------------------------------------------------------------------------------------------

-- 1. Weekly evolution of number of confirmed cases, recovered cases, deaths, tests. For 
-- instance, your dashboard should be able to compare Week 3 of May with Week 2 of August

create table Q1 as (
select year(meta_tested), month(meta_tested), wee(meta_tested), sum(total_confirmed), sum(total_deceased), sum(total_recovered), sum(total_tested) 
from data_min_districts
group by year(meta_tested), month(meta_tested), week(meta_tested)
order by 1, 2 );


SELECT 
    DATEPART(wk, meta_tested) AS WeekNumber,
    DATEPART(mm, meta_tested) AS MonthNumber,
    DATENAME(mm, meta_tested) AS MonthName
FROM 
    data_min_districts
GROUP BY 
	DATEPART(wk, meta_tested),
    DATEPART(mm, meta_tested),
    DATENAME(mm, meta_tested);


SELECT 
    WEEK(meta_tested) AS WeekNumber,
    MONTH(meta_tested) AS MonthNumber,
    MONTHNAME(meta_tested) AS MonthName
FROM 
    data_min_districts
GROUP BY 
    WEEK(meta_tested),
    MONTH(meta_tested),
    MONTHNAME(meta_tested);
-----------------------------------------------------------------------------------------------------------------------

-- 2. Let’s call testing ratio(tr) = (number of tests done) / (population), now 
-- categorise every district in one of the following categories:
--  Category A: 0.05 ≤ tr ≤ 0.1
--  Category B: 0.1 < tr ≤ 0.3
--  Category C: 0.3 < tr ≤ 0.5
--  Category D: 0.5 < tr ≤ 0.75
--  Category E: 0.75 < tr ≤ 1.0
-- Now perform an analysis of number of deaths across all category. Example, what was the 
-- number / % of deaths in Category A district as compared for Category E districts


create table Q2 as (

    with cte1 as(
    select cm.States, avg((ct.tested) / (cm.population)) as testing_ratio, sum(ct.deceased)
    from data_min_meta cm join data_min_total ct on cm.states = ct.states 
    group by cm.states)
    
    select *, case when testing_ratio between 0.05 and 0.1 then "Category A" WHEN 
    testing_ratio between 0.1 and 0.3 then "Category B" WHEN
    testing_ratio between 0.3 and 0.5 then "Category C" WHEN
    testing_ratio between 0.5 and 0.75 then "Category D" else 
    "Category E" END AS Category from cte1 ) ;

-----------------------------------------------------------------------------------------------------------------------

-- 3. Generate 2 - 3 insights that is very difficult to observe

    -- INSIGHTS
    -- state wise testing and confirmed cases
    
    create table Q3_1 as (
    select states, sum(tested), sum(confirmed) from data_min_total 
    group by states 
    order by sum(tested) desc );
    
    -- State wise recovery rate
      create table Q3_2 as (
    select states, (recovered/confirmed) as recovery_rate from data_min_total 
    group by states) ;
    
    -- 10 most affected Districts from Delta Variant
    -- select * from data_min_districts;  
    
      create table Q3_3 as (
    select districts, sum(delta_confirmed),sum(delta_deceased) as sd from data_min_districts 
    group by districts
    order by sd desc limit 10);

-----------------------------------------------------------------------------------------------------------------------

-- 4. Compare delta7 confirmed cases with respect to vaccination

  create table Q4 as (
select states, sum(confirmed), sum(vaccinated1), sum(vaccinated2) 
from data_min_delta7 
group by states );
-----------------------------------------------------------------------------------------------------------------------

-- 5. Make at least 2 such KPI that presents the severity of case in different states (example: Any 
-- numerical measure to comment on how severe were the cases in Bihar as compared to that of 
-- Kerala)

  create table Q5 as (
select states, sum(deceased) from data_min_total 
group by states 
order by 2 desc );
-----------------------------------------------------------------------------------------------------------------------

-- 6. Categorise total number of confirmed cases in a state by Months and come up with that one 
-- month which was worst for India in terms of number of case

create table Q6 as (

with cte1 as(
select states, month(dates) as mnth, sum(total_confirmed) as sm, dense_rank() over(partition by states order by sum(total_confirmed) desc) as rnk from timeseries group by states, month(dates))

select states, mnth, sm from cte1 where rnk =1 
group by states, mnth);
-----------------------------------------------------------------------------------------------------------------------
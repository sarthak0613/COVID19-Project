# COVID-19 India Analysis
![brunswick-streamlining-covid-animation](https://github.com/sarthak0613/COVID19-Project/assets/135547703/d687733b-5eac-4e72-8344-7069efce2e32)


## --Introduction--


#### Welcome to the COVID-19 India Data Analysis repository! 🦠📊

In these unprecedented times, understanding the impact of the COVID-19 pandemic is crucial. This repository serves as a hub for exploring and analyzing COVID-19 data specific to India, providing valuable insights into the virus's spread, its effects, and the efforts taken to combat it.



##  --Aim of the analysis--


To showcase the severity of COVID-19 cases in India, state wise & district wise and to study about the vaccination drive in India.

## --Approach--


![Mind Map Visual Charts Presentation in Blue White Teal Simple Style (1)](https://github.com/sarthak0613/COVID19-Project/assets/135547703/19a56075-b168-45ec-bc20-7d903b163208)



### Data Extraction & Cleaning
- To get the data, used official covid19india API (Application programming interface).
1. https://data.covid19india.org/v4/min/data.min.json
2. https://data.covid19india.org/v4/min/timeseries.min.json
with the help of pandas and other usefull library extract the data from above API's using two methods and also clean the data set while using error handling.

- In this method created CSV file and then try to extract the data from nested dictionaries.

- In second method, directly extracted the data from API using JSON library and created small data frames and at the end joined them.

### Some code snippets-

- The code snippet below creates a Pandas DataFrame from nested JSON data representing COVID-19 statistics for different states and dates.
- It flattens and structures the data, then saves it to a CSV file.
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/e8b0c135-1c2a-49ed-999c-b21f80bbfb81)

- The raw csv that was created looked something like this.
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/1f5e8bbe-a72e-46fe-bf82-5cc2415e1af3)

- This code snippet retrieves a list of state names from the data dictionary and prints the list of states.

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/8d2892b7-54b1-4f2e-afe6-98e5fd93e03f)

- The first line drops the column named "other" from the DataFrame data_min_delta7, fills any missing values (NaN) with zeros, and then saves the cleaned DataFrame to a CSV file named "data_min_delta7.csv" in the "cleaned_data" directory without including the index.
- The second line performs the same operations as the first line but doesn't save the cleaned DataFrame to a file; it only displays the result in the output.
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/bd608d92-52d5-49a5-8ec2-3805398ca12d)

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/21706686-fe84-4a7c-ae33-9508a0b82901)


### CSV Creation-

We stored the data extracted after cleaning it, we further did null handling in excel.

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/57151bff-802c-493b-bbdb-c4f09c9cf4ce)

### SQL Aggregation-

Used SQL to derive insights and do major aggregtaions. Wrote SQL queries to show some insights.

- These SQL queries extract date-related information from the "data_min_districts" table, grouping data by year, month, and week, and calculating sums of COVID-19 statistics.
- They serve to analyze and summarize the data by different time intervals.
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/76b6f760-3a05-4f43-91a8-c7bddae56945)

- This SQL query creates a table Q2 by calculating the testing ratio and the total number of deceased cases for each state.
- It assigns a category (A, B, C, D, or E) based on testing ratio(number of tests done / population) range, and the data is grouped by state.
- Category A: 0.05 ≤ tr ≤ 0.1
- Category B: 0.1 < tr ≤ 0.3
- Category C: 0.3 < tr ≤ 0.5
- Category D: 0.5 < tr ≤ 0.75
- Category E: 0.75 < tr ≤ 1.0
  
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/ed7343bf-2d71-40a9-b48e-9421560f9942)

- This SQL query creates a table Q3_3 that summarizes data by districts.
- It calculates the sum of delta confirmed cases and delta deceased cases for each district, orders the results in descending order of the sum of deceased cases, and limits the output to the top 10 districts.
![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/4f22fe60-128c-4305-81fb-1ed9323d8761)


## --Insights--


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/fb5bd961-f373-468a-acc5-fc4799d86df8)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/e14497cb-351c-4d91-a10a-f116bc6f79d1)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/8c23769c-1fdc-4778-8fef-acb6ed3f8811)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/1a0e8c0f-5647-40db-802c-dda4687fc04d)


## --Dashboard--

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/cbb8d588-a7a2-4681-8e01-4523700b5fbc)

## --Some key Insights--

- Maharashtra had the most number of confirmed cases.
- Daman & Diu had the best recovery rate.
- Ernakulum district of Kerala had the most number of delta confirmed cases.
- Most number of testing was carried out in Uttar Pradesh.


## --Problems Faced--

- Excessive amount of null values made it difficult for analysis, so we had to replace with zero, mean, etc.
- Ensuring the consistency and timeliness of COVID-19 data was a persistent challenge.
- Mapping COVID-19 data to geographical regions within India presented challenges due to variations in naming conventions and administrative boundaries.

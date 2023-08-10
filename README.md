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

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/798b991f-fe98-4e34-9bba-7baaa1aebdf9)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/e9e93d9e-4cee-47dd-85b7-4a799712c049)


### CSV Creation-

We stored the data extracted after cleaning it, we further did null handling in excel.


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/57151bff-802c-493b-bbdb-c4f09c9cf4ce)


### SQL Aggregation-

Used SQL to derive insights and do major aggregtaions. Wrote SQL queries to show some insights.


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/46519470-5e3e-483d-9ac8-b51c737a2ff1)


## --Insights--


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/fb5bd961-f373-468a-acc5-fc4799d86df8)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/e14497cb-351c-4d91-a10a-f116bc6f79d1)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/8c23769c-1fdc-4778-8fef-acb6ed3f8811)


![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/1a0e8c0f-5647-40db-802c-dda4687fc04d)


## --Dashboard--

![image](https://github.com/sarthak0613/COVID19-Project/assets/135547703/cbb8d588-a7a2-4681-8e01-4523700b5fbc)





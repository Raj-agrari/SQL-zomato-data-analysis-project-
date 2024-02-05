# SQL-zomato-data-analysis-project-
zomato Data Exploration and Analysis with SQL (SQL SERVER)  Most of us know that Zomato is an Indian multinational restaurant aggregator and food delivery company. The idea of analysing the Zomato_dataset is to get the overview of what actutally is happening in their business. Zomato Dataset consist of more than 9000 rows with columns.such as Restaurants_id, Restaurants_name, City, Location, Cuisines and many more...

While Exploring Data with SQL, I was working on the following things...
 Checked all the details of table such column name, data types and constraints
 Checked for duplicate values in [RestaurantId] column
 Removed unwanted columns from table
 Merged 2 differnt tables and added the new column of Country_Name with the help of primary key as [CountryCode] column
 Identitfied and corrected the mis-spelled city names
 Counted the no.of restaurants by rolling count/moving count using windows functions
 Checked min,max,avg data for votes, rating & currency column.
 Created new category column for rating

According to this Zomato Dataset, 90.67% of data is related to restaurants listed in India followed by USA(4.45%).
Out of 15 Countries only 2 countries provides Online delivery options to their customers, to be precised only 28.01% of restaurants in India and 46.67% of restaurants in UAE provides online delivery options.
Connaught Place in New Delhi has the most listed restaurants (122) follwed by Rajouri Garden (99) and Shahdara (87)
In new delhi connaught place natural ice cream has highest rating resturant 4.9 / 5.0
Pom Pom's Teahouse and Sandwicheria in usa are highest rated resturant where average cost for two is 25 dollars and have voting of 1457

SELECT * FROM zomato.zomato_dataset;

/*duplicate resturant id in dataset*/

SELECT RestaurantID,count(RestaurantID)
from zomato_dataset
group by RestaurantID
having RestaurantID;

/* Remove Unwanted Coloum From Table*/

ALTER TABLE zomato_dataset
DROP COLUMN Locality ;

SELECT * FROM zomato.zomato_dataset;

/*count different country code from zomato_dataset*/
select CountryCode,count(CountryCode)
from zomato_dataset
group by CountryCode
having CountryCode;

/*Merged 2 differnt tables and added the new column of Country_Name with the help of
primary key as [CountryCode] column*/

create table country(
country_code int primary key,
country_name varchar(50)
);

insert into country values (162,"Philippines");
insert into country values (30,"brazil");
insert into country values (216,"USA");
insert into country values (14,"australia");
insert into country values (184,"singapore");
insert into country values (37,"canada");
insert into country values (1,"india");
insert into country values (214,"United Arab Emirates");
insert into country values (94,"indonesia");
insert into country values (148,"New Zeland");
insert into country values (215,"United kingdom");
insert into country values (166,"qatar");
insert into country values (189,"south africa");
insert into country values (191,"sri lanka");
insert into country values (208,"turkey");

select * from country;

select* from zomato_dataset
inner join country 
on country.country_code = zomato_dataset.CountryCode;

update zomato_dataset
inner join country
on country.country_code = zomato_dataset.CountryCode
set address = country_name
where CountryCode = country_code;

alter table zomato_dataset
rename column Address to country;

select*from zomato_dataset;


/*remove unwanted mis spelled words from zomato dataset*/

SELECT DISTINCT City FROM zomato.Zomato_dataset
WHERE CITY LIKE '%?%';		

SELECT REPLACE(CITY,'?','i') 
FROM zomato_dataset WHERE CITY LIKE '%?%';

UPDATE zomato.Zomato_dataset
set city = replace(city,'?','i')
where city = 'S?o Paulo';

UPDATE zomato.Zomato_dataset
set city = replace(city,'?','i')
where city = 'Bras?lia';

UPDATE zomato.Zomato_dataset
set city = replace(city,'?','i')
where city = '?stanbul';
select*from zomato_dataset;

/*rolling count*/

select RestaurantName, count(RestaurantName)
from zomato_dataset
group by RestaurantName;

/*Checked min,max,avg data for votes, raƟng & currency column*/

/*FINDING THE BEST RESTAURANTS WITH MODRATE COST FOR TWO IN INDIA HAVING INDIAN CUISINES*/

SELECT *
FROM zomato_dataset
WHERE country = 'INDIA'
AND Has_Table_booking = 'YES'
AND Has_Online_delivery = 'YES'
AND Price_range <= 3
AND Votes > 1000
AND Average_Cost_for_two < 1000
AND Rating > 4
AND Cuisines LIKE '%INDIA%';

/*FINDING THE BEST RESTURANTS WITH MODERATE COST FOR TWO IN USA HAVING INDIAN CUISINES*/

SELECT *
FROM zomato_dataset
where country = 'USA'
AND Has_Table_booking = 'No'
and Has_Online_delivery = 'No'
and Price_range <=3
and votes > 1000
and Average_Cost_for_two < 1000
and rating > 4
and CuIsines like '%American%';

/*FIND ALL THE RESTAURANTS THOSE WHO ARE OFFERING TABLE BOOKING OPTIONS WITH PRICE RANGE AND HAS HIGH RATING*/

SELECT*
FROM zomato_dataset
where Has_Table_booking = 'yes'
and Price_range <=3
and Rating >= 4.5
AND Currency = 'Indian Rupees(RS.)';


/*AVG RATING OF RESTS LOCATION WISE*/

SELECT COUNTRY,City,RestaurantName,
count(RestaurantName),
Round(AVG(Rating),0)
FROM zomato_dataset
GROUP BY country,City,RestaurantName;

/*new delhi connaugt place have 122 resturant*/

select LocalityVerbose,City,
count(RestaurantName),
round(avg(Rating),0)
from zomato_dataset
group by LocalityVerbose,City;

/* in new delhi at connaught place natural ice cream have highest rating of 4.9*/

select localityverbose,city,RestaurantName,Rating
from zomato_dataset
where LocalityVerbose like '%connaught%'
group by localityverbose,city,RestaurantName,Rating
order by Rating desc;

/* Pom Pom's Teahouse and Sandwicheria in usa are highest rated resturant where average cost for two is 25 dollars and have voting of 1457*/
  
SELECT *
FROM zomato_dataset
where country = 'USA'
and Price_range <=3
and votes > 1000
and Average_Cost_for_two < 1000
and rating > 4
order by Rating desc;



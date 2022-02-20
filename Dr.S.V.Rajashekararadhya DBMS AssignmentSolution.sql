-- /* Dr.S.V.RajashekararadhyaGradedsignment4DBMS*/
/* delete database if already exists*/
drop database if exists TravelOnTheGo;
/* create database OrderDatabase*/
create database TravelOnTheGo;
/* use database OrderDatabase*/
use TravelOnTheGo;	
-- Create table passenger
create table PASSENGER
(Passenger_name varchar (50),
Category varchar (50),
Gender varchar (10),
Boarding_City varchar (100),
Destination_City varchar (100),
Distance int (10),
Bus_Type varchar (100)
);
-- create table price 
create table PRICE
(
Bus_Type varchar (100),
Distance int (10),
Price int (10)
);
-- insert into employee values(1, 'Aman','IT', 12000.0);
insert into PASSENGER values ('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into PASSENGER values ('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into PASSENGER values ('Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru',600 , 'Sleeper');
insert into PASSENGER values ('Khusboo', 'AC', ' F', 'Chennai', ' Mumbai',1500 , 'Sleeper');
insert into PASSENGER values ('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji',1000 , 'Sleeper');
insert into PASSENGER values ('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad',500 , 'Sitting');
insert into PASSENGER values ('Hemant', 'Non-AC', 'M', 'Panajii', 'Mumbai',700 , 'Sleeper');
insert into PASSENGER values ('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into PASSENGER values ('Piyush', 'AC', 'M', 'Pune', 'Nagpur',700 , 'Sitting');
-- select * from PASSENGER;
/* to Insert Price Value to table Price */
insert into PRICE values ('Sleeper', 350, 770);
insert into PRICE values ('Sleeper', 500, 1100);
insert into PRICE values ('Sleeper', 600, 1320);
insert into PRICE values ('Sleeper', 700, 1540);
insert into PRICE values ('Sleeper', 1000, 2200);
insert into PRICE values ('Sleeper', 1200, 2640);
insert into PRICE values ('Sleeper', 1500, 2700);
insert into PRICE values ('Sitting', 500, 620);
insert into PRICE values ('Sitting', 600, 744);
insert into PRICE values ('Sitting', 700, 868);
insert into PRICE values ('Sitting', 1000, 1240);
insert into PRICE values ('Sitting', 1200, 1488);
insert into PRICE values ('Sitting', 1500, 1860);

-- select * from PRICE ;

/* Query 3 Hom many females  passengers travelled for a mimimum distance of 600 KMs?*/
select count(case when (gender) = 'F' then 1 end) female from PASSENGER where distance>=600;

/* Query 3 Hom many  male passengers travelled for a mimimum distance of 600 KMs?*/
select count(case when (gender) = 'M' then 1 end) male from PASSENGER where distance>=600;

/*Query 4 Find the mimimum ticket price for Sleeper Bus */
select min(price) from price where Bus_Type = 'Sleeper';

/* Query 5 Select passanger names whose names start with character 'S' */
select * from passenger where passenger_name  like 'S%';

/* Query 6 Calculate price charged for each passanger displaying passanger name, 
boarding city, destination city, bus_type, price in the oputput */
select p1.passenger_name, p1.boarding_city, 
p1.destination_city, p1.bus_type, 
p2.price from passenger p1, price p2 where
p1.distance = p2.distance and
p1.bus_type = p2.bus_type;

/*Query 7 What are the passenger names/s and his/her ticket price 
who travelled in the sitting bus for a duration of 1000KMs */
select p1.passenger_name, p1.boarding_city, 
p1.destination_city, p1.bus_type, 
p2.price from passenger p1, price p2 where
p1.distance = 1000 and p1.bus_type = 'sitting' and
p2.distance = 1000 and p2.bus_type = 'sitting';

/*  Query 8 what will be the sitting and sleeper bus charge for 
pallavi to travel from Bangalore to Panaji */
select distinct p1.passenger_name, 
p1.destination_city as boarding_city, 
p1.boarding_city as destination_city,
p2.bus_type, p2.price from 
passenger p1, price p2 where 
passenger_name = 'pallavi' and p1.distance = p2.distance ;

/* Query 9 List the distance from the passenger table which are 
unique (non-repeated distances) in descending order*/
select distinct distance from passenger order by distance desc;

/* query 10 display the passenger name and percentage of distance
 travelled by that passenger from the total distance travelled by 
 all passengers without using user variable*/
select passenger_name, distance *100/(select sum(distance) from passenger)
from passenger; 

/* Query 11 Display the distance, price in three categories in table price*/
/* a) Expensive if the cost is more than 1000*/
/* b) Average cost if the cost is less than 1000 and greater than 500*/
/* cheap otherwise*/
select distance, price,
case
	when price > 1000 then 'Expensive'
    when price > 500 then 'Average cost'
else 'cheap otherwise'
end as costCategories
from PRICE;


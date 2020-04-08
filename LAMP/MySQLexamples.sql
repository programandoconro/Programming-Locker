## creacion de tabla dentro de database.

create database test;
show databases;
use test
create table data1 (Id int);

#####################

select round(sum(LAT_N),2), round( sum(LONG_W),2) from STATION

SELECT ROUND (MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345

SELECT ROUND (LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

SELECT ROUND (MIN(LAT_N),4)FROM STATION WHERE LAT_N > 38.7780;

select round(abs(min(lat_n)- max(lat_n)) + abs(min(long_w)- max(long_w)),4) from  station;

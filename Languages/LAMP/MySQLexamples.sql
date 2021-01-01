## creacion de tabla dentro de database.

create database test;
show databases;
use test;
create table data (Id int, Contagiados int, Recuperados int, Muertos int);
insert into data values (0,0,0,0);
alter table data add (Fecha date);
select * from data; 
insert into data values (1,7,0,0,'2020/03/04');
delete from data where Id = 0;

# Usuarios

CREATE USER 'test' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON test.* TO 'test';

#### Examples #####################

select round(sum(LAT_N),2), round( sum(LONG_W),2) from STATION;
SELECT ROUND (MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345;
SELECT ROUND (LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
SELECT ROUND (MIN(LAT_N),4)FROM STATION WHERE LAT_N > 38.7780;
select round(abs(min(lat_n)- max(lat_n)) + abs(min(long_w)- max(long_w)),4) from  station;

                                               

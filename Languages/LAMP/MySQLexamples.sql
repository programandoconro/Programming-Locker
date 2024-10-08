SYSTEM echo "Hello world SQL"; 

CREATE DATABASE test;
SHOW DATABASES;
USE test;
CREATE TABLE data (Id int, Contagiados int, Recuperados int, Muertos int);

INSERT INTO data values (0,0,0,0);

ALTER TABLE data ADD (Fecha date);
SELECT * FROM data; 
INSERT INTO data VALUES (1,7,0,0,'2020/03/04');

DELETE FROM data WHERE Id = 0;
DELETE FROM TABLE data;
DROP TABLE data;
ALTER TABLE data DROP COLUMN Fecha;

CREATE USER 'user01' IDENTIFIED BY 'password12345';
GRANT ALL PRIVILEGES ON test.* TO 'test';

#### Solutions to online tests #####################

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2) FROM STATION;
SELECT ROUND (MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345;
SELECT ROUND (LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
SELECT ROUND (MIN(LAT_N),4)FROM STATION WHERE LAT_N > 38.7780;
SELECT ROUND(ABS(MIN(lat_n) - MAX(lat_n)) + ABS(MIN(long_w)- MAX(long_w)),4) FROM STATION;

                                               

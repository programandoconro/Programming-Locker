# Mariadb-MySQL

CREATE DATABASE kanji;
SHOW DATABASES;
USE kanji;
CREATE TABLE hiragana (romanji VARCHAR (31), 
rom_A VARCHAR(31),
rom_I VARCHAR(31),
rom_U VARCHAR(31),
rom_E VARCHAR(31), 
rom_O VARCHAR(31),
rom_N VARCHAR(31)
);

DESCRIBE hiragana;

# Para agregar archivo csv a la base de datos ir a  /var/lib/mysql/kanji y colocarlo. 

LOAD DATA INFILE 'hiragana.csv' INTO TABLE hiragana;

SELECT * FROM hiragana;

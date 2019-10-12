# Mariadb-MySQL

CREATE DATABASE kanji;
SHOW DATABASES;
USE kanji;
CREATE TABLE hiragana ( romanji TEXT(31),
A TEXT(31),
I TEXT(31),
U TEXT(31),
E TEXT(31), 
O TEXT(31),
N TEXT(31)
);

INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("","あ","い","う","え","お","ん");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("X","ぁ","ぃ","ぇ","ぉ","ぉ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("a","i","u","e","o","n");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("a","i","u","e","o","n");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("a","i","u","e","o","n");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("a","i","u","e","o","n");


DESCRIBE hiragana;

# Para agregar archivo csv a la base de datos ir a  /var/lib/mysql/kanji y colocarlo. 

LOAD DATA INFILE 'hiragana.csv' INTO TABLE hiragana;

SELECT * FROM hiragana;

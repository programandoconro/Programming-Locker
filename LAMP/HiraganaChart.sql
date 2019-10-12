# Mariadb-MySQL

CREATE DATABASE kanji;
SHOW DATABASES;
USE kanji
DROP TABLE hiragana;
CREATE TABLE hiragana ( romanji TEXT(31),
A TEXT(31),
I TEXT(31),
U TEXT(31),
E TEXT(31), 
O TEXT(31),
N TEXT(31)
);

DESCRIBE hiragana

INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("","あ","い","う","え","お","ん");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("X","ぁ","ぃ","ぇ","ぉ","ぉ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("K", "か","き" ,"く", "け", "こ","" );
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Ky","きゃ","","きゅ","","きょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("S","さ","","す","せ","そ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Sh","しゃ","し","しゅ","","しょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("T","た","","","て","と","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Ts","","","つ","","","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Ch","ちゃ","ち","ちゅ","ちぇ","ちょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("N","な","に","ぬ","ね","の","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Ny","にゃ","","にゅ","","にょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("h","は","ひ","ふ","へ","ほ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("","あ","い","う","え","お","ん");

SELECT * FROM hiragana;
DESCRIBE hiragana;

# Para agregar archivo csv a la base de datos ir a  /var/lib/mysql/kanji y colocarlo. LOAD DATA INFILE 'hiragana.csv' INTO TABLE hiragana;



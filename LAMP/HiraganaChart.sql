# Mariadb-MySQL

CREATE DATABASE kanji;
SHOW DATABASES;
USE kanji
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
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("H","は","ひ","ふ","へ","ほ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Hy","ひゃ","","ひゅ","","ひょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("F","","","ふ","","","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("M","ま","み","む","め","も","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("My","みゃ","","みゅ","","みょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Y","や","","ゆ","","よ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("R","ら","り","る","れ","ろ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Ry","りゃ","りい","りゅ","りぇ","りょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("W","わ","ゐ","","","を","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("G","が","ぎ","ぐ","げ","ご","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Gy","ぎゃ","","ぎゅ","","ぎょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Z","ざ","","じ","","","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("J","じゃ","","じ","じゅ","","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("D","だ","","づ","で","ど","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("B","ば","び","ぶ","べ","ぼ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("By","びゃ","","びゅ","","びょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("P","ぱ","ぴ","ぷ","ぺ","ぽ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("Py","ぴゃ","","ぴゅ","","ぴょ","");
INSERT INTO hiragana (romanji,A,I,U,E,O,N) VALUES ("V","","","う゛","","","");

SELECT * FROM hiragana;
DESCRIBE hiragana;

# Para agregar archivo csv a la base de datos ir a  /var/lib/mysql/kanji y colocarlo. LOAD DATA INFILE 'hiragana.csv' INTO TABLE hiragana;



4.
mysql> create database book;
Query OK, 1 row affected (0.02 sec)

mysql> use book;
Database changed
mysql> create table book(s_no int not null,b_name varchar(255)not null,author varchar(255)not null,price decimal(10,2)not null,publisher varchar(255)not null,primary key(s_no));
Query OK, 0 rows affected (0.01 sec)

mysql> desc book;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| s_no      | int(11)       | NO   | PRI | NULL    |       |
| b_name    | varchar(255)  | NO   |     | NULL    |       |
| author    | varchar(255)  | NO   |     | NULL    |       |
| price     | decimal(10,2) | NO   |     | NULL    |       |
| publisher | varchar(255)  | NO   |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
5 rows in set (0.03 sec)

mysql> show tables;
+----------------+
| Tables_in_book |
+----------------+
| book           |
+----------------+
1 row in set (0.00 sec)

mysql> savepoint b;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into book(s_no,b_name,author,price,publisher)values(1,'book 1','author 1',10.50,'publisher a');
Query OK, 1 row affected (0.00 sec)

mysql>  insert into book(s_no,b_name,author,price,publisher)values(2,'book 2','author 2',12.25,'publisher b');
Query OK, 1 row affected (0.00 sec)

mysql>  insert into book(s_no,b_name,author,price,publisher)values(3,'book 3','author 3',8.75,'publisher c');
Query OK, 1 row affected (0.00 sec)

mysql>  insert into book(s_no,b_name,author,price,publisher)values(4,'book 4','author 4',15.00,'publisher d');
Query OK, 1 row affected (0.00 sec)

mysql> rollback to b;
ERROR 1305 (42000): SAVEPOINT b does not exist.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5.
mysql>create database bnk;
Query OK, 1 row affected (0.02 sec)
mysql> use bnk;
Database changed
mysql> create table banker(s_no int,cust_name varchar(255),acc_no varchar(255),balance decimal(10,2),cas_branch varchar(255));
Query OK, 0 rows affected (0.01 sec)

mysql> select*from bnk where acc_no='1234567890';
ERROR 1146 (42S02): Table 'bnk.bnk' doesn't exist
mysql> select*from banker where acc_no='1234567890';
Empty set (0.00 sec)

mysql> desc bnk;
ERROR 1146 (42S02): Table 'bnk.bnk' doesn't exist
mysql> desc banker;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| s_no       | int(11)       | YES  |     | NULL    |       |
| cust_name  | varchar(255)  | YES  |     | NULL    |       |
| acc_no     | varchar(255)  | YES  |     | NULL    |       |
| balance    | decimal(10,2) | YES  |     | NULL    |       |
| cas_branch | varchar(255)  | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into banker values (132,'prasanth',1102,2000.0,'vizag');
Query OK, 1 row affected (0.00 sec)
mysql> insert into banker values(132,'chintu',2102,5000.0,'chennai');
Query OK, 1 row affected (0.02 sec)

mysql> select*from banker;
+------+-----------+--------+---------+------------+
| s_no | cust_name | acc_no | balance | cas_branch |
+------+-----------+--------+---------+------------+
|  132 | prasanth  | 1102   | 2000.00 | vizag      |
|  132 | chintu    | 2102   | 5000.00 | chennai    |
+------+-----------+--------+---------+------------+
2 rows in set (0.00 sec)
mysql> update banker set s_no=133 where cust_name='prasanth';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select*from banker;
+------+-----------+--------+---------+------------+
| s_no | cust_name | acc_no | balance | cas_branch |
+------+-----------+--------+---------+------------+
|  133 | prasanth  | 1102   | 2000.00 | vizag      |
|  132 | chintu    | 2102   | 5000.00 | chennai    |
+------+-----------+--------+---------+------------+
2 rows in set (0.00 sec)
mysql> select*from banker where cas_branch in('vizag','chennai');
+------+-----------+--------+---------+------------+
| s_no | cust_name | acc_no | balance | cas_branch |
+------+-----------+--------+---------+------------+
|  133 | prasanth  | 1102   | 2000.00 | vizag      |
|  132 | chintu    | 2102   | 5000.00 | chennai    |
+------+-----------+--------+---------+------------+
2 rows in set (0.00 sec)
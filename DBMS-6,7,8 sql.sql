6.
mysql> use mysql;
Database changed
mysql> create table projects(S_no int(4),p_name varchar(10),coordinators int(5),p_price int(5),location varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> desc project;
ERROR 1146 (42S02): Table 'mysql.project' doesn't exist
mysql> desc projects;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| S_no         | int(4)      | YES  |     | NULL    |       |
| p_name       | varchar(10) | YES  |     | NULL    |       |
| coordinators | int(5)      | YES  |     | NULL    |       |
| p_price      | int(5)      | YES  |     | NULL    |       |
| location     | varchar(20) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> select location,count(*) as count from projects group by location;
Empty set (0.01 sec)

mysql> insert into projects values(123,'guru',3,100,'chennai');
Query OK, 1 row affected (0.00 sec)

mysql> select location, count(*) as count from projects group by location;
+----------+-------+
| location | count |
+----------+-------+
| chennai  |     1 |
+----------+-------+
1 row in set (0.00 sec)

mysql> insert into projects values(1,'cherry',3,200,'china');
Query OK, 1 row affected (0.00 sec)

mysql> select location,count(*) as count from projects group by location;
+----------+-------+
| location | count |
+----------+-------+
| chennai  |     1 |
| china    |     1 |
+----------+-------+
2 rows in set (0.00 sec)

mysql> insert into projects values(13,'guru',3,100,'chennai');
Query OK, 1 row affected (0.00 sec)

mysql> select location,count(*) as count from projects group by location;
+----------+-------+
| location | count |
+----------+-------+
| chennai  |     2 |
| china    |     1 |
+----------+-------+
2 rows in set (0.00 sec)

mysql> select * from projects order by coordinators;
+------+--------+--------------+---------+----------+
| S_no | p_name | coordinators | p_price | location |
+------+--------+--------------+---------+----------+
|  123 | guru   |            3 |     100 | chennai  |
|    1 | cherry |            3 |     200 | china    |
|   13 | guru   |            3 |     100 | chennai  |
+------+--------+--------------+---------+----------+
3 rows in set (0.00 sec)

mysql> insert into projects values(13,'guru',1,100,'chennai';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into projects values(13,'guru',1,100,'chennai');
Query OK, 1 row affected (0.00 sec)

mysql> insert into projects values(3,'guru',2,200,'os');
Query OK, 1 row affected (0.00 sec)

mysql> select * from projects order by coordinators;
+------+--------+--------------+---------+----------+
| S_no | p_name | coordinators | p_price | location |
+------+--------+--------------+---------+----------+
|   13 | guru   |            1 |     100 | chennai  |
|    3 | guru   |            2 |     200 | os       |
|  123 | guru   |            3 |     100 | chennai  |
|    1 | cherry |            3 |     200 | china    |
|   13 | guru   |            3 |     100 | chennai  |
+------+--------+--------------+---------+----------+
5 rows in set (0.00 sec)

mysql>
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

7.mysql> use mysql;
Database changed
mysql> create table prasanth(s_no int(20),name varchar(20),designation varchar(20),branch varchar(20));
Query OK, 0 rows affected (0.02 sec)

mysql> desc prasanth;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| s_no        | int(20)     | YES  |     | NULL    |       |
| name        | varchar(20) | YES  |     | NULL    |       |
| designation | varchar(20) | YES  |     | NULL    |       |
| branch      | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> select * from prasanth;
Empty set (0.00 sec)

mysql> insert into prasanth values(123,'guru','manager','chennai';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into prasanth values(123,'guru','man','chennai');
Query OK, 1 row affected (0.00 sec)

mysql> select name from prasanth where s_no in(select s_no from prasanth where designation ='man' and branch ='chennai');
+------+
| name |
+------+
| guru |
+------+
1 row in set (0.00 sec)

mysql>
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
8.
mysql> select * from prasanth;
Empty set (0.00 sec)

mysql> insert into prasanth values(123,'guru','man','chennai');
Query OK, 1 row affected (0.00 sec)

mysql> select name from prasanth where s_no in(select s_no from prasanth where designation ='man' and branch ='chennai');
+------+
| name |
+------+
| guru |
+------+
1 row in set (0.00 sec)

mysql> create view prasanth_view as
    -> select s_no,name,designation,branch
    -> from prasanth; 
Query OK, 0 rows affected (0.01 sec)

mysql> insert into prasanth (s_no,name,designation,branch)
    -> values
    -> (6,'jessica','analyst','mumbai'),
    -> (7,'james','manager','delhi'),
    -> (8,'julia','assistant manager','chennai');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from prasanth;
+------+---------+-------------------+---------+
| s_no | name    | designation       | branch  |
+------+---------+-------------------+---------+
|  123 | guru    | man               | chennai |
|    6 | jessica | analyst           | mumbai  |
|    7 | james   | manager           | delhi   |
|    8 | julia   | assistant manager | chennai |
+------+---------+-------------------+---------+
4 rows in set (0.00 sec)

mysql> create view view as select name from prasanth;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from view;
+---------+
| name    |
+---------+
| guru    |
| jessica |
| james   |
| julia   |
+---------+
4 rows in set (0.00 sec)
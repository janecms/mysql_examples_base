mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| hellojd            |
| mysql              |
| oggdb              |
| performance_schema |
| springdb           |
| test               |
+--------------------+
7 rows in set

mysql> 
mysql> drop database oggdb;
Query OK, 0 rows affected

mysql> drop database oggdb;
1008 - Can't drop database 'oggdb'; database doesn't exist


mysql> drop database if
 exists oggdb;
Query OK, 0 rows affected


mysql> drop database if exists oggdb;
Query OK, 0 rows affected

mysql> show warnings;
+-------+------+-----------------------------------------------------+
| Level | Code | Message                                             |
+-------+------+-----------------------------------------------------+
| Note  | 1008 | Can't drop database 'oggdb'; database doesn't exist |
+-------+------+-----------------------------------------------------+
1 row in set

mysql> 

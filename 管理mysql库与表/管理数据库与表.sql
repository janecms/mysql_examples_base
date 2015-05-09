#在Navicat 命令行,不能运行help 系列命令。
#个性化命令行提示符(在Navicat 命令行中无效)
mysql>prompt \u@\h \d \r:\m:\s>     

 \u     | Your user name        
 \h     | The server host 
 \d     | The default database
 \r     | The current time, standard 12-hour time (1–12)
 \m     | Minutes of the current time
 \s     | Seconds of the current time
 
 如果在my.cnf配置文件中最好用\\，避免转义带来的问题。
[mysql]
prompt=\\u@\\h \\d \\r:\\m:\\s>  

#1.查询安装路径
mysql> select @@basedir as basePath from dual 
    -> ;
+----------------------------+
| basePath                   |
+----------------------------+
| D:/MySQL/MySQL Server 5.5/ |
+----------------------------+
1 row in set

#2.查询数据目录
mysql> select @@datadir as basePath from dual;
+---------------------------------------------+
| basePath                                    |
+---------------------------------------------+
| D:\ProgramData\MySQL\MySQL Server 5.5\Data\ |
+---------------------------------------------+
1 row in set

#3.查询数据库列表
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

#4.查询数据库创建命令
mysql> show create database eee;
+----------+--------------------------------------------------------------+
| Database | Create Database                                              |
+----------+--------------------------------------------------------------+
| eee      | CREATE DATABASE `eee` /*!40100 DEFAULT CHARACTER SET utf8 */ |
+----------+--------------------------------------------------------------+

#5.查询字符集
mysql> show charset;
+----------+-----------------------------+---------------------+--------+
| Charset  | Description                 | Default collation   | Maxlen |
+----------+-----------------------------+---------------------+--------+
| big5     | Big5 Traditional Chinese    | big5_chinese_ci     |      2 |
| dec8     | DEC West European           | dec8_swedish_ci     |      1 |
| cp850    | DOS West European           | cp850_general_ci    |      1 |
| hp8      | HP West European            | hp8_english_ci      |      1 |
| koi8r    | KOI8-R Relcom Russian       | koi8r_general_ci    |      1 |
| latin1   | cp1252 West European        | latin1_swedish_ci   |      1 |
| latin2   | ISO 8859-2 Central European | latin2_general_ci   |      1 |
| swe7     | 7bit Swedish                | swe7_swedish_ci     |      1 |
| ascii    | US ASCII                    | ascii_general_ci    |      1 |
| ujis     | EUC-JP Japanese             | ujis_japanese_ci    |      3 |
| sjis     | Shift-JIS Japanese          | sjis_japanese_ci    |      2 |
| hebrew   | ISO 8859-8 Hebrew           | hebrew_general_ci   |      1 |
| tis620   | TIS620 Thai                 | tis620_thai_ci      |      1 |
| euckr    | EUC-KR Korean               | euckr_korean_ci     |      2 |
| koi8u    | KOI8-U Ukrainian            | koi8u_general_ci    |      1 |
| gb2312   | GB2312 Simplified Chinese   | gb2312_chinese_ci   |      2 |
| greek    | ISO 8859-7 Greek            | greek_general_ci    |      1 |
| cp1250   | Windows Central European    | cp1250_general_ci   |      1 |
| gbk      | GBK Simplified Chinese      | gbk_chinese_ci      |      2 |
| latin5   | ISO 8859-9 Turkish          | latin5_turkish_ci   |      1 |
| armscii8 | ARMSCII-8 Armenian          | armscii8_general_ci |      1 |
| utf8     | UTF-8 Unicode               | utf8_general_ci     |      3 |
| ucs2     | UCS-2 Unicode               | ucs2_general_ci     |      2 |
| cp866    | DOS Russian                 | cp866_general_ci    |      1 |
| keybcs2  | DOS Kamenicky Czech-Slovak  | keybcs2_general_ci  |      1 |
| macce    | Mac Central European        | macce_general_ci    |      1 |
| macroman | Mac West European           | macroman_general_ci |      1 |
| cp852    | DOS Central European        | cp852_general_ci    |      1 |
| latin7   | ISO 8859-13 Baltic          | latin7_general_ci   |      1 |
| utf8mb4  | UTF-8 Unicode               | utf8mb4_general_ci  |      4 |
| cp1251   | Windows Cyrillic            | cp1251_general_ci   |      1 |
| utf16    | UTF-16 Unicode              | utf16_general_ci    |      4 |
| cp1256   | Windows Arabic              | cp1256_general_ci   |      1 |
| cp1257   | Windows Baltic              | cp1257_general_ci   |      1 |
| utf32    | UTF-32 Unicode              | utf32_general_ci    |      4 |
| binary   | Binary pseudo charset       | binary              |      1 |
| geostd8  | GEOSTD8 Georgian            | geostd8_general_ci  |      1 |
| cp932    | SJIS for Windows Japanese   | cp932_japanese_ci   |      2 |
| eucjpms  | UJIS for Windows Japanese   | eucjpms_japanese_ci |      3 |
+----------+-----------------------------+---------------------+--------+
39 rows in set


#6.删除数据库
mysql> 
mysql> drop database oggdb;
Query OK, 0 rows affected

#6.1如果数据库不存在，会报错
mysql> drop database oggdb;
1008 - Can't drop database 'oggdb'; database doesn't exist

#6.2如果数据库不存在，不报错
mysql> drop database if exists oggdb;
Query OK, 0 rows affected

mysql> show warnings;
+-------+------+-----------------------------------------------------+
| Level | Code | Message                                             |
+-------+------+-----------------------------------------------------+
| Note  | 1008 | Can't drop database 'oggdb'; database doesn't exist |
+-------+------+-----------------------------------------------------+
1 row in set


#7.创建数据库
mysql> create database exampledb;
Query OK, 1 row affected

会在@@datadir 目录中新添一个一个名为'exampledb'文件夹。切文件夹中有“db.opt”文件。
其中db.opt 内容如下
default-character-set=latin1
default-collation=latin1_swedish_ci

#系统默认字符集为英文，这时候，表数据不允许录入中文值
mysql> use exampledb;
Database changed
mysql> create table t1(v varchar(21));
Query OK, 0 rows affected

查看新建表的定义，发现是latin1
mysql> show create table t1;
+-------+-----------------------------------------------------------------------------------------+
| Table | Create Table                                                                            |
+-------+-----------------------------------------------------------------------------------------+
| t1    | CREATE TABLE `t1` (
  `v` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+-------+-----------------------------------------------------------------------------------------+
1 row in set
mysql> insert into t1 values('好');
1366 - Incorrect string value: '\xE5\xA5\xBD' for column 'v' at row 1

如果将db.opt文件中的参数修改成支持中文.如下
default-character-set=utf8
default-collation=utf8_general_ci

然后继续创建一个表
mysql> create table t2
(v varchar(21));
Query OK, 0 rows affected

查看新建表的定义，发现是utf8
mysql> show create table t2;
+-------+---------------------------------------------------------------------------------------+
| Table | Create Table                                                                          |
+-------+---------------------------------------------------------------------------------------+
| t2    | CREATE TABLE `t2` (
  `v` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-------+---------------------------------------------------------------------------------------+
1 row in set
经过试验得知，db.opt存储的是创建数据库时默认的字符集和字符集校验规则，则该数据库在以后创建表时如果没有指定字符集和校验规则。

注意，如果通过db.opt修改数据库的字符集和字符集校验规则，需要重启mysql服务，才能生效。


8.查看数据库的所有表
mysql> use exampledb;
Database changed
mysql> show tables;
+---------------------+
| Tables_in_exampledb |
+---------------------+
| t1                  |
| t2                  |
| u                   |
+---------------------+
3 rows in set

#9.查看当前数据库
mysql> select database();
+------------+
| database() |
+------------+
| exampledb  |
+------------+
1 row in set

10. 查看表结构
mysql> desc t1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| v     | varchar(21) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
1 row in set

mysql> show columns from t1;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| v     | varchar(21) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
1 row in set

11.查看表上的索引
mysql> show index from hellojd.wp_users;
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table    | Non_unique | Key_name       | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| wp_users |          0 | PRIMARY        |            1 | ID            | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
| wp_users |          1 | user_login_key |            1 | user_login    | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
| wp_users |          1 | user_nicename  |            1 | user_nicename | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set


12.#创建表(help create table)
mysql> create table tuser(id varchar(32) not null default '0',name varchar(64));
Query OK, 0 rows affected
mysql> desc tus
er;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(32) | NO   |     | 0       |       |
| name  | varchar(64) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set

#13.修改表(help alter table)
mysql> alter table  tuser add column age int after id;
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
mysql> desc tuser;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | varchar(32) | NO   |     | 0       |       |
| age   | int(11)     | YES  |     | NULL    |       |
| name  | varchar(64) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set

#14.字符长度，非字节长度
mysql> create table t(n varchar(5));
Query OK, 0 rows affected


mysql> insert into t values('123456');
1406 - Data too long for column 'n' at row 1
mysql> insert into t values('12345');
Query OK, 1 row affected

mysql> insert into t values('我爱天安门');
Query OK, 1 row affected

mysql> select * from t;
+------------+
| n          |
+------------+
| 12345      |
| 我爱天安门 |
+------------+
2 rows in set

#15.删除表&重命名表
mysql> drop table t;
Query OK, 0 rows affected

mysql> rename table t2 to t22;
Query OK, 0 rows affected

mysql> show tables;
+---------------------+
| Tables_in_exampledb |
+---------------------+
| t22                 |
| tuser               |
| u                   |
+---------------------+
3 rows in set
#��Navicat ������,��������help ϵ�����
#���Ի���������ʾ��(��Navicat ����������Ч)
mysql>prompt \u@\h \d \r:\m:\s>     

 \u     | Your user name        
 \h     | The server host 
 \d     | The default database
 \r     | The current time, standard 12-hour time (1�C12)
 \m     | Minutes of the current time
 \s     | Seconds of the current time
 
 �����my.cnf�����ļ��������\\������ת����������⡣
[mysql]
prompt=\\u@\\h \\d \\r:\\m:\\s>  

#1.��ѯ��װ·��
mysql> select @@basedir as basePath from dual 
    -> ;
+----------------------------+
| basePath                   |
+----------------------------+
| D:/MySQL/MySQL Server 5.5/ |
+----------------------------+
1 row in set

#2.��ѯ����Ŀ¼
mysql> select @@datadir as basePath from dual;
+---------------------------------------------+
| basePath                                    |
+---------------------------------------------+
| D:\ProgramData\MySQL\MySQL Server 5.5\Data\ |
+---------------------------------------------+
1 row in set

#3.��ѯ���ݿ��б�
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

#4.��ѯ���ݿⴴ������
mysql> show create database eee;
+----------+--------------------------------------------------------------+
| Database | Create Database                                              |
+----------+--------------------------------------------------------------+
| eee      | CREATE DATABASE `eee` /*!40100 DEFAULT CHARACTER SET utf8 */ |
+----------+--------------------------------------------------------------+

#5.��ѯ�ַ���
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


#6.ɾ�����ݿ�
mysql> 
mysql> drop database oggdb;
Query OK, 0 rows affected

#6.1������ݿⲻ���ڣ��ᱨ��
mysql> drop database oggdb;
1008 - Can't drop database 'oggdb'; database doesn't exist

#6.2������ݿⲻ���ڣ�������
mysql> drop database if exists oggdb;
Query OK, 0 rows affected

mysql> show warnings;
+-------+------+-----------------------------------------------------+
| Level | Code | Message                                             |
+-------+------+-----------------------------------------------------+
| Note  | 1008 | Can't drop database 'oggdb'; database doesn't exist |
+-------+------+-----------------------------------------------------+
1 row in set


#7.�������ݿ�
mysql> create database exampledb;
Query OK, 1 row affected

����@@datadir Ŀ¼������һ��һ����Ϊ'exampledb'�ļ��С����ļ������С�db.opt���ļ���
����db.opt ��������
default-character-set=latin1
default-collation=latin1_swedish_ci

#ϵͳĬ���ַ���ΪӢ�ģ���ʱ�򣬱����ݲ�����¼������ֵ
mysql> use exampledb;
Database changed
mysql> create table t1(v varchar(21));
Query OK, 0 rows affected

�鿴�½���Ķ��壬������latin1
mysql> show create table t1;
+-------+-----------------------------------------------------------------------------------------+
| Table | Create Table                                                                            |
+-------+-----------------------------------------------------------------------------------------+
| t1    | CREATE TABLE `t1` (
  `v` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+-------+-----------------------------------------------------------------------------------------+
1 row in set
mysql> insert into t1 values('��');
1366 - Incorrect string value: '\xE5\xA5\xBD' for column 'v' at row 1

�����db.opt�ļ��еĲ����޸ĳ�֧������.����
default-character-set=utf8
default-collation=utf8_general_ci

Ȼ���������һ����
mysql> create table t2
(v varchar(21));
Query OK, 0 rows affected

�鿴�½���Ķ��壬������utf8
mysql> show create table t2;
+-------+---------------------------------------------------------------------------------------+
| Table | Create Table                                                                          |
+-------+---------------------------------------------------------------------------------------+
| t2    | CREATE TABLE `t2` (
  `v` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-------+---------------------------------------------------------------------------------------+
1 row in set
���������֪��db.opt�洢���Ǵ������ݿ�ʱĬ�ϵ��ַ������ַ���У�����������ݿ����Ժ󴴽���ʱ���û��ָ���ַ�����У�����

ע�⣬���ͨ��db.opt�޸����ݿ���ַ������ַ���У�������Ҫ����mysql���񣬲�����Ч��


8.�鿴���ݿ�����б�
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

#9.�鿴��ǰ���ݿ�
mysql> select database();
+------------+
| database() |
+------------+
| exampledb  |
+------------+
1 row in set

10. �鿴��ṹ
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

11.�鿴���ϵ�����
mysql> show index from hellojd.wp_users;
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table    | Non_unique | Key_name       | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| wp_users |          0 | PRIMARY        |            1 | ID            | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
| wp_users |          1 | user_login_key |            1 | user_login    | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
| wp_users |          1 | user_nicename  |            1 | user_nicename | A         |           1 | NULL     | NULL   |      | BTREE      |         |               |
+----------+------------+----------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
3 rows in set
-- **数据库级别：**  
--  显示所有数据库  
show databases;
--  进入某个数据库  
use student_sys;
--  创建一个数据库  
CREATE DATABASE  IF NOT EXISTS `student_sys`;
--  创建指定字符集的数据库  
CREATE DATABASE  IF NOT EXISTS `student_sys` DEFAULT CHARACTER SET utf8;
--  显示数据库的创建信息   
SHOW CREATE DATABASE student_sys;
--  修改数据库的编码  
alter database student_sys character set utf8;
--  删除一个数据库   
DROP DATABASE IF EXISTS student_sys;
-- **表级别**
--  修改表名
ALTER TABLE student RENAME TO student1;
--  修改字段的数据类型
ALTER TABLE student CHANGE COLUMN age age INT(11) NOT NULL; 
--  修改字段名
ALTER TABLE student CHANGE COLUMN age age1 INT(11) NOT NULL; 
--  添加字段
ALTER TABLE student ADD COLUMN shengao INT(11) NULL AFTER age;
--  删除字段
ALTER TABLE student DROP COLUMN shengao;
--  修改表的存储引擎
ALTER TABLE student ENGINE=InnoDB;
--  删除表的外键约束
ALTER TABLE student DROP FOREIGN KEY foreign_key;
--  删除一张表
DROP TABLE student;
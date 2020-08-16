-- 插入记录  
INSERT INTO `student` VALUES ('003','班绍桓','24','男');

-- 修改记录  
UPDATE student 
SET 
    age = '25'
WHERE
    id = 003;

--  删除记录  
DELETE FROM student
WHERE id = 003;

-- 查询记录  
SELECT * FROM student;
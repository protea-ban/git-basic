# 1.查询同时存在1课程和2课程的情况
SELECT
	s1.id
	,s1.name
	,s1.age
	,s1.sex
FROM (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 1
			) s1
JOIN  (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 2
			) s2
ON s1.id = s2.id
# 2.查询同时存在1课程和2课程的情况
SELECT
	s1.id
	,s1.name
	,s1.age
	,s1.sex
FROM (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 1
			) s1
JOIN  (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 2
			) s2
ON s1.id = s2.id
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT
	t2.id
	,t2.name
	,AVG(t1.score)
FROM
	student_course t1
JOIN student t2
ON t1.studentId = t2.id
GROUP BY 1,2
HAVING AVG(t1.score) >= 60
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT
	t2.id
	,t2.age
	,t2.name
	,t2.sex
FROM
	student_course t1
JOIN student t2
ON t1.studentId = t2.id
WHERE t1.score IS NULL
# 5.查询所有有成绩的SQL
SELECT
	*
FROM
	student_course t1
WHERE t1.score IS NOT NULL
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT
	s1.id
	,s1.name
	,s1.age
	,s1.sex
FROM (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 1
			) s1
JOIN  (
				SELECT
					t2.id
					,t2.age
					,t2.name
					,t2.sex
				FROM
					student_course t1
				JOIN student t2
				ON t1.studentId = t2.id
				WHERE t1.courseId = 2
			) s2
ON s1.id = s2.id
# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT
	t2.id
	,t2.name
	,t2.age
	,t2.sex
	,t1.score
FROM
	student_course t1
JOIN student t2
ON t1.studentId = t2.id
WHERE t1.courseId = 1
AND t1.score < 60
ORDER BY t1.score
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT
	t1.courseId
	,AVG(t1.score)
FROM
	student_course t1
GROUP BY t1.courseId
ORDER BY 2,1
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT
	t2.name
	,t1.score
FROM
	student_course t1
JOIN student t2
ON t1.studentId = t2.id
JOIN course t3
ON t1.courseId = t3.id
WHERE t3.name = '数学'
AND t1.score < 60;
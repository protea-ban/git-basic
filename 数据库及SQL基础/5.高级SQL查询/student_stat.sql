
create table student_stat (
-- TODO:
	name varchar(50) PRIMARY KEY
	,teacher varchar(50) not null
	,subject varchar(50) not null
	,avg_score decimal(12,2) not null
	,score decimal(12,2) not null
	,total_score decimal(12,2) not null
	,score_rate decimal(12,2) not null
)

create procedure calc_student_stat()
-- TODO:
begin
	declare name varchar(50);
	declare teacher varchar(50);
	declare subject varchar(50);
	declare avg_score decimal(12,2);
	decalre score decimal(12,2);
	decalre total_score decimal(12,2);
	decalre score_rate decimal(12,2);
	create TEMPORARY TABLE IF NOT EXISTS student_stat (
		-- TODO:
		name varchar(50) PRIMARY KEY
		,teacher varchar(50) not null
		,subject varchar(50) not null
		,avg_score decimal(12,2) not null
		,score decimal(12,2) not null
		,total_score decimal(12,2) not null
		,score_rate decimal(12,2) not null
	);
	TRUNCATE TABLE student_stat;
	declare myCursor CUSOR FOR(
		SELECT
			p1.name
			,p1.teacher
			,p1.`subject`
			,p2.avg_subject
			,p1.score
			,p2.sum_all
			,p2.subject_rate
		FROM
		(
			SELECT
				score.student_id
				,`name`
				,teacher
				,`subject`
				,score
			FROM score
			JOIN student
			on score.student_id = student.id
			JOIN `subject`
			ON score.subject_id = `subject`.id
			GROUP BY 1,2,3,4,5
		) p1
		JOIN
		(
			SELECT
				t1.student_id
				,subject_id
				,score / sum_all subject_rate
				,avg_subject
				,sum_all
			FROM score
			JOIN (
				SELECT
					student_id
					,SUM(score) sum_all
					,AVG(score) avg_subject
				FROM score
				GROUP BY student_id,subject_id
				) t1
				on score.student_id = t1.student_id
		) p2
		ON p1.student_id = p2.student_id
	);
	DECLARE CONTINUE HANDLER for not found SET done = 1;
	OPEN myCursor; -- 打开游标  
		myLoop: LOOP -- 开始循环体,myLoop为自定义循环名
		 FETCH myCursor into name,teacher,subject,socre; -- 将游标当前读取行的数据,顺序赋予自定义变量  
			 IF done=1 THEN -- 判断是否继续循环  
			 LEAVE myLoop; -- 结束循环  
			 END IF;
     
     INSERT INTO student_stat(name,teacher,subject,avg_score,socre,total_score,score_rate) values(name,teacher,subject,avg_score,socre,total_score,score_rate);
     END LOOP myLoop; -- 结束自定义循环体 
  CLOSE myCursor; -- 关闭游标  
  select * from student_stat;
end;

/***************
INSERT INTO student_stat
SELECT
	p1.name
	,p1.teacher
	,p1.`subject`
	,p2.avg_subject
	,p1.score
	,p2.sum_all
	,p2.subject_rate
FROM
(
	SELECT
		score.student_id
		,`name`
		,teacher
		,`subject`
		,score
	FROM score
	JOIN student
	on score.student_id = student.id
	JOIN `subject`
	ON score.subject_id = `subject`.id
	GROUP BY 1,2,3,4,5
) p1
JOIN
(
	SELECT
		t1.student_id
		,subject_id
		,score / sum_all subject_rate
		,avg_subject
		,sum_all
	FROM score
	JOIN (
		SELECT
			student_id
			,SUM(score) sum_all
			,AVG(score) avg_subject
		FROM score
		GROUP BY student_id,subject_id
		) t1
		on score.student_id = t1.student_id
) p2
ON p1.student_id = p2.student_id
**************/

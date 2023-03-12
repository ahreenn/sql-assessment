create database sql_assessment;
use sql_assessment;
show tables;

create table Students
(
Id int NOT NULL auto_increment,
First_name varchar(20),
PRIMARY KEY (Id)
);

create table Papers
(
Title varchar(255),
Grade float,
Student_id int,
FOREIGN KEY (Student_id) REFERENCES Students(Id)
);

INSERT INTO students (first_name) VALUES
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;
select * from papers;




# QUESTION 1
# PRINT FIRST_NAME, TITLE, GRADE
# INNER JOIN 
select a.first_name, b.title, b.grade 
from students a inner join papers b
on a.id=b.student_id
order by grade desc;


# QUESTION 2
# LEFT JOIN
select a.first_name, b.title, b.grade
from students a left join papers b
on a.id=b.student_id;


# QUESTION 3
# REPLACE 'NULL' WITH 'MISSING' AND NULL GRADEs WITH 0
select a.first_name, coalesce(b.title, 'MISSING') as Title, coalesce(b.grade, 0) as grade
from students a left join papers b on a.id=b.student_id;


# QUESTION 4
# PRINT FIRST_NAME, AVERAGE GRADE BY DESCENDING ORDER
select a.first_name, avg(b.grade) as Average
from students a left join papers b
on a.id=b.student_id
group by a.first_name
order by average desc;


# QUESTION 5
# PRINT FIRST_NAME, AVERAGE GRADE BY DESCENDING ORDER, PASSING_STATUS FOR GRADES ABOVE 75
select a.first_name, avg(b.grade) as Average, if (avg(b.grade) > 75, "PASSING", "FAILING") as 'Passing_status'
from students a left join papers b
on a.id=b.student_id
group by a.first_name
order by average desc;








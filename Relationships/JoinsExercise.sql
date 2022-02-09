# create table students (
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     first_name VARCHAR(200)
# );

# CREATE TABLE papers (
#     title VARCHAR(200),
#     grade INT,
#     student_id INT,
#     FOREIGN KEY(student_id) 
#     REFERENCES students(id)
#     ON DELETE CASCADE
# );

#     INSERT INTO students (first_name) VALUES 
#     ('Caleb'), 
#     ('Samantha'), 
#     ('Raj'), 
#     ('Carlos'), 
#     ('Lisa');
     
#     INSERT INTO papers (student_id, title, grade ) VALUES
#     (1, 'My First Book Report', 60),
#     (1, 'My Second Book Report', 75),
#     (2, 'Russian Lit Through The Ages', 94),
#     (2, 'De Montaigne and The Art of The Essay', 98),
#     (4, 'Borges and Magical Realism', 89);

# Select first_name, title, grade
# FROM students
# INNER JOIN papers
#     ON students.id = papers.student_id
#    order by papers.grade desc;

# Select first_name, title, grade
# FROM students
# Left JOIN papers
#     on students.id = papers.student_id
#    order by grade;

# Select first_name, IFNULL(title, 'MISSING') as title, IFNULL(grade, 0) as grade
# from students
# Left Join papers
#     on students.id = papers.student_id

# select first_name, IFNULL(AVG(grade), 0) as average
# from students
# left join papers
#     on students.id = papers.student_id
# group by first_name
# order by average desc;

select first_name, IFNULL(AVG(grade), 0) as average,
    CASE
        WHEN IFNULL(AVG(grade), 0) > 75 then 'PASSING'
        ELSE 'FAILING'
    END AS 'passing_status'
from students
left join papers
    on students.id = papers.student_id
 group by first_name
 order by average desc;

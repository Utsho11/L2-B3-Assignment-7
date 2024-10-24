-- Active: 1729233066210@@127.0.0.1@5432@university_db
-- create table

-- create students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY NOT NULL, 
    student_name VARCHAR(50) NOT NULL,    
    age INT,                              
    email VARCHAR(50), 
    frontend_mark INT,                   
    backend_mark INT,                    
    status VARCHAR(25)                   
);

-- create courses table
CREATE table courses(
    course_id SERIAL PRIMARY KEY NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    credits INT
);

-- create enrollments table
CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY key NOT NULL,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);

-- insert data into students table
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
('Sameer',21,'sameer@example.com',48,60,NULL),
('Zoya',21,'zoya@example.com',52,58,NULL),
('Nabil',21,'nabil@example.com',37,46,NULL),
('Rafi',21,'rafi@example.com',41,40,NULL),
('Sophia',21,'sophia@example.com',50,52,NULL),
('Hasan',21,'hasan@example.com',43,39,NULL);

-- insert data into courses
INSERT INTO courses (course_name, credits) VALUES
('Next.js',3),
('React.js',4),
('Database',3),
('Prisma',3);

-- insert data into courses
INSERT INTO enrollment (student_id, course_id) VALUES
(1,1),
(1,2),
(2,1),
(3,2);



-- Query 1:
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
('Alif',21,'alif@example.com',46,57,NULL);

-- Query 2:
SELECT student_name
FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON enrollment.course_id = courses.course_id
WHERE courses.course_name = 'Next.js';

-- Query 3: 
UPDATE students SET "status" = 'Awarded'
WHERE frontend_mark + backend_mark = (
  SELECT MAX(frontend_mark + backend_mark)
  FROM students
);

-- Query 4:
DELETE FROM courses
WHERE course_id NOT IN (
  SELECT course_id
  FROM enrollment
);

-- Query 5:
SELECT student_name FROM students LIMIT 2 OFFSET 2;

-- Query 6:
SELECT course_name, COUNT(enrollment.student_id) AS students_enrolled
FROM courses
LEFT JOIN enrollment ON courses.course_id = enrollment.course_id
GROUP BY courses.course_name;

-- Query 7:
SELECT Round(avg(age),2) as average_age from students;

-- Query 8:

SELECT * FROM students
    WHERE email LIKE '%example.com'; 

DROP
 TABLE students;
DROP TABLE courses;
DROP TABLE enrollment;

SELECT * FROM students ORDER BY student_id;
SELECT * FROM courses;
SELECT * FROM enrollment;
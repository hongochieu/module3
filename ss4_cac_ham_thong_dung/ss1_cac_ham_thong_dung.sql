CREATE DATABASE IF NOT EXISTS QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE IF NOT EXISTS class (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    start_time DATE
);

CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    birthday DATE,
    gender BOOLEAN,
    email VARCHAR(50),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE IF NOT EXISTS subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    credit INT
);

CREATE TABLE IF NOT EXISTS subjects_student (
    student_id INT,
    subjects_id INT,
    score FLOAT,
    PRIMARY KEY (student_id, subjects_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (subjects_id) REFERENCES subjects(id)
);

INSERT INTO class (name, start_time) VALUES 
('C0525L1', '2025-05-29'),
('C0325L1', '2025-12-25');

INSERT INTO student (name, birthday, gender, email, class_id) VALUES
('Trần Huy', '2000-10-12', TRUE, 'huy@mail.com', 1),
('Trần Minh Hạo', '2005-01-01', TRUE, 'hao@mail.com', 1),
('Đình Hải', '2002-07-05', TRUE, 'hai@mail.com', 2),
('Nguyễn Minh', '2003-09-10', TRUE, 'minh@mail.com', 2),
('Huỳnh Hưng', '2003-11-12', TRUE, 'hung@mail.com', 1);

INSERT INTO subjects (name, credit) VALUES
('JavaScript', 3),
('Java', 5),
('CSS', 2),
('Database', 4),
('English', 3);

INSERT INTO subjects_student (student_id, subjects_id, score) VALUES
(1, 2, 8.5),
(1, 3, 7),
(2, 1, 9),
(2, 4, 8),
(3, 5, 6.5),
(4, 2, 7.5),
(5, 1, 8),
(5, 5, 9);

SELECT *
FROM subjects
WHERE credit = (SELECT MAX(credit) FROM subjects);

SELECT sub.*, ss.score
FROM subjects_student ss
JOIN subjects sub ON ss.subjects_id = sub.id
WHERE ss.score = (SELECT MAX(score) FROM subjects_student);

SELECT 
    s.id,
    s.name AS student_name,
    ROUND(AVG(ss.score), 2) AS average_score
FROM student s
JOIN subjects_student ss ON s.id = ss.student_id
GROUP BY s.id, s.name
ORDER BY average_score DESC;

use
`student-management`;
CREATE TABLE student
(
    id      INT PRIMARY KEY,
    `name`  VARCHAR(50),
    age     INT,
    country VARCHAR(50)
);


INSERT INTO student (id, name, age, country)
values (1, 'thanh', 13, 'da nang'),
       (2, 'thien', 14, 'saigon'),
       (3, 'hao', 15, 'ngheAn');
SELECT id,
       `name`
FROM student;
SELECT *
FROM student;
UPDATE student
SET `name` = 'huynh thi thuy trang'
WHERE id = 2;
CREATE TABLE Class
(
    id     INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teacher
(
    id      INT PRIMARY KEY,
    `name`  VARCHAR(50),
    age     INT,
    country VARCHAR(50)
);


DELETE
FROM student
WHERE id = 1



use quanlysinhvien;
CREATE TABLE class (
    classid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    classname VARCHAR(30),
    stardate DATETIME,
    status BOOLEAN
);
CREATE TABLE student (
    studentid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    studentname VARCHAR(30),
    address VARCHAR(30),
    phone VARCHAR(30),
    `status` BOOLEAN,
    classid INT,
    FOREIGN KEY (classid)
        REFERENCES class (classid)
);
CREATE TABLE subject (
    subid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    subname VARCHAR(30),
    credit INT,
    status BOOLEAN
);
CREATE TABLE mark (
    subid INT NOT NULL,
    studentid INT NOT NULL,
    mark INT NOT NULL,
    examtimes INT NOT NULL,
    PRIMARY KEY (subid , studentid),
    FOREIGN KEY (subid)
        REFERENCES subject (subid),
    FOREIGN KEY (studentid)
        REFERENCES student (studentid)
);
insert into class
values(1, 'A1', '2008-12-20', 1);
insert into class
VALUES (2, 'A2', '2008-12-22', 1);
insert into class
VALUES (3, 'B3', current_date, 0);
insert into student(StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
SELECT 
    s.*, c.classname AS thien
FROM
    student s
        JOIN
    class c ON s.classid = c.classid
WHERE
    c.classname = 'A1';
SELECT 
    s.*, sub.subname, m.mark, m.examtimes
FROM
    student s
        INNER JOIN
    mark m ON s.studentid = m.studentid
        JOIN
    subject sub ON m.subid = sub.subid
WHERE
    sub.subname = 'CF';
SELECT 
    *
FROM
    student
WHERE
    studentname LIKE 'H%';
SELECT 
    *
FROM
    class
WHERE
    MONTH(stardate) = 12;
SELECT 
    s.*, sub.*, m.mark, m.ExamTimes
FROM
    student s
        INNER JOIN
    mark m ON s.studentid = m.studentid
        INNER JOIN
    subject sub ON sub.subid = m.subid
WHERE
    sub.credit >= 3 AND sub.credit <= 5;

set sql_safe_updates=0;
UPDATE student 
SET 
    classid = 2
WHERE
    studentname = 'hung';


SELECT 
    s.studentname, sub.subname, m.mark
FROM
    mark m
        JOIN
    student s ON s.studentid = m.studentid
        JOIN
    subject sub ON sub.subid = m.subid
ORDER BY m.mark DESC , s.studentname ASC;

       
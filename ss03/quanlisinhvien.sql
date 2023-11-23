use
quanlysinhvien;
CREATE TABLE class
(
    classid   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    classname VARCHAR(30),
    stardate  DATETIME,
    status    BOOLEAN
);
CREATE TABLE student
(
    studentid   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    studentname VARCHAR(30),
    address     VARCHAR(30),
    phone       VARCHAR(30),
    `status`    BOOLEAN,
    classid     INT,
    FOREIGN KEY (classid)
        REFERENCES class (classid)
);
CREATE TABLE subject
(
    subid   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    subname VARCHAR(30),
    credit  INT,
    status  BOOLEAN
);
CREATE TABLE mark
(
    subid     INT NOT NULL,
    studentid INT NOT NULL,
    mark      INT NOT NULL,
    examtimes INT NOT NULL,
    PRIMARY KEY (subid, studentid),
    FOREIGN KEY (subid)
        REFERENCES subject (subid),
    FOREIGN KEY (studentid)
        REFERENCES student (studentid)
);
insert into class
values (1, 'A1', '2008-12-20', 1);
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
-- 1.Hiển thị tất cả các thông tin môn học (Bảng subject)có credit lớn nhất
select sub.*
from `subject` sub
where sub.credit = (select max(sub.credit) from subject sub);
-- 2 Hiển thị tất cả các thông tin môn học có điểm cao nhất table
select sub.subid as idmonhoc, sub.subname as tenmonhoc, max(m.mark) as total
from subject sub
         join mark m on sub.subid = m.subid
group by sub.subid, sub.subname
having max(m.mark) = (select max(m.mark) from mark m);
-- 3 Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,xếp hạng theo thứ tự điểm giảm dần
select s.studentid   as idsinhvien,
       s.studentname as tensinhvien,
       s.address     as diachinhasinhvien,
       s.phone       as sodienthoaicuasinhvien,
       s.status,
       avg(m.mark)   as diemtrungbinh
from student s
         inner join mark m
                    on s.studentid = m.studentid
group by s.studentid, s.studentname, s.address, s.phone, s.status
order by avg(m.mark) desc;

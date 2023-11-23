use
quanlysinhvien;
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

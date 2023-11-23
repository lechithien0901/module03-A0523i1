create
database furama;
use
furama;
drop
database furama;
CREATE TABLE vi_tri
(
    ma_vi_tri  INT NOT NULL PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do
(
    ma_trinh_do  INT PRIMARY KEY NOT NULL,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan
(
    ma_bo_phan  INT NOT NULL PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien
(
    ma_nhan_vien  INT         NOT NULL,
    ho_ten        VARCHAR(45) NOT NULL,
    ngay_sinh     DATE        NOT NULL,
    so_cmnd       VARCHAR(45) NOT NULL,
    luong         DOUBLE      NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email         VARCHAR(45),
    dia_chi       VARCHAR(45),
    ma_vi_tri     INT         NOT NULL,
    ma_trinh_do   INT         NOT NULL,
    ma_bo_phan    INT         NOT NULL,
    PRIMARY KEY (ma_nhan_vien),
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
CREATE TABLE loai_khach
(
    ma_loai_khach  INT PRIMARY KEY NOT NULL,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang
(
    ma_khach_hang INT         NOT NULL PRIMARY KEY,
    ma_loai_khach INT         NOT NULL,
    ho_ten        VARCHAR(45) NOT NULL,
    ngay_sinh     DATE        NOT NULL,
    gioi_tinh     BIT(1)      NOT NULL,
    so_cmnd       VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email         VARCHAR(45),
    dia_chi       VARCHAR(45),
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE loai_dich_vu
(
    ma_loai_dich_vu  INT NOT NULL PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue
(
    ma_kieu_thue  INT NOT NULL PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu
(
    ma_dich_vu              INT         NOT NULL PRIMARY KEY,
    ten_dich_vu             VARCHAR(45) NOT NULL,
    dien_tich               INT,
    chi_phi_thue            DOUBLE      NOT NULL,
    so_nguoi_toi_da         INT,
    ma_kieu_thue            INT         NOT NULL,
    ma_loai_dich_vu         INT         NOT NULL,
    tieu_chuan_phong        VARCHAR(45),
    mo_ta_tien_nghi_khac    VARCHAR(45),
    dien_tich_ho_boi        DOUBLE,
    so_tang                 INT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);
CREATE TABLE dich_vu_di_kem
(
    ma_dich_vu_di_kem  INT         NOT NULL PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia                DOUBLE      NOT NULL,
    don_vi             VARCHAR(10) NOT NULL,
    trang_thai         VARCHAR(45)
);
CREATE TABLE hop_dong
(
    ma_hop_dong       INT PRIMARY KEY NOT NULL,
    ngay_lam_hop_dong DATETIME        NOT NULL,
    ngay_ket_thuc     DATETIME        NOT NULL,
    tien_dat_coc      DOUBLE          NOT NULL,
    ma_nhan_vien      INT             NOT NULL,
    ma_khach_hang     INT             NOT NULL,
    ma_dich_vu        INT             NOT NULL,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet
(
    ma_hop_dong_chi_tiet INT NOT NULL PRIMARY KEY,
    ma_hop_dong          INT NOT NULL,
    ma_dich_vu_di_kem    INT NOT NULL,
    so_luong             INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);
insert into vi_tri
values (1, 'Quản Lý'),
       (2, 'Nhân Viên');
insert into trinh_do
values (1, 'Trung Cấp'),
       (2, 'Cao Đẳng'),
       (3, 'Đại Học'),
       (4, 'Sau Đại Học');
insert into bo_phan
values (1, 'Sale-Marketing
'),
       (2, 'Hành chính
'),
       (3, 'Phục vụ
'),
       (4, 'Quản lý
');
insert into nhan_vien
values (1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
       (2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng',
        1, 2, 2),
       (3, 'Hồ Thị Yến', '1995-12-12', '999231723	', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
       (4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
       (5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1),
       (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành ,Đà Nẵng', 2, 2, 3),
       (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
       (8, '	Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 4, 4),
       (9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com',
        '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
       (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
insert into loai_khach
values (1, 'Diamond
'),
       (2, 'Platinium
'),
       (3, 'Gold
'),
       (4, 'Silver
'),
       (5, 'Member
');
insert into khach_hang( ma_khach_hang
                      , ho_ten
                      , ngay_sinh
                      , gioi_tinh
                      , so_cmnd
                      , so_dien_thoai
                      , email
                      , dia_chi
                      , ma_loai_khach)
values (1, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213	', '0945423362', 'thihao07@gmail.com',
        '23 Nguyễn Hoàng, Đà Nẵng', 5),
       (2, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com',
        'K77/22 Thái Phiên, Quảng Trị', 3),
       (3, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com',
        'K323/12 Ông Ích Khiêm, Vinh', 1),
       (4, 'Dương Văn Quan', '1981-07-08	', 1, '543432111', '0490039241', 'duongquan@gmail.com',
        'K453/12 Lê Lợi, Đà Nẵng', 1),
       (5, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com',
        '224 Lý Thái Tổ, Gia Lai', 4),
       (6, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng',
        4),
       (7, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com',
        'K123/45 Lê Lợi, Hồ Chí Minh', 1),
       (8, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com',
        '55 Nguyễn Văn Linh, Kon Tum', 3),
       (9, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com',
        '	24 Lý Thường Kiệt, Quảng Ngãi', 1),
       (10, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng',
        2);
insert into kieu_thue
values (1, 'year'),
       (2, 'month'),
       (3, 'day'),
       (4, 'hour');
insert into loai_dich_vu
values (1, 'villa'),
       (2, 'house'),
       (3, 'room');
INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong,
                     mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue,
                     ma_loai_dich_vu)
VALUES (1, 'Villa Beach Front', 25000, 1000000, 10, 'vip', 'Có hồ bơi', 500, 4, null, 3, 1),
       (2, 'House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, null, 2, 2),
       (3, 'Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', 4, 3),
       (4, 'Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, null, 3, 1),
       (5, 'House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, null, 3, 2),
       (6, 'Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, '1 Xe máy', 4, 3);

INSERT INTO dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES (1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
       (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
       (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
       (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang,
                      ma_dich_vu)
VALUES (1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
       (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
       (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
       (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
       (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
       (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
       (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
       (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
       (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
       (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
       (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
       (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);
insert into hop_dong_chi_tiet( ma_hop_dong_chi_tiet
                             , so_luong
                             , ma_hop_dong, ma_dich_vu_di_kem)
values (1, 5, 2, 4),
       (2, 8, 2, 5),
       (3, 15, 2, 6),
       (4, 1, 3, 1),
       (5, 11, 3, 2),
       (6, 1, 1, 3),
       (7, 2, 1, 2),
       (8, 2, 12, 2);
-- 2
select *
from nhan_vien
where ho_ten like 'T%'
   or ho_ten like 'H%'
   or ho_ten like 'K%';
-- 3
select *
from khach_hang
where year (curdate())- year (ngay_sinh) between 18 and 50 and (dia_chi like '%đà nẵng%' or dia_chi like '%Quảng Trị%');
-- 4
select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
         join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ma_khach_hang, kh.ho_ten
order by count(ma_khach_hang);
-- 5
SELECT kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       IFNULL(SUM(hdct.so_luong * dvdk.gia), 0) + dv.chi_phi_thue as tong_tien
FROM khach_hang kh
         LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
         LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
         LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
         LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
         LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong,
         hd.ngay_ket_thuc
ORDER BY kh.ma_khach_hang;
-- 6 cách 1
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd
                   on hd.ma_dich_vu = dv.ma_dich_vu
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where hd.ngay_lam_hop_dong not in (
    select 1
    from hop_dong hd
    where year (
    hd.ngay_lam_hop_dong)=2021
  and quarter(hd.ngay_lam_hop_dong) in (1
    , 2
    , 3)
    )
group by dv.ma_dich_vu;
-- cách 2
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd
                   on hd.ma_dich_vu = dv.ma_dich_vu
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where not exists(
        select 1
        from dich_vu dv1
        where hd.ma_dich_vu = dv1.ma_dich_vu and year ( hd.ngay_lam_hop_dong)=2021 and quarter(hd.ngay_lam_hop_dong) in (1,2,3)
    )
group by dv.ma_dich_vu;
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where not EXISTS(
        select 1
        from dich_vu dv2
        where dv2.ma_dich_vu = dv.ma_dich_vu
                  and year ( hd.ngay_lam_hop_dong) = 2021
    and quarter(hd.ngay_lam_hop_dong) in (1, 2, 3)
)
group by dv.ma_dich_vu;
-- ----------------------
-- 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join hop_dong hd
                   on hd.ma_dich_vu = dv.ma_dich_vu
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where hd.ngay_lam_hop_dong in (
    select hd.ngay_lam_hop_dong
    from hop_dong hd
    where hd.ma_dich_vu = dv.ma_dich_vu
              and year (
    hd.ngay_lam_hop_dong) =2020
    )
  and hd.ngay_lam_hop_dong not in (
select hd.ngay_lam_hop_dong
from hop_dong hd
where hd.ma_dich_vu=dv.ma_dich_vu
  and year (hd.ngay_lam_hop_dong)=2021
    )
group by dv.ma_dich_vu;
-- 8 cách 1
select kh.ho_ten
from khach_hang kh
group by kh.ho_ten;
-- cách 2
select distinct kh.ho_ten
from khach_hang kh;
-- cách 3
select kh.ho_ten
from khach_hang kh
where not exists(
        select 1
        from khach_hang kh
        where ho_ten = kh.ho_ten
          and kh.ma_khach_hang!=ma_khach_hang
    );
-- 9
select month (hd.ngay_lam_hop_dong), count (*) as so_luong_khach_hang
from hop_dong hd inner join khach_hang kh
on kh.ma_khach_hang=hd.ma_khach_hang
where month (hd.ngay_lam_hop_dong) in (select month ( hd.ngay_lam_hop_dong)
    from hop_dong hd
    where year (hd.ngay_lam_hop_dong) in (2021)
    )
group by month (hd.ngay_lam_hop_dong);
-- 10
select hd.ma_hop_dong,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       hd.tien_dat_coc,
       ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;
-- 11 sửa lại
select dvdk.*
from dich_vu_di_kem dvdk
         left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         left join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         left join
     khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
  and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%');
-- 12
select hd.ma_hop_dong,
       nv.ho_ten,
       kh.ho_ten,
       kh.so_dien_thoai,
       dv.ten_dich_vu,
       ifnull(sum(hdct.so_luong), 0) as tien_dat_coc,
       hd.tien_dat_coc
from hop_dong hd
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
         left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where month (hd.ngay_lam_hop_dong) in (10
    , 11
    , 12)
  and year (hd.ngay_lam_hop_dong)=2020
  and hd.ngay_lam_hop_dong not in (
    (select hd.ngay_lam_hop_dong from hop_dong hd where month (hd.ngay_lam_hop_dong) in (1
    , 2
    , 3
    , 4
    , 5
    , 6)
  and year (hd.ngay_lam_hop_dong)=2021 ))
group by hd.ma_hop_dong;
-- cach 2
select hd.ma_hop_dong,
       nv.ho_ten                     as ho_ten_nhan_vien,
       kh.ho_ten                     as ho_ten_khach_hang,
       kh.so_dien_thoai              as sdt_khach_hang,
       dv.ma_dich_vu,
       dv.ten_dich_vu,
       ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem,
       hd.tien_dat_coc
from dich_vu dv
         left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
         left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_hop_dong
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where exists(
        select 1
        from hop_dong hd1
        where year (hd1.ngay_lam_hop_dong) = 2020 and month ( hd1.ngay_lam_hop_dong) in (10,11,12) and hd1.ma_dich_vu=dv.ma_dich_vu
)
  and not exists(
        select 1
        from hop_dong hd2
        where year (hd2.ngay_lam_hop_dong) = 2021 and month ( hd2.ngay_lam_hop_dong) in(1,2,3,4,5,6) and hd2.ma_dich_vu=dv.ma_dich_vu
)
group by hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ma_dich_vu, dv.ten_dich_vu, hd.tien_dat_coc;
-- 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, count(*) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
         left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         left join hop_dong hd on
    hd.ma_hop_dong = hdct.ma_hop_dong
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
group by dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
order by count(*) desc;
-- 14
select dvdk.ma_dich_vu_di_kem, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(*) as so_lan_su_dung
from dich_vu_di_kem dvdk
         left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         left join hop_dong hd on
    hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
group by dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, ldv.ten_loai_dich_vu
having count(*) = 1;
-- 15
select nv.ma_nhan_vien,
       nv.ho_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       nv.so_dien_thoai,
       nv.dia_chi,
       count(*) as hop_dong_toi_da
from nhan_vien nv
         left join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
         left join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
         left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year (hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count (*)<=3;
-- 16 

select *
from nhan_vien nv
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year (hd.ngay_lam_hop_dong) not in (select hd.ngay_lam_hop_dong from hop_dong hd where year (hd.ngay_lam_hop_dong) between 2019
  and 2021);


delete
from nhan_vien
where ma_nhan_vien
    not in
      (select ma_nhan_vien from hop_dong where year (
    ngay_lam_hop_dong) between 2019
  and 2021);

-- 17
UPDATE
    khach_hang
set ma_loai_khach = 1
WHERE ma_khach_hang in (
    select t.ma_khach_hang
    from (
             SELECT kh.ma_khach_hang,
                    kh.ho_ten,
                    lk.ten_loai_khach,
                    hd.ma_hop_dong,
                    dv.ten_dich_vu,
                    hd.ngay_lam_hop_dong,
                    hd.ngay_ket_thuc,
                    (sum(dvdk.gia * hdct.so_luong) + tmp.gia_dv) tong_tien
             FROM khach_hang kh
                      left JOIN loai_khach lk USING (ma_loai_khach)
                      left join hop_dong hd USING (ma_khach_hang)
                      left join dich_vu dv USING (ma_dich_vu)
                      left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
                      left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
                      left JOIN (
                 SELECT kh.ma_khach_hang     as ma_khach_hang,
                        sum(dv.chi_phi_thue) as gia_dv
                 from khach_hang kh
                          join hop_dong hd USING (ma_khach_hang)
                          join dich_vu dv USING (ma_dich_vu)
                 GROUP by kh.ma_khach_hang
             ) as tmp USING (ma_khach_hang)


             GROUP by kh.ma_khach_hang
             HAVING tong_tien > 1000000
         ) t
);

-- 18 
SET
foreign_key_checks = 0;
delete
kh
from khach_hang kh
where exists(
select 1
from hop_dong hd
where hd.ma_khach_hang =kh.ma_khach_hang and year(hd.ngay_lam_hop_dong)<2021
);
-- 19


-- 20 
select kh.ma_khach_hang as id,
       kh.ho_ten,
       kh.email,
       kh.so_dien_thoai,
       kh.ngay_sinh,
       kh.dia_chi
from khach_hang kh
union
select nv.ma_nhan_vien
        ,
       nv.ho_ten,
       nv.email,
       nv.so_dien_thoai,
       nv.ngay_sinh,
       nv.dia_chi
from nhan_vien nv;


	


use
quanlibanhang;
CREATE TABLE customer
(
    cid  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(25),
    cage TINYINT
);
CREATE TABLE `order`
(
    oid         INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cid         INT             NOT NULL,
    odate       DATETIME,
    ototalprice INT,
    FOREIGN KEY (cid)
        REFERENCES customer (cid)
);
CREATE TABLE product
(
    pid    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pname  VARCHAR(25),
    pprice INT
);
CREATE TABLE orderdetail
(
    oid   INT NOT NULL,
    pid   INT NOT NULL,
    odqty INT,
    PRIMARY KEY (oid, pid),
    FOREIGN KEY (oid)
        REFERENCES `order` (oid),
    FOREIGN KEY (pid)
        REFERENCES product (pid)
);

insert into customer
values (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);
insert into `order`
values (1, 1, '2006-3-21', null),
       (2, 1, '2006-3-23', null),
       (3, 1, '2006-3-16', null);

insert into product
values (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);
insert into orderdetail
values (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);
select *
from `order`;
select cus.*, pro.*
from customer cus
         join `order` o on o.cid = cus.cid
         join orderdetail od on od.oid = o.oid
         join product pro on pro.pid = od.pid;

select cus.*
from customer cus
where not exists(
        select 1 -- kiem tra nếu phần con đúng có dữ liệu thì nó sẽ trả về 1 và không in ra còn nêu phần con không thỏa thì nó sẽ không trả về dữ liệu mà where not exit sẽ được in ra;
        from `order` o
        where cus.cid = o.cid
    );
-- 	tính tổng giá bán 
select o.oid, o.odate, sum(od.odqty * p.pprice) as `total price`
from `order` o
         inner join orderdetail od on od.oid = o.oid
         join product p on p.pid = od.pid
group by o.oid, o.odate;




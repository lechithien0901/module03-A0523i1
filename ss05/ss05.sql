create database view_index_store_procedure;
use view_index_store_procedure;
create table products(
id int not null primary key,
productcode int not null,
productname varchar(30) not null,
productprice double not null,
productamount varchar(30) not null,
productdescription varchar(30) not null,
productstatus int not null	
);
insert into products
values(1,1,'nguyen van a',30000000,1,1,1),
(2,2,'nguyen van b',40000000,2,2,2),(3,3,'nguyen van c',50000000,3,3,3),(4,4,'nguyen van d',60000000,4,4,4);
-- buoc 3
create  index idex_products on products(productcode);
create index index_full_name on products(productname,productprice);
explain select * from products where productcode=2;
explain select * from products where productname='nguyen van a'or productname='nguyen van b';

 drop index  idex_products on products;
 drop index index_full_name on products;
-- câu truy vấn trước khi tạo index nó sẽ lập qua hết còn thêm index vào thi nó sẽ nhanh hơn 
-- buoc 4
create view  myviewproducts_my as
select id, productcode,productname,productprice,productstatus
from products;
select s.* from  myviewproducts s;
create or replace view view_of_me as select
productcode,productname
from myviewproducts;
select * from view_of_me;
update myviewproducts_my
set productname='nguyen van e'
where id=1;
select * from myviewproducts_my;
alter table products
 drop new_column ;
create view table_of_me as
select new_column
from products;
select* from table_of_me ;
-- buoc 5
delimiter //
create procedure my_procedure()
begin
select * from products; 
end //
delimiter ;
call my_procedure();
--
delimiter //
create procedure addnew(in id int,productcode int ,productname varchar(30),productprice double,productamount varchar(30),productdescription varchar(30) ,productstatus varchar(30) )
begin insert into products
values(id,productcode,productname,productprice,productamount,productdescription,productstatus);

end //
delimiter ;
call addnew(5,5,'nguyen van f',555555555,5,5,5);
drop procedure addnew;
select * from products;
delimiter //
create procedure fix(in id int,productcode int ,productname varchar(30),productprice double,productamount varchar(30),productdescription varchar(30) ,productstatus varchar(30))
begin
update products s
set s.id=id,
s.productcode=productcode,
s.productname=productname,
s.productprice=productprice,
s.productamount=productamount,
s.productdescription=productdescription,
s.productstatus =productstatus 
where s.id=id;
end //	
delimiter ;
call fix(5,6,6,6,6,6,6);
-- xoa
delimiter //
create procedure deletee(id int)
begin 
delete from products s
where id=s.id;
end //
delimiter ;
call deletee(1)










create
database erd_switch_table;
use
erd_switch_table;
create table phieuxuat
(
    sopx     int primary key not null,
    ngayxuat datetime
);
create table vattu
(
    mavtu  varchar(30) primary key not null,
    tenvtu varchar(30)
);

create table chitietphieuxuat
(
    dgxuat varchar(30),
    slxuat varchar(30),
    sopx   int not null,
    mavtu  varchar(30),
    primary key (sopx, mavtu),
    foreign key (sopx) references phieuxuat (sopx),
    foreign key (mavtu) references vattu (mavtu)

);
create table phieunhap
(
    sopn     int primary key not null auto_increment,
    ngaynhap datetime
);
create table chitietphhieunhap
(
    dgnhap varchar(30),
    slnhap varchar(30),
    sopn   int         not null,
    mavtu  varchar(30) not null,
    primary key (mavtu, sopn),
    foreign key (mavtu) references vattu (mavtu),
    foreign key (sopn) references phieunhap (sopn)


);
create table dondh
(
    sodh   int not null primary key auto_increment,
    ngaydh datetime

);
create table chitietdondathang
(
    mavtu varchar(30) not null,
    sodh  int         not null auto_increment,
    primary key (mavtu, sodh),
    foreign key (mavtu) references vattu (mavtu),
    foreign key (sodh) references dondh (sodh)
);
create table nhacc
(
    mancc  varchar(30) primary key not null,
    tenncc varchar(30),
    diachi varchar(30)
);
create table cungcap
(
    sodh  int         not null,
    mancc varchar(30) not null,
    primary key (sodh, mancc),
    foreign key (sodh) references dondh (sodh),
    foreign key (mancc) references nhacc (mancc)
);
create table sdt
(
    sdt   varchar(255),
    mancc varchar(30) not null,
    primary key (sdt, mancc),

    foreign key (mancc) references nhacc (mancc)
);
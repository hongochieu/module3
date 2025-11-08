create database m3_ss2_sales;
use m3_ss2_sales;
create table customer(
id int primary key auto_increment,
name varchar(20),
birthday date
);
create table orders(
id int primary key auto_increment,
order_time date,
total_price float,
customer_id int,
foreign key (customer_id) references customer(id)
);
create table product(
id int primary key auto_increment,
name varchar(20),
price float
);
create table order_detail(
order_id int,
product_id int,
quantity int,
primary key(order_id,product_id),
foreign key (order_id) references orders(id),
foreign key (product_id) references product(id)
);

use m3_ss2_sales;
insert into customer(name,birthday) values('Minh Quan','2000-12-10');
insert into customer(name,birthday) values('Ngoc Oanh','2003-8-7');
insert into customer(name,birthday) values('Hong Ha','2003-5-12');

insert into orders(customer_id,order_time) values(1,'2006-3-21');
insert into orders(customer_id,order_time) values(2,'2006-3-23');
insert into orders(customer_id,order_time) values(1,'2006-3-16');

insert into product(name,price) values('May Giat',3);
insert into product(name,price) values('Tu Lanh',5);
insert into product(name,price) values('Dieu Hoa',7);
insert into product(name,price) values('Quat',1);
insert into product(name,price) values('Bep Dien',2);

insert into order_detail(order_id,product_id,quantity) values(1,1,3);
insert into order_detail(order_id,product_id,quantity) values(1,3,7);
insert into order_detail(order_id,product_id,quantity) values(1,4,2);
insert into order_detail(order_id,product_id,quantity) values(2,1,1);
insert into order_detail(order_id,product_id,quantity) values(3,1,8);
insert into order_detail(order_id,product_id,quantity) values(2,5,4);
insert into order_detail(order_id,product_id,quantity) values(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.id as oID, o.order_time as oDate, o.total_price as oPrice
from orders o;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.name as name, p.id as pID
from customer c
inner join orders o on c.id = o.customer_id
inner join order_detail od on o.id = od.order_id
inner join product p on p.id = od.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.name as name
from customer c
left join orders o on c.id = o.customer_id
where o.customer_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.id as id, o.order_time as time, sum(od.quantity * p.price) as total_price
from orders o
left join order_detail od on o.id = od.order_id
left join product p on od.product_id = p.id
group by o.id, o.order_time;
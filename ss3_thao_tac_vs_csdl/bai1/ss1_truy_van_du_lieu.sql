insert into class (name) values('c0525l1');
insert into class (name) values('c0325l1');

insert into student (name,birthday,gender,email,score,class_id) values('Tran Huy','2000-10-12',true,'huy123@mail.com',9,1);
insert into student (name,birthday,gender,email,score,class_id) values('Trần Minh Hạo','2005-1-1',true,'hao123@mail.com',8,1);
insert into student (name,birthday,gender,email,score,class_id) values('Đình Hải','2002-7-5',true,'hai123@mail.com',6,2);
insert into student (name,birthday,gender,email,score,class_id) values('Nguyễn Minh','2003-9-10',true,'minh123@mail.com',5,2);
insert into student (name,birthday,gender,email,score,class_id) values('Huỳnh Hưng','2003-11-12',true,'long123@mail.com',3,1);


-- hien thi student co ten bat dau bang 'h'
select s.name
from student s where name like '% h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
alter table class
add column start_time date;
insert into class (start_time) values('2025-5-29');
insert into class (start_time) values('2025-12-29');
insert into class (start_time) values('2025-12-25');
update class set name = 'c0525l1', start_time = '2025-05-29' where id = 1;
update class set name = 'c0325l1', start_time = '2025-12-25' where id = 2;
delete from class
where id between 3 and 5;
select *
from class c where start_time like '%12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
use m3_csdl;
create table if not exists subjects(
id int primary key auto_increment,
name varchar(20),
credit int
);
create table subjects_student(
student_id int,
subjects_id int,
learn_time datetime,
primary key (subjects_id,student_id),
foreign key (subjects_id) references subjects(id),
foreign key (student_id) references student(id)
);
insert into subjects(name,credit) values('JavaScipt',3);
insert into subjects(name,credit) values('Java',5);
insert into subjects(name,credit) values('CSS',2);
insert into subjects(name,credit) values('Database',3);
insert into subjects(name,credit) values('English',2);
select * from subjects where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
update student set class_id = 2
where id = 9;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
alter table student drop column score;
alter table subjects_student add column score float;
insert into subjects_student(student_id,subjects_id,score) values(5,2,8);
insert into subjects_student(student_id,subjects_id,score) values(5,5,6.5);
insert into subjects_student(student_id,subjects_id,score) values(6,1,8.5);
insert into subjects_student(student_id,subjects_id,score) values(7,4,7.5);
insert into subjects_student(student_id,subjects_id,score) values(7,5,9);
insert into subjects_student(student_id,subjects_id,score) values(8,3,7.5);
insert into subjects_student(student_id,subjects_id,score) values(9,1,7);

select s.name as student_name, sub.name as sub_name, ss.score as mark
from subjects_student ss
left join student s on ss.student_id = s.id
left join subjects sub on ss.subjects_id = sub.id
order by ss.score desc, s.name asc
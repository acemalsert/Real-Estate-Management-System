/* 
 * CMPE232 Project Phase2
 * Ahmet Cemal Sert
 * Bensu Şeker
 * Talip Sina Postacı 
 * */

--- SQL QUERIES FOR CREATING TABLES 
CREATE TABLE house(
house_id SERIAL PRIMARY KEY,
selling_price int,
rent_price int,
number_of_flats int,
number_of_rooms int,
is_monhtly_rental boolean,
is_daily_rental boolean,
for_sale boolean,
is_sold boolean,
is_villa boolean,
is_apartment boolean,
is_rent boolean,
pet_accept boolean

);

create table sale(
sale_id serial primary key,
customer_id int,
house_id int,
seller_id int,
selling_price int,
sales_date date,
foreign key(customer_id) references customer,
foreign key(house_id) references house,
foreign key(seller_id) references seller

);

create table seller(
seller_id Serial primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone_number varchar(15) not null unique,
SSN varchar(11) unique not null, 
email varchar(100) unique not null,
gender varchar(10) not null, 
login_password varchar(30) not null
);

create table seller_adress(
seller_adress_id serial unique,
seller_id serial,
city varchar(25),
street varchar(50),
adress_no int, 
zip_code varchar(5),
primary key(seller_id,seller_adress_id),
foreign key(seller_id) references seller

);

create table customer_adress(
customer_adress_id serial unique,
customer_id serial,
city varchar(25),
street varchar(50),
adress_no int, 
zip_code varchar(5),
primary key(customer_id,customer_adress_id),
foreign key(customer_id) references customer

);

create table house_adress(
adress_id serial unique,
house_id serial,
zip_code varchar(5),
street varchar(50),
city varchar(25),
adress_no int, 
primary key(house_id,adress_id),
foreign key(house_id) references house

);

create table customer(
customer_id serial primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone_number varchar(15) unique not null ,
SSN varchar(11) unique not null, 
email varchar(100) unique not null,
monthly_income int not null,
gender varchar(10) not null

);

create table rent(
rent_id serial primary key, 
customer_id serial,
house_id serial,
seller_id serial,
rent_date date,
time_for_rent date,
rent_price int,
foreign key(customer_id) references customer,
foreign key(house_id) references house,
foreign key(seller_id) references seller

);

create table login_info(
login_info_id serial primary key,
email varchar(100),
login_password varchar(30)
);

--VİEW
create view male_sellers /* View for male sellers
							Gender == 1 means male and 2 means female other numbers are for other genders*/
as 
select * from seller as s
where 
s.gender ='1'


---ALTER 
alter table house add seller_id serial

alter table house add constraint seller_id foreign key(seller_id) references seller

alter table seller add login_password varchar(30)

alter table customer add login_password varchar(30)


--DROP
drop table customer_adress  cascade

drop table seller cascade


--UPDATE 
UPDATE House set selling_price = 100000 where house_id =5
update customer set last_name = 'sert' where customer_id = 5
update customer_adress set zip_code = '0600' where customer_adress_id = 7
update house_adress set city = 'Ankara' where house_id =3
update rent set rent_price = 1000 wheere rent_price  = 8
update sale set selling_price = 50000 where sale_id = 6
update seller set first_name = 'Ahmet' where seller_id = 7
update seller_adress set street = 'Farabi cad.' where seller_adress_id = 5

--QUERIES FOR VİEW
update public.male_sellers set last_name = 'Postman' where last_name ='Rees'
delete from male_sellers where last_name = 'Postman'

--DELETE
delete from sale as sa where sa.house_id = 10
delete from rent as sa where sa.house_id = 10
delete from house_adress as ha where ha.house_id = 10
delete from house as h where h.house_id = 10
delete from customer where phone_number like '%555%'
delete from seller as s where s.seller_id _id = 10
delete from customer_adress where customer_adress_id = 10
delete from seller_adress where seller_adress_id = 10


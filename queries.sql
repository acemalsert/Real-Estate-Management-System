/* 
 * CMPE232 Project Phase2
 * Ahmet Cemal Sert
 * Bensu Şeker
 * Talip Sina Postacı 
 * */

SELECT * FROM house_adress		/*prints the locations that are not Ankara or Istanbul*/
WHERE city NOT IN ('Ankara', 'İstanbul');

select count(distinct seller_id ) as TotalSellers  /*This query calculates how many unique seller publish the house */
from house;

select seller.first_name as sellernames /*lists people's first names who sale house*/
from seller natural join house 
where house.seller_id =seller.seller_id
group by seller.first_name;

select phone_number /* Shows the phone number of a seller whose email is null*/
from seller as s 
where s.email is null;

select avg(selling_price ) as "Average Amount of Sale" /* This query prints the average amount for a sale */
from sale

select count(rent_price)
from rent
where 
rent_price < 1000;  /*This query prints to find the total number of rent who have less than 1000 amount of price */

select * from house        /*This query will match any house that is less than 4 and pet accept is available */
where number_of_rooms < 4
and pet_accept = true;   

select * from customer_adress
where city = 'Ankara'
or city = 'İstanbul';  


select * from sale    /* This query will sort the result set by a sales_date numerically. It ordered that sort the results in descending order. */ 
order by sales_date DESC;

select distinct email /* Reduces the repetitive data to one. */
from seller;

select street   /* This query can be used inside of a where clause match a specified pattern. The given query will match any street begins with St in its title. */
from house_adress
where street like 'St%';

Select * from sale  /* The given query will match any movie made between the years 1000 and 5000 */
where selling_price between 1000 and 5000;

select * from rent  /* The given query will limit the result set to 5 rows */
limit 5; 

select * from house_adress /* The given query will match all address where the address has value or is not null. */
where city is not null; 

select * from house as h 	/*Selects the houses that accepts pets and located in city called Bara Datu*/
natural join house_adress as ha
where h.house_id = ha.house_id 
and h.pet_accept = true and ha.city = 'Bara Datu'

select s.first_name ,s.email from seller as s	/*Selects the names and emails of the sellers whose email ends with @samsung.com */
where s.email like '%@samsung.com'

select monthly_income,first_name /*Selects monthly_income and first_names of the customers who has a sallary bigger than 500,orders them by monthly_income and first name*/
from customer as c  
where c.monthly_income >50000
group by monthly_income,first_name 

select first_name,monthly_income /*Selects the customers whose monthly income is greater than some customer in the customer table who has over 5000 monthly income*/
from customer as c 
where monthly_income >some (select monthly_income 
							from customer as c2 
							where c2.monthly_income>5000)
							
select count(distinct house_id) as ExpensiveHouses /**/
from house
where selling_price >10010

select max(selling_price) as MaxPrice
from house 

select min(number_of_rooms) as MinRooms
from house 

select count(s.seller_id),sa.city 
from seller as s natural join seller_adress as sa
where s.seller_id = sa.seller_id 
group by sa.city
having count(s.seller_id)>1

select            /* The given query find sellers who have sale house at least one house with an selling_price greater than 1000 */ 
first_name,last_name
from seller s1
where exists (  select 1
			    from sale s2
				where s2.seller_id = s1.seller_id and selling_price > 1000)
				Order by first_name,last_name;


SELECT seller_id,  /* The given query gives to know the sale information of seller id 1 and 2, and using the in operator in the where clause */
       house_id,
       sales_date	
FROM	sale
WHERE	seller_id IN (1, 2)
ORDER BY sales_date DESC;


select customer_id,   /* The given query adds the HAVING clause to select the only customers who have been monthly income more than 1000, and SUM function takes the name of a column as an argument and returns the sum of all the value in that column*/
sum(monthly_income)
from
customer
group by
customer_id
having sum (monthly_income) > 1000;


select max(selling_price) /* The given query will return the largest value from the selling_price */
from sale;

select selling_price from  /* The given query combines result sets of two or more select statements into a single result set */
house
intersect
select rent_price from house;

select * from house as h where h.house_id in(select street from house_adress as ha where h.house_id = ha.house_id)
select * from house where is_monhtly_rental = true or is_daily_rental = true

--- INSERT QUERIES
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Ahmet','Sert','5328709032','123456','acemal.sert@tedu.edu.tr',100000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Sina','Postacı','5348539032','678912','tsina@tedu.edu.tr',10000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Bensu','Şeker','3148539032','528912','bensu@tedu.edu.tr',30000,'female','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Itadori','Juiji','3348539032','178912','itadori@tedu.edu.tr',1000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Nobara','Kugisaki','48539032','828912','nobara@tedu.edu.tr',1500,'female','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Gojo','Satoru','48339032','028912','gojo@tedu.edu.tr',75000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Naruto','Uzumaki','5339032','128912','naruto@tedu.edu.tr',2000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Sasuke','Uchiha','132339032','348912','sasuke@tedu.edu.tr',3000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Kakashi','Hatake','02339032','1242912','kakashi@tedu.edu.tr',5000,'male','abcde');
insert into customer (first_name,last_name,phone_number,ssn,email,monthly_income,gender,login_password) values('Obito','Uchiha','513339032','13228912','obito@tedu.edu.tr',1000,'male','abcde');

insert into rent (rent_date, time_for_rent, rent_price) values ('2020/09/12', '2020/07/29', 1000);
insert into rent (rent_date, time_for_rent, rent_price) values ('2021/03/27', '2020/06/09', 1500);
insert into rent (rent_date, time_for_rent, rent_price) values ('2020/08/17', '2020/11/19', 2000);
insert into rent (rent_date, time_for_rent, rent_price) values ('2020/05/18', '2020/11/13', 3000);
insert into rent (rent_date, time_for_rent, rent_price) values ('2021/04/24', '2021/04/01', 900);
insert into rent (rent_date, time_for_rent, rent_price) values ('2020/07/12', '2020/09/18', 700);
insert into rent (rent_date, time_for_rent, rent_price) values ('2020/11/03', '2020/07/31', 1300);
insert into rent (rent_date, time_for_rent, rent_price) values ('2021/03/23', '2020/09/29', 5000);
insert into rent (rent_date, time_for_rent, rent_price) values ('2020/11/05', '2021/04/04', 2000);
insert into rent (rent_date, time_for_rent, rent_price) values ('2021/04/21', '2021/01/28', 1350);

insert into sale (selling_price, sales_date) values (100000, '2021/3/27');
insert into sale (selling_price, sales_date) values (100000, '2021/1/25');
insert into sale (selling_price, sales_date) values (100001, '2020/8/6');
insert into sale (selling_price, sales_date) values (100001, '2020/8/16');
insert into sale (selling_price, sales_date) values (100002, '2021/2/25');
insert into sale (selling_price, sales_date) values (100002, '2021/4/15');
insert into sale (selling_price, sales_date) values (100003, '2020/11/24');
insert into sale (selling_price, sales_date) values (100003, '2021/1/6');
insert into sale (selling_price, sales_date) values (100004, '2020/6/18');
insert into sale (selling_price, sales_date) values (100004, '2021/1/18');

insert into customer_adress (city, street, adress_no, zip_code) values ('Santo Ângelo', '964 Pawling Lane', 1, '7105');
insert into customer_adress (city, street, adress_no, zip_code) values ('Kuangsan', '0882 Veith Hill', 2, '8888');
insert into customer_adress (city, street, adress_no, zip_code) values ('Palanit', '08795 Muir Junction', 3, '2955');
insert into customer_adress (city, street, adress_no, zip_code) values ('Tandahimba', '765 Bashford Place', 4, '5823');
insert into customer_adress (city, street, adress_no, zip_code) values ('Kuniran', '3719 Nevada Hill', 5, '2222');
insert into customer_adress (city, street, adress_no, zip_code) values ('Xarrë', '1310 Magdeline Crossing', 6, '3718');
insert into customer_adress (city, street, adress_no, zip_code) values ('El Pino', '0 Eastlawn Alley', 7, '6213');
insert into customer_adress (city, street, adress_no, zip_code) values ('Mala Danylivka', '9973 Mockingbird Avenue', 8, '5009');
insert into customer_adress (city, street, adress_no, zip_code) values ('Jianghai', '5775 Comanche Lane', 9, '2479');
insert into customer_adress (city, street, adress_no, zip_code) values ('Verkhoshizhem’ye', '90155 Union Hill', 10, '2541');

insert into house_adress (zip_code, street, city, adress_no) values ('92507', '4279 Tony Center', 'Moravská Nová Ves', 1);
insert into house_adress (zip_code, street, city, adress_no) values ('97134', '9504 Quincy Pass', 'Abreus', 2);
insert into house_adress (zip_code, street, city, adress_no) values ('74376', '9533 Independence Hill', 'Bara Datu', 3);
insert into house_adress (zip_code, street, city, adress_no) values ('66875', '8 Forest Dale Road', 'Pantubig', 4);
insert into house_adress (zip_code, street, city, adress_no) values ('42008', '6465 Mockingbird Court', 'Metallostroy', 5);
insert into house_adress (zip_code, street, city, adress_no) values ('53865', '99 Vermont Lane', 'Maştağa', 6);
insert into house_adress (zip_code, street, city, adress_no) values ('51952', '782 Service Road', 'Alavus', 7);
insert into house_adress (zip_code, street, city, adress_no) values ('82092', '1 Meadow Ridge Plaza', 'Krasnaya Poyma', 8);
insert into house_adress (zip_code, street, city, adress_no) values ('79458', '0607 Linden Junction', 'Biyang', 9);
insert into house_adress (zip_code, street, city, adress_no) values ('14334', '5 Heath Avenue', 'Velingrad', 10);
insert into house_adress (zip_code, street, city, adress_no) values ('51171', '585 Shasta Way', 'Golynki', 11);
insert into house_adress (zip_code, street, city, adress_no) values ('33901', '95628 Sheridan Circle', 'Göteborg', 12);
insert into house_adress (zip_code, street, city, adress_no) values ('05341', '8 Stone Corner Center', 'Casa Quemada', 13);

insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10000, 1000, 1, 2, false, false, true, false, false, false, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10005, 1001, 2, 3, false, false, false, false, false, true, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10010, 1002, 3, 4, true, true, true, false, false, false, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10015, 1003, 4, 5, true, true, false, true, true, true, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10020, 1004, 1, 6, true, false, true, true, false, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10025, 1005, 2, 7, false, false, true, true, true, true, false, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10030, 1006, 3, 8, true, false, false, true, true, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10035, 1007, 4, 9, false, false, false, true, true, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10040, 1008, 1, 10, true, true, false, false, false, true, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10045, 1009, 2, 11, true, true, false, true, false, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10050, 1010, 3, 12, true, false, true, false, true, false, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10055, 1011, 4, 13, true, false, true, true, false, true, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10060, 1012, 1, 14, false, true, true, true, true, false, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10065, 1013, 2, 15, true, false, true, false, true, false, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10070, 1014, 3, 16, false, true, false, true, false, false, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10075, 1015, 4, 17, true, false, true, false, true, true, true, true);


insert into seller_adress (city, street, adress_no, zip_code) values ('Qatanah', '4940 Buena Vista Point', 20, '9490');
insert into seller_adress (city, street, adress_no, zip_code) values ('La Punta', '920 Lien Terrace', 21, '0572');
insert into seller_adress (city, street, adress_no, zip_code) values ('Norton', '311 Pleasure Avenue', 22, '2799');
insert into seller_adress (city, street, adress_no, zip_code) values ('Velky Tynec', '9140 Melody Crossing', 23, '8792');
insert into seller_adress (city, street, adress_no, zip_code) values ('Yaoundé', '12506 Ridgeway Trail', 24, '8778');
insert into seller_adress (city, street, adress_no, zip_code) values ('Komyshuvakha', '58 Northfield Plaza', 25, '9658');
insert into seller_adress (city, street, adress_no, zip_code) values ('Barra', '793 New Castle Trail', 26, '2522');
insert into seller_adress (city, street, adress_no, zip_code) values ('Yanaoca', '51 2nd Hill', 27, '8442');
insert into seller_adress (city, street, adress_no, zip_code) values ('Curahklapa', '806 Vernon Street', 28, '3498');
insert into seller_adress (city, street, adress_no, zip_code) values ('Kallithea', '57 David Avenue', 29, '7226');
insert into seller_adress (city, street, adress_no, zip_code) values ('Konary', '29 Bultman Hill', 30, '1368');
insert into seller_adress (city, street, adress_no, zip_code) values ('Jardim', '0 Mcguire Drive', 31, '6792');
insert into seller_adress (city, street, adress_no, zip_code) values ('Baishi', '073 Saint Paul Court', 32, '1769');


insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10000, 1000, 1, 2, false, false, true, false, false, false, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10005, 1001, 2, 3, false, false, false, false, false, true, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10010, 1002, 3, 4, true, true, true, false, false, false, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10015, 1003, 4, 5, true, true, false, true, true, true, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10020, 1004, 1, 6, true, false, true, true, false, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10025, 1005, 2, 7, false, false, true, true, true, true, false, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10030, 1006, 3, 8, true, false, false, true, true, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10035, 1007, 4, 9, false, false, false, true, true, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10040, 1008, 1, 10, true, true, false, false, false, true, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10045, 1009, 2, 11, true, true, false, true, false, true, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10050, 1010, 3, 12, true, false, true, false, true, false, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10055, 1011, 4, 13, true, false, true, true, false, true, true, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10060, 1012, 1, 14, false, true, true, true, true, false, true, false);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10065, 1013, 2, 15, true, false, true, false, true, false, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10070, 1014, 3, 16, false, true, false, true, false, false, false, true);
insert into house (selling_price, rent_price, number_of_flats, number_of_rooms, is_monhtly_rental, is_daily_rental, for_sale, is_sold, is_villa, is_apartment, is_rent, pet_accept) values (10075, 1015, 4, 17, true, false, true, false, true, true, true, true);



insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Aloin', 'Rees', '321-925-6525', '615-79-4770', 'arees0@chronoengine.com', 1, '9102579699');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Maryann', 'Pellew', '114-382-3420', '887-43-5626', 'mpellew1@example.com', 2, '6358712240');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Keelia', 'Jedrzejewsky', '407-319-3845', '174-37-4004', 'kjedrzejewsky2@hc360.com', 3, '9358644854');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Yoshiko', 'Favela', '340-242-8155', '447-15-5846', 'yfavela3@wikispaces.com', 4, '5352724281');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Hyacinthie', 'Doughartie', '481-801-1872', '354-03-2806', 'hdoughartie4@bing.com', 5, '5285190074');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Annelise', 'Barfford', '800-741-8212', '105-04-0645', 'abarfford5@wikipedia.org', 6, '3510048987');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Celle', 'Martijn', '640-883-3164', '542-11-5271', 'cmartijn6@sfgate.com', 1, '8998405447');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Flossie', 'Castelijn', '131-616-2708', '302-98-4693', 'fcastelijn7@elegantthemes.com', 2, '6914954597');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Moina', 'Hulson', '311-883-2436', '333-96-7518', 'mhulson8@digg.com', 3, '6156350876');
insert into seller (first_name, last_name, phone_number, ssn, email, gender, login_password) values ('Evonne', 'Broomhead', '867-456-8330', '375-69-0835', 'ebroomhead9@columbia.edu', 4, '3083540843');



-- SPECIAL QUERIES
select * from house as h 
natural join house_adress,rent
where h.pet_accept = false and  h.number_of_flats = 3
and rent.rent_date - time_for_rent <=90

select sum(selling_price) from sale as s
natural join customer as c,house_adress as ha
where ha.street = 'Keçioren' and c.gender = '2';





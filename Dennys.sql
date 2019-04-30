DROP DATABASE IF EXISTS dennys;
create database dennys;

use dennys;

create table restaurants
(
	restaurant_id int not null primary key auto_increment,
    restaurant_no int not null,
    restaurant_city varchar(50) not null,
    restaurant_state varchar(20) not null,
    restaurant_zip_code varchar(20) not null,
    restaurant_phone_no varchar(20) not null,
    restaurant_manager_firstname varchar(20) not null,
    restaurant_manager_lastname varchar(20) not null,
    restaurant_revenue decimal(9,2) not null
);

create table customers
(
	customer_id int not null primary key auto_increment,
    customer_no int not null,
    customer_first_name varchar(20) not null,
    customer_last_name varchar(20) not null,
    credit_card_number varchar(40) not null,
    csc_no varchar(3) not null,
    expiration_date date not null
);


create table banned_people_from_dennys
(
	customer_id int not null,
	first_name varchar(20) not null,
    last_name varchar(20) not null,
    reason_for_ban varchar(20) not null,
    
    constraint customer_fk_id
		foreign key (customer_id)
        references customers(customer_id)
);

create table menu
(
	menu_item_id int not null primary key auto_increment,
    menu_item_name varchar(20) not null,
    menu_price decimal(9, 2) not null,
    restaurant_id int not null,
    in_stock bool not null,
    
    constraint restaurant_fk_id
		foreign key (restaurant_id)
        references restaurants(restaurant_id)
);


create table employees
(
	employee_id int not null primary key auto_increment,
    employee_first_name varchar(20) not null,
    employee_last_name varchar(20) not null,
    employee_no int not null,
    employee_position varchar(30) not null,
    employee_salary decimal(9, 2) not null,
    restaurant_id int not null,
    
    constraint restaurant_fk_id2
		foreign key (restaurant_id)
        references restaurants(restaurant_id)
);

create table franchisees
(
	franchisee_id int not null primary key auto_increment,
    franchisee_first_name varchar(20) not null,
    franchisee_last_name varchar(20) not null,
    restaurant_id int not null,
    
    constraint restaurant_fk_id3
		foreign key (restaurant_id)
        references restaurants(restaurant_id)
);

create table invoices
(
	invoice_id int not null primary key auto_increment,
    restaurant_id int not null,
    franchisee_id int not null,
    invoice_no int not null,
    invoice_date date not null,
    invoice_total decimal(9,2) not null,
    payment_total decimal(9,2) not null,
    payment_due date not null,
    
    constraint restaurant_fk_id4
		foreign key (restaurant_id)
        references restaurants(restaurant_id),
	constraint franchisee_fk_id
		foreign key (franchisee_id)
        references franchisees(franchisee_id)
);

INSERT INTO restaurants VALUES 
(default,001, 'Staten Island', 'New York', 10314, 7185555551, 'Waleed', 'Ahmad', '32344.34'),
(default, 002, 'Manhattan', 'New York', 10012, 7185555552, 'Russell', 'LaCour', '12345.34'),
(default, 003, 'Queens', 'New York', 11365, 7185555553, 'Gian', 'Schechter', '98743.69'),
(default, 004, 'Brooklyn', 'New York',11223, 7185555554, 'Aristotle' , 'Katimbang', '63745.82'),
(default, 005, 'Bronx', 'New York', 10451, 715555555555, 'Ji Hyeon', 'Jung', '88232.44'),
(default, 006, 'Brooklyn', 'New York', 11201, 71855555556, 'Shad', 'Gaspard', '133343.33'),
(default, 007, 'Lebanon', 'New Hampshire', 03756, 7185555567,'Charles', 'LaCour', '114333.00'),
(default, 008, 'Des Moine','Iowa', 50301, 71855555558, 'Berkeley', 'Volkja', '112321.22'),
(default, 009, 'San Francisco', 'California', 94177, 71855555559, 'Willie', 'Mays', '200000.00'),
(default, 010, 'Anaheim', 'California', 92899, 7185555560, 'Mickey', 'Mouse', '1000000.00');

Insert into customers values
(default, 001, 'Yi Zen', 'Looi', '004333477573333', '222', '2020-06-17'),
(default, 002, 'David', 'LaCour', '8888333355328892', '355', '2023-10-31'),
(default, 003, 'Onix', 'Bobe', '123456789002', '232', '2021-06-14'),
(default, 004, 'Ricardo', 'Phillipe', '7777333432239553', '398', '2019-07-04'),
(default, 005, 'Mohammad', 'Baidas', '3332293941106668', '666', '2024-08-24');

INSERT INTO employees values
(default, 'Johnny', 'Twobyfour', 888783, 'Cook', '13000.33', 5),
(default, 'Kenny', 'Jeannite', 8883323, 'Host', '12000.33', 2),
(default, 'Sylvia', 'Jones', 8886710, 'Waitress', '78333.20', 7),
(default, 'Goofy', 'Geef', 8882321, 'Cook', '133432.69', 10),
(default, 'Minnie', 'Mouse', 8882322, 'Waitress', '690000.00', 10);

INSERT INTO banned_people_from_dennys VALUES
(1, 'Yi Zen', 'Looi', 'property damage');

INSERT INTO franchisees values
(111,'Travis','Scott', 4),
(112,'Noel','Sosa', 1),
(113,'John','Cena', 2),
(114,'Randy','Orton', 8),
(115, 'Jeff','Hardy', 7),
(116, 'Rey','Mysterio', 3),
(117, 'Bret','Hart', 6),
(118, 'Shawn','Michaels', 5),
(119, 'Hunter','Helmsley', 10),
(110, 'The','Undertaker', 9);

INSERT INTO menu VALUES
(101, 'Grand Slam', '7.29', 1,  true),
(102, 'Cinn Roll Pancake', '9.29', 5, false),
(103, 'Slamburger', '9.89', 3, true),
(104, 'Pluto Steak bits', '15.44', 10, true),
(105, 'Omelette', '10.29', 1, true),
(106, 'MickeyWaffles', '20.00', 10, true);

INSERT INTO invoices VALUES
(223, 1, 111, 444, '2020-12-05', 12.45, 35.45, '2020-12-25'),
(255, 3, 114, 436, '2019-12-05', 123.99, 255.65, '2019-12-25'),
(263, 6, 117, 498, '2018-12-05', 142.50, 15.75, '2018-12-25'),
(278, 9, 119, 477, '2017-1-05', 133.80, 10.99, '2017-12-25');

Select * from restaurants order by restaurant_state asc;
Select * from employees where restaurant_id = 10;
select avg(menu_price) as myAvg, menu_item_name from menu;
update franchisees set franchisee_first_name = 'Bob', franchisee_last_name = 'Iger' where franchisee_id = 119;
select franchisee_id, franchisee_first_name, franchisee_last_name from franchisees;
delete from invoices where invoice_id = 278;

SELECT sum(restaurant_revenue) as mySum from restaurants where restaurant_state = 'New York';

CREATE VIEW restaurant_view as SELECT restaurant_id, restaurant_city, restaurant_state from restaurants;
CREATE VIEW Franchisee_view as SELECT franchisee_id, franchisee_first_name, franchisee_last_name, restaurant_id from franchisees;
Create view employee_view as SELECT employee_id, employee_no, employee_first_name, employee_last_name, employee_salary from employees;





Create table Customer(
customer_id number(20),
contact_info number(20),
address varchar(50),
primary key(customer_id)
);
Create table Booking(
booking_id number(20),
customer_id number(20),
book_date Date,
service_id number(20),
primary key(booking_id),
foreign key(customer_id) references Customer(customer_id)
);
create table payment(
payment_id number(20),
booking_id number(20),
payment_date Date,
primary key(payment_id),
foreign key(booking_id) references Booking(booking_id) 
);
Create table Stylist(
stylist_id number(20),
customer_id number(20),
stylist_service varchar(20),
stylist_cost number(20),
primary key(stylist_id),
foreign key(customer_id) references Customer(customer_id) 
);
create table service(
service_id number(20),
servicetype_id number(20),
stylist_id number(20),
primary key(service_id),
foreign key (stylist_id) references stylist(stylist_id)
);

insert into Customer(customer_id,contact_info,address)values(1,0196,'dhaka');
insert into Customer(customer_id,contact_info,address)values(2,0197,'dhaka');
insert into Customer(customer_id,contact_info,address)values(3,01968,'khulna');
insert into Customer(customer_id,contact_info,address)values(4,01967,'barishal');
insert into Customer(customer_id,contact_info,address)values(5,0194,'Noakhali');
insert into Customer(customer_id,contact_info,address)values(6,0195,'Comilla');
insert into Customer(customer_id,contact_info,address)values(7,0198,'sylhet');
insert into Customer(customer_id,contact_info,address)values(8,0192,'chandpur');
insert into Customer(customer_id,contact_info,address)values(9,0190,'nator');
insert into Customer(customer_id,contact_info,address)values(10,0191,'rajshahi');

insert into Booking(booking_id,customer_id,book_date,service_id)values(11,1,'01-jan-2022',21);
insert into Booking(booking_id,customer_id,book_date,service_id)values(12,2,'02-jan-2022',22);
insert into Booking(booking_id,customer_id,book_date,service_id)values(13,3,'03-jan-2022',23);
insert into Booking(booking_id,customer_id,book_date,service_id)values(14,4,'04-jan-2022',24);
insert into Booking(booking_id,customer_id,book_date,service_id)values(15,5,'05-jan-2022',25);
insert into Booking(booking_id,customer_id,book_date,service_id)values(16,6,'06-jan-2022',26);
insert into Booking(booking_id,customer_id,book_date,service_id)values(17,7,'07-jan-2022',27);
insert into Booking(booking_id,customer_id,book_date,service_id)values(18,8,'08-jan-2022',28);
insert into Booking(booking_id,customer_id,book_date,service_id)values(19,9,'09-jan-2022',29);
insert into Booking(booking_id,customer_id,book_date,service_id)values(20,10,'10-jan-2022',30);

insert into payment(payment_id,booking_id,payment_date)values(31,11,'01-jan-2022');
insert into payment(payment_id,booking_id,payment_date)values(32,12,'02-jan-2022');
insert into payment(payment_id,booking_id,payment_date)values(33,13,'03-jan-2022');
insert into payment(payment_id,booking_id,payment_date)values(34,14,'04-jan-2022');
insert into payment(payment_id,booking_id,payment_date)values(1,15,'05-jan-2022');
insert into payment(payment_id,booking_id,payment_date)values(35,16,'01-feb-2022');
insert into payment(payment_id,booking_id,payment_date)values(36,17,'02-feb-2022');
insert into payment(payment_id,booking_id,payment_date)values(37,18,'03-feb-2022');
insert into payment(payment_id,booking_id,payment_date)values(38,19,'04-feb-2022');
insert into payment(payment_id,booking_id,payment_date)values(39,20,'05-feb-2022');

insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(40,1,'hair',400);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(41,2,'spa',500);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(42,3,'nail',300);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(43,4,'spa and hair',900);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(44,5,'eyebrow',40);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(45,6,'massage',400);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(46,7,'facial',700);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(47,8,'facial and hair',800);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(48,9,'laser',1000);
insert into stylist(stylist_id,customer_id,stylist_service,stylist_cost)values(49,10,'makeover',2400);

insert into service(service_id,servicetype_id,stylist_id)values(50,3,40);
insert into service(service_id,servicetype_id,stylist_id)values(51,5,41);
insert into service(service_id,servicetype_id,stylist_id)values(52,6,42);
insert into service(service_id,servicetype_id,stylist_id)values(53,8,43);
insert into service(service_id,servicetype_id,stylist_id)values(54,9,44);
insert into service(service_id,servicetype_id,stylist_id)values(55,12,45);
insert into service(service_id,servicetype_id,stylist_id)values(56,13,46);
insert into service(service_id,servicetype_id,stylist_id)values(57,21,47);
insert into service(service_id,servicetype_id,stylist_id)values(58,22,48);
insert into service(service_id,servicetype_id,stylist_id)values(59,23,49);

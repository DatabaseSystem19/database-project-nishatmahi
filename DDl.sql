////display data///
select * from stylist where stylist_cost=400;

select * from Customer where customer_id=(select customer_id from Booking where service_id=24);
///update///
update Booking set book_date='07-jan-2022' where booking_id=13;
/////delete///

insert into Customer(customer_id,contact_info,address)values(13,01995,'patuakhali');
delete from  Customer where customer_id=13;

/////union,intersect,except

select address from Customer where address like 'd%' union select address from Customer where address like '%a%';
/////with clause

with max_price(val) as (select max(stylist_cost) from stylist)
select * from stylist,max_price where stylist.stylist_cost=max_price.val;

/////aggregate
select count(service_id) as number_of_service from service;
select count(distinct servicetype_id) as number_of_service from service;
select avg(stylist_cost) from stylist;
select sum(stylist_cost) from stylist;

/////group by and having
select stylist_service,avg(stylist_cost) from stylist group by stylist_service;
select stylist_service,stylist_cost from stylist group by stylist_service having avg(stylist_cost)>300;
select count(*) from Cusromer;
select count(customer_id) as number_of_Customer from Customer;

///nested query
select * from Cusomer where address='dhaka' and customer_id in (select customer_id from stylist where stylist_service like '%spa%');

///set membership
select * from stylist where stylist_id> some(select stylist_id from stylist where stylist_id>=47);
select * from stylist where stylist_id> all(select stylist_id from stylist where stylist_id>=47);
SELECT * FROM stylist WHERE stylist_service LIKE 's%';
SELECT * FROM stylist WHERE stylist_service LIKE '%a';

///join operation
select * from customer natural join booking where booking_id=13;
select address,booking_id from customer join booking using(customer_id);
select address,booking_id from customer join booking on customer.customer_id=booking.customer_id;
select address,booking_id from customer left outer join booking using(customer_id);
select address,booking_id from customer right outer join booking using(dcustomer_id);

////view
create view customer_details as select customer_id,address from customer;
create view stylist_detalis as select stylist_service from stylist where customer_id=(select customer_id from customer where address='dhaka');



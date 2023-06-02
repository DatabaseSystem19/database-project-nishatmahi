set serveroutput on
declare 
customer_id customer.customer_id%type;
contact_info customer.contact_info%type;
address varchar;
begin
select customer_id,contact_info,address into customer_id,contact_info,address from customer where customer_id=7;
dbms_output.put_line('customer_id: '||customer_id|| ' Contact_info: '||contact_info || ' Address '||address);
end;
/
///insert and set default value
set serveroutput on
declare 
customer_id customer.customer_id%type:=9;
address customer.address%type:='dhaka';
contact_info number:=30;
begin
insert into customer values(customer_id,address);
end;
/
/////rowtype///
set serveroutput on
declare 
customer_row customer%rowtype;
begin
select customer_id,address,contact_info into customer_row.customer_id,customer_row.address,customer_row.contact_info from customer where customer_id=7;
end;
/
///Cursor and row count///
set serveroutput on
declare 
cursor customer_cursor is select * from customer;
customer_row customer%rowtype;
begin
open customer_cursor;
fetch customer_cursor into customer_row.customer_id,customer_row.contact_info,customer_row.address;
while customer_cursor%found loop
dbms_output.put_line('customer_id: '||customer_row.customer_id|| ' Contact_info: '||customer_row.contact_info ||' Address: '||customer_row.address);
dbms_output.put_line('Row count: '|| customer_cursor%rowcount);
fetch customer_cursor into customer_row.customer_id,customer_row.contact_info,customer_row.address;
end loop;
close customer_cursor;
end;
/
////FOR LOOP/WHILE LOOP/ARRAY with extend() function///
set serveroutput on
declare 
  counter number;
  servicing_id booking.service_id%type;
  TYPE NAMEARRAY IS VARRAY(5) OF booking.service_id%type; 
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 12..16  
  loop
    select service_id into servicing_id from booking where booking_id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=servicing_id;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/
////ARRAY without extend() function///
DECLARE 
   counter NUMBER := 1;
   servicing_id service.service_id%TYPE;
   TYPE NAMEARRAY IS VARRAY(5) OF service.service_id%TYPE;
   A_NAME NAMEARRAY:=NAMEARRAY('service 1', 'service 2', 'service 3', 'service 4', 'service 5'); 
   -- VARRAY with a fixed size of 5 elements and initialized with book names
BEGIN
   counter := 1;
   FOR x IN 12..16  
   LOOP
      SELECT service_id INTO servicing_id FROM service WHERE service_id=x;
      A_NAME(counter) := serviccing_id;
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
//////if-else////
DECLARE 
   counter NUMBER := 1;
   addressing customer.address%TYPE;
   TYPE NAMEARRAY IS VARRAY(5) OF customer.address%TYPE;
   A_NAME NAMEARRAY:=NAMEARRAY('address 1', 'address 2', 'address 3', 'address 4', 'address 5'); 
   
BEGIN
   counter := 1;
   FOR x IN 1..5 
   LOOP
      SELECT address INTO addressing FROM customer WHERE customer_id=x;
      if addressing='dhaka'
        then
        dbms_output.put_line(addressing||' is a '||'dhaka');
      elsif addressing='khulna'  
        then
        dbms_output.put_line(addressing||' is a '||'khulna');
      else 
        dbms_output.put_line(addressing||' is a '||'noakhali');
        end if;
   END LOOP;
END;
//////procedure////
CREATE OR REPLACE PROCEDURE proc2(
  var1 IN NUMBER,
  var2 OUT VARCHAR2,
  var3 IN OUT NUMBER
)
AS
  t_show CHAR(30);
BEGIN
  t_show := 'From procedure: ';
  SELECT address INTO var2 FROM customer WHERE customer_id IN (SELECT customer_id FROM booking WHERE booking_id = var1);
  var3 := var1 + 1; 
  DBMS_OUTPUT.PUT_LINE(t_show || var2 || ' code is ' || var1 || ' In out parameter: ' || var3);
END;
/

////function///
create or replace function f_Calculation
(
x number,
y number
)
return number is
begin
return x-y;
end;
/

select f_Calculation(100,50)
from dual;
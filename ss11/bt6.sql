use sakila;
-- 3
create view view_film_category as
select f.film_id  , f.title  , c.name as category_name  from film f
inner join film_category fc on fc.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id;

-- 4
create view view_high_value_customers as
select c.customer_id  , c.first_name , c.last_name  , p.amount as total_payment  from customer c
inner join payment p on c.customer_id = p.customer_id and p.amount>100;

-- 5
create index idx_rental_rental_date  on rental (rental_date );
explain SELECT * FROM rental WHERE DATE(rental_date) = '2005-06-14';

-- 6
delimiter //
create Procedure  CountCustomerRentals (in in_customer_id int , out rental_count  double)
begin 
   select count(r.customer_id) into rental_count  from rental r
   where r.customer_id = in_customer_id ;
end // 
delimiter ;

-- 7
delimiter //
create Procedure GetCustomerEmail (in in_customer_id int)
begin 
select email from customer where in_customer_id = customer.customer_id ;
end //
delimiter ;
drop procedure GetCustomerEmail ;
drop procedure CountCustomerRentals ;
drop view view_high_value_customers , view_film_category ;
drop index idx_rental_rental_date on rental;





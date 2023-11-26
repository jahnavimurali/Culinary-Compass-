create or replace procedure calcBill(ip_order_id IN Bill.order_id%TYPE) IS
calc_amount number;
price food.price_per_unit%TYPE;
CURSOR food_order_cursor is
select o.food_id, o.food_quantity from orders o where o.order_id= ip_order_id;
begin
calc_amount:=0;
for food_record in food_order_cursor loop
select f.price_per_unit into price from food f where food_record.food_id=f.food_id;
calc_amount:=calc_amount + price * food_record.food_quantity;
end loop;
UPDATE bill b
  SET b.amount = calc_amount
  WHERE b.order_id = ip_order_id;
end;
/


create or replace trigger check_ingredients_quantity after insert or update of food_quantity on orders
for each row
declare
available ingredient.ingredient_quantity%TYPE;
cursor fd_ing_cursor is
select fi.ingredient_id ing_id, fi.quantity_per_ingredient q_ing from food_ingredient fi where fi.food_id=:new.food_id;
begin
for fd_ing in fd_ing_cursor loop
select i.ingredient_quantity into available from ingredient i where i.ingredient_id=fd_ing.ing_id;
if :new.food_quantity*fd_ing.q_ing < available then
UPDATE ingredient
SET ingredient_quantity=ingredient_quantity-(:new.food_quantity*fd_ing.q_ing)
where ingredient_id = fd_ing.ing_id;
else 
RAISE_APPLICATION_ERROR(-20001, 'ERROR: REQUESTED DISH CANNOT BE PREPARED!');
end if;
end loop;
end;
/


create or replace trigger update_ingredients_quantity after delete on orders
for each row
declare
available ingredient.ingredient_quantity%TYPE;
cursor fd_ing_cursor is
select fi.ingredient_id ing_id, fi.quantity_per_ingredient q_ing from food_ingredient fi where fi.food_id=:old.food_id;
begin
for fd_ing in fd_ing_cursor loop
select i.ingredient_quantity into available from ingredient i where i.ingredient_id=fd_ing.ing_id;
UPDATE ingredient
SET ingredient_quantity=ingredient_quantity+(:old.food_quantity*fd_ing.q_ing)
where ingredient_id = fd_ing.ing_id;
end loop;
end;
/

create or replace trigger allocate_tables after insert on reservation
for each row
declare
v_table_id seating.table_id%TYPE;
v_capacity seating.capacity%TYPE;
begin
select s.table_id, s.capacity
into v_table_id, v_capacity
from seating s
join table_status ts
where s.table_id=ts.table_id and ts.status='U' and s.capacity=:new.diners_count and rownum=1;
if v_table_id is NOT NULL then
UPDATE table_status ts
set ts.reservation_id=:new.reservation_id and ts.status='R'
where ts.table_id=v_table_id;
else 
raise_application_error(-20002, 'No available tables for the given diners count.');
end if;
end;
/
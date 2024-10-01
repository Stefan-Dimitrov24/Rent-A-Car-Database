drop table request;
drop table employee;
drop table positions;
drop table cars;
drop table car_model;
drop table car_brand;
drop table colors;
drop table car_types;
drop table clients;
drop table cities;
truncate table colors;
create table positions
(
Position_Num int,
Position_Name varchar2(20),
constraint Positions_PK primary key(Position_Num)
);
create table employee
(
Employee_Num int,
Position_Num int,
Phone varchar2(10),
Employee_Name varchar2(20),
constraint Employee_PK primary key(Employee_Num),
constraint Positions_Employee_FK foreign key(Position_Num) references positions(Position_Num)
);
create table cities
(
City_Num int,
City varchar2(20),
constraint Cities_PK primary key(City_Num)
);
create table clients
(
Client_Num int,
Client_Name varchar2(20),
City_Num int,
Street varchar2(50),
constraint Clients_PK primary key(Client_Num),
constraint Clients_Cities_FK foreign key(City_Num) references cities(City_Num)
);
create table car_brand
(
Car_Brand_Num int,
Brand varchar2(20) UNIQUE,
constraint Car_Brand_PK primary key(Car_Brand_Num)
);
create table car_model
(
Model_Num int,
Car_Model varchar2(20) UNIQUE,
Car_Brand_Num int UNIQUE,
constraint Model_PK primary key(Model_Num),
constraint Model_Brand_FK foreign key(Car_Brand_Num) references car_brand(Car_Brand_Num)
);
create table car_types
(
Type_Num int,
Car_Type varchar2(20),
constraint Types_PK primary key(Type_Num)
);
create table colors
(
Color_Num int,
Color varchar2(20),
constraint Colors_PK primary key(Color_Num)
);
create table cars
(
Car_Num int,
Model_Num int UNIQUE,
Price_per_Day number(6,2),
Kilometers int,
Color_Num int,
Created_Year int,
Type_Num int,
constraint Cars_PK primary key(Car_Num),
constraint Cars_Colors_FK foreign key(Color_Num) references colors(Color_Num),
constraint Cars_Model_FK foreign key(Model_Num) references car_model(Model_Num),
constraint Cars_Types_FK foreign key(Type_Num) references car_types(Type_Num)
);
-- table for the Rent a car requests
create table request
(
Request_Num int,
Date_of_Req date,
Employee_Num int,
Number_of_Days int,
Car_Num int,
Client_Num int,
constraint Request_PK primary key(Request_Num),
constraint Request_Employee_FK foreign key(Employee_Num) references employee(Employee_Num),
constraint Request_Client_FK foreign key(Client_Num) references clients(Client_Num),
constraint Request_Cars_FK foreign key(Car_Num) references cars(Car_Num)
);
alter table colors
    drop column Color;
alter table colors
    add (Color varchar2(10));
alter table request
    modify Date_of_Req date;
alter table request
rename to Rent_A_Car;
drop table Rent_A_Car;
insert into positions values (1,'Owner');
insert into positions values (2,'Salesman');
insert into positions values (3,'Supervisor');
insert into employee values (1,1,'1111111111','Ivan');
insert into employee values (2,2,'2222222222','Mihaela');
insert into employee values (3,2,'3333333333','Martin');
insert into employee values (4,2,'4444444444','Petur');
insert into employee values (5,2,'5555555555','Misho');
insert into employee values (6,3,'6666666666','Daniela');
insert into employee values (7,3,'7777777777','Georgi');
insert into cities values(1,'Burgas');
insert into cities values(2,'Varna');
insert into cities values(3,'Sofia');
insert into cities values(4,'Ruse');
insert into cities values(5,'Plovdiv');
insert into clients values(1,'Ivanka',1,'Vardar 21');
insert into clients values(2,'Mihail',3,'Kostenec 3');
insert into clients values(3,'Martina',4,'Medkovec 5');
insert into clients values(4,'Petka',1,'Stara Palnina 19');
insert into clients values(5,'Daniel',2,'Knijovnik 11');
insert into clients values(6,'Gergana',5,'Tumba 1');
insert into clients values(7,'Valq',5,'Tumba 13');
insert into clients values(8,'Mihail',2,'Pliska 27');
insert into clients values(9,'Petur',4,'Debur 14');
insert into clients values(10,'Todor',5,'Brail 24');
insert into car_brand values(1,'BMW'); 
insert into car_brand values(2,'Toyota'); 
insert into car_brand values(3,'Volkswagen'); 
insert into car_brand values(4,'Ferrari'); 
insert into car_brand values(5,'Ford'); 
insert into car_model values(1,'X7',1);
insert into car_model values(2,'Z4',1); 
insert into car_model values(3,'Corolla',2);
insert into car_model values(4,'Golf Mk 7',3); 
insert into car_model values(5,'Roma',4); 
insert into car_model values(6,'Avalon',2); 
insert into car_model values(7,'Ranger',5); 
insert into car_model values(8,'5',1); 
insert into car_model values(9,'Passat 2018',3);
insert into car_model values(10,'Escape',5); 
insert into car_model values(11,'Prius',2); 
insert into car_model values(12,'Eos',3); 
insert into car_types values(1,'SUV');
insert into car_types values(2,'Convertible');
insert into car_types values(3,'Sedan');
insert into car_types values(4,'Hatchback');
insert into car_types values(5,'Sports Car');
insert into car_types values(6,'Truck');
insert into car_types values(7,'Coupé');
insert into colors values(1,'Blue');
insert into colors values(2,'Black');
insert into colors values(3,'Red');
insert into colors values(4,'Silver');
insert into colors values(5,'Orange');
insert into cars values(1,1,60,2000,2,2019,1);
insert into cars values(2,2,55,1200,5,2017,2);
insert into cars values(3,3,60,2500,1,2018,3);
insert into cars values(4,4,50,3000,2,2018,4);
insert into cars values(5,5,250,200,3,2020,5);
insert into cars values(6,6,40,5000,1,2016,3);
insert into cars values(7,7,60,2500,4,2018,6);
insert into cars values(8,8,70,1500,2,2016,3);
insert into cars values(9,9,55,3500,4,2018,3);
insert into cars values(10,10,45,6500,5,2016,1);
insert into cars values(11,11,60,3000,1,2019,4);
insert into cars values(12,12,50,7000,2,2016,7);
insert into request values(1,to_date('20/10/2020','DD/MM/YYYY'),1,5,3,1);
insert into request values(2,to_date('23/10/2020','DD/MM/YYYY'),1,2,1,2);
insert into request values(3,to_date('5/11/2020','DD/MM/YYYY'),3,1,5,1);
insert into request values(4,to_date('12/11/2020','DD/MM/YYYY'),1,4,3,3);
insert into request values(5,to_date('19/11/2020','DD/MM/YYYY'),2,10,6,4);
insert into request values(6,to_date('8/12/2020','DD/MM/YYYY'),4,3,2,5);
insert into request values(7,to_date('11/12/2020','DD/MM/YYYY'),5,5,4,6);
insert into request values(8,to_date('5/1/2021','DD/MM/YYYY'),6,1,6,7);
insert into request values(9,to_date('11/01/2021','DD/MM/YYYY'),2,7,7,8);
insert into request values(10,to_date('13/1/2021','DD/MM/YYYY'),7,2,8,9);
insert into request values(11,to_date('24/1/2021','DD/MM/YYYY'),4,5,9,10);
insert into request values(12,to_date('20/10/2021','DD/MM/YYYY'),6,6,10,3);
insert into request values(13,to_date('2/2/2021','DD/MM/YYYY'),3,2,12,1);
insert into request values(14,to_date('7/2/2021','DD/MM/YYYY'),1,5,7,4);
insert into request values(15,to_date('7/2/2021','DD/MM/YYYY'),1,2,9,2);
insert into request values(16,to_date('20/2/2021','DD/MM/YYYY'),3,1,5,10);
insert into request values(17,to_date('9/3/2021','DD/MM/YYYY'),6,11,3,8);
insert into request values(18,to_date('13/3/2021','DD/MM/YYYY'),5,5,12,7);
insert into request values(19,to_date('29/3/2021','DD/MM/YYYY'),2,2,3,1);
insert into request values(20,to_date('1/4/2021','DD/MM/YYYY'),1,5,8,9);
update clients set Client_Name = 'Patrik' where Client_Num = 2;
delete from employee where Employee_Name = 'Galina';
-- Search
select  m.Car_Model,b.Brand,t.Car_Type,color.Color,c.Price_per_Day,c.Kilometers,
c.Created_Year
from Cars c
join Car_Types t
on c.Type_Num = t.Type_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where t.Car_Type = '&Car_Type';

select  m.Car_Model,b.Brand,t.Car_Type,color.Color,c.Price_per_Day,c.Kilometers,
c.Created_Year
from Cars c
join Car_Types t
on c.Type_Num = t.Type_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where b.Brand = '&Brand';

select  m.Car_Model,b.Brand,t.Car_Type,color.Color,c.Price_per_Day,c.Kilometers,
c.Created_Year
from Cars c
join Car_Types t
on c.Type_Num = t.Type_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where m.Car_Model = '&Car_Model';

select  m.Car_Model,b.Brand,t.Car_Type,color.Color,c.Price_per_Day,c.Kilometers,
c.Created_Year
from Cars c
join Car_Types t
on c.Type_Num = t.Type_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where c.Price_per_Day = '&Price_per_Day';
--Spravki
select req.Date_of_Req,req.Number_of_Days,b.Brand, m.Car_Model,t.Car_Type,color.Color, c.Price_per_Day,
c.Kilometers,c.Created_Year,e.Employee_Name,p.Position_Name
from request req
join cars c
on req.Car_Num = c.Car_Num
join car_model m
on c.Model_Num = m.Model_Num
join Employee e
on req.Employee_Num = e.Employee_Num
join Positions p
on e.Position_Num = p.Position_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where e.Employee_Num = &Employee_Num
order by m.Model_Num, req.Date_of_Req;

select * from(select req.Request_Num,req.Date_of_Req ,req.Number_of_Days,b.Brand,
t.Car_Type,m.Car_Model,color.Color,c.Kilometers,c.Price_Per_Day,cli.Client_Name,cit.City
from request req
join cars c
on req.Car_Num = c.Car_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
join Clients cli
on req.Client_Num = cli.Client_Num
join Cities cit
on cli.City_Num = cit.City_Num
order by Date_of_Req desc)
where rownum <=10;


select req.Date_of_Req, req.Number_of_Days,cli.Client_Name,cit.City,b.Brand,
t.Car_Type,m.Car_Model,color.Color,c.Kilometers,c.Price_Per_Day
from Request req
join Clients cli
on req.Client_Num = cli.Client_Num
join Cities cit
on cli.City_Num = cit.City_Num
join cars c
on req.Car_Num = c.Car_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
where req.Client_Num = &Client_Num
order by Date_of_Req;

select req.Date_of_Req,req.Number_of_Days,cli.Client_Name,cit.City,b.Brand,
t.Car_Type,m.Car_Model,color.Color,c.Kilometers,c.Price_Per_Day,e.Employee_Name,p.Position_Name
from request req
join Clients cli
on req.Client_Num = cli.Client_Num
join Cities cit
on cli.City_Num = cit.City_Num
join cars c
on req.Car_Num = c.Car_Num
join Car_Model m
on c.Model_Num = m.Model_Num
join Car_Brand b
on m.Car_Brand_Num = b.Car_Brand_Num
join Colors color
on c.Color_Num = color.Color_Num
join Car_Types t
on c.Type_Num = t.Type_Num
join Employee e
on req.Employee_Num = e.Employee_Num
join Positions p
on e.Position_Num = p.Position_Num
where req.Date_of_Req >= '05-NOV-2020' AND req.Date_of_Req <= '04-MAR-2021'
order by cli.Client_Num;
/* Procedures: inp/upd/del/cursors
Begin 
city_inp('Molq');
End;

BEGIN
city_upd(6,'Turnovo');
END;

BEGIN
client_inp('Aleksii',4,'abc');
END;

Begin
client_upd(11,'Arcy',5,'qwerty');
END;

Begin
position_inp('Janitor');
End;

Begin
position_upd(4,'Cleaner');
End;

Begin
employee_inp(2,8888888888,'Martina');
End;

Begin
employee_upd(4,0886212377,'Galina');
End;

Begin
brand_inp('Audi');
End;

Begin
brand_upd(6,'Honda');
End;

Begin
model_inp('CR-V',4);
END;

Begin
model_upd(13,'Passport',6);
END;

Begin
type_inp('abc');
END;

Begin
type_upd(8,'Hybrid');
END;

Begin
color_inp('Purple');
END;

Begin
color_upd(6,'Yellow');
END;

Begin
car_inp(13,80,2000,6,2020,8);
END;

Begin
car_upd(13,13,100,2500,6,2018,8);
END;

BEGIN
request_inp('15-JUN-2021',2,3,13,11);
END;

Begin
car_upd(21,'27-JUN-2021',3,2,13,11);
END

BEGIN
position_del(5);
END();

Begin
employee_del(9);
END;

Begin
city_del(7);
END;

BEGIN
client_del(12);
END;

BEGIN
brand_del(7);
END;

BEGIN
model_del(14);
END;

Begin
type_del(9);
END;

Begin
color_del(7);
END;

BEGIN
car_del(14);
END;

Begin
request_del(23);
END;

begin
search_car_by_type('&Car_Type');
end;

begin
search_car_by_brand('&Car_Brand');
end;

BEGIN
search_car_by_model('&Car_Model');
end;

BEGIN
search_car_by_price('&Price_per_Day');
END;

Begin
cars_from_employee('&Employee_Name');
END;

Begin
cars_from_client('&Client_Name');
END;

BEGIN
last_ten_req;
END;

Begin
cars_between_date('&Date_of_Req','&Date_of_Req');
END;
*/
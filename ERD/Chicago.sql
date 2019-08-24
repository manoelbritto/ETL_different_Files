CREATE TABLE Census (id SERIAL NOT NULL, id_city int4 NOT NULL, year int4, population float4, PRIMARY KEY (id));
CREATE TABLE City (Id SERIAL NOT NULL, Name varchar(50), Country varchar(50), State varchar(50), PRIMARY KEY (Id));
CREATE TABLE CrimesType (Id SERIAL NOT NULL, Type varchar(100), PRIMARY KEY (Id));
CREATE TABLE RegisterCrime (id SERIAL NOT NULL, id_crime int4 NOT NULL, id_city int4 NOT NULL, day int4, month varchar(10), year int4, latitude float4, longitude float4, PRIMARY KEY (id));
ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr539537 FOREIGN KEY (id_city) REFERENCES City (Id);
ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr993854 FOREIGN KEY (id_crime) REFERENCES CrimesType (Id);
ALTER TABLE Census ADD CONSTRAINT FKCensus735415 FOREIGN KEY (id_city) REFERENCES City (Id);
insert into city (name,country,state) values ('Chicago','USA','Illinois');

ALTER TABLE RegisterCrime DROP CONSTRAINT FKRegisterCr539537;
ALTER TABLE RegisterCrime DROP CONSTRAINT FKRegisterCr993854;
ALTER TABLE Census DROP CONSTRAINT FKCensus735415;
DROP TABLE IF EXISTS Census CASCADE;
DROP TABLE IF EXISTS City CASCADE;
DROP TABLE IF EXISTS CrimesType CASCADE;
DROP TABLE IF EXISTS RegisterCrime CASCADE;
drop table TempRegisterCrime;

CREATE TABLE TempRegisterCrime (
		city varchar(100),
		type varchar(100),
   		day int4, 		
    	month varchar(10), 
   		year int4, 
   		latitude float4, 
     	longitude float4
		)
		
select * from crimestype;

-- # CREATE TABLE RegisterCrime (
-- #     id SERIAL NOT NULL, 
-- #     id_crime int4 NOT NULL, 
-- #     id_city int4 NOT NULL, 
-- #     day int4, 
-- #     month varchar(10), 
-- #     year int4, 
-- #     latitude float4, 
-- #     longitude float4, PRIMARY KEY (id));
-- # ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr539537 FOREIGN KEY (id_city) REFERENCES City (Id);
-- # ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr993854 FOREIGN KEY (id_crime) REFERENCES CrimesType (Id);

insert into city (name,country,state) values ('Chicago','USA','Illinois');

select * from city;
select * from TempRegisterCrime;

insert into registercrime (id_crime,id_city,day,month,year,latitude,longitude) 
select crimestype.id, city.id,tempregistercrime.day,tempregistercrime.month,tempregistercrime.year,tempregistercrime.latitude,tempregistercrime.longitude from tempregistercrime inner join crimestype on tempregistercrime.type = crimestype.type inner join city on city.name = tempregistercrime.city;  

select c.name,
	   c.country,
	   rg.year,
	   cr.type,
	   count(cr.type)
from city c
inner join registercrime rg
on c.id = rg.id_city
inner join crimestype cr
on rg.id_crime = cr.id
group by c.name,
	   c.country,
	   rg.year,
	   cr.type
order by rg.year




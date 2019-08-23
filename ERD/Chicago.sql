CREATE TABLE Census (id SERIAL NOT NULL, id_city int4 NOT NULL, year int4, population float4, PRIMARY KEY (id));
CREATE TABLE City (Id SERIAL NOT NULL, Name varchar(50), Country varchar(50), State varchar(50), PRIMARY KEY (Id));
CREATE TABLE CrimesType (Id SERIAL NOT NULL, Type varchar(100), PRIMARY KEY (Id));
CREATE TABLE RegisterCrime (id SERIAL NOT NULL, id_crime int4 NOT NULL, id_city int4 NOT NULL, day int4, month varchar(10), year int4, latitude float4, longitude float4, PRIMARY KEY (id));
ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr539537 FOREIGN KEY (id_city) REFERENCES City (Id);
ALTER TABLE RegisterCrime ADD CONSTRAINT FKRegisterCr993854 FOREIGN KEY (id_crime) REFERENCES CrimesType (Id);
ALTER TABLE Census ADD CONSTRAINT FKCensus735415 FOREIGN KEY (id_city) REFERENCES City (Id);

ALTER TABLE RegisterCrime DROP CONSTRAINT FKRegisterCr539537;
ALTER TABLE RegisterCrime DROP CONSTRAINT FKRegisterCr993854;
ALTER TABLE Census DROP CONSTRAINT FKCensus735415;
DROP TABLE IF EXISTS Census CASCADE;
DROP TABLE IF EXISTS City CASCADE;
DROP TABLE IF EXISTS CrimesType CASCADE;
DROP TABLE IF EXISTS RegisterCrime CASCADE;


CREATE TABLE TempRegisterCrime (
		id_city int,
		type varchar(100),
   		day int4, 		
    	month varchar(10), 
   		year int4, 
   		latitude float4, 
     	longitude float4
		)
		
drop table TempRegisterCrime;

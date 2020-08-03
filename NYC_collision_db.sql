-- DROPPING TABLE IF IT ALREADY EXISTS
 DROP TABLE IF EXISTS Collision;
DROP TABLE IF EXISTS Vehicle;
 DROP TABLE IF EXISTS Person;
 DROP TABLE IF EXISTS Veh_collision;
 DROP TABLE IF EXISTS per_vehicle;
 DROP TABLE IF EXISTS  per_collision;

create table Collision(
id bigint primary key,
Crash_date text,
Veh_Factor_One text,
Veh_Factor_Two text,
Ped_Factor_One text,
Ped_Factor_Two text
 );

create table Vehicle(

 id text primary key,
 Make text,
 Vehicle_year double precision,
 State_registration text,
 Type text
);


create table Person (
id text primary key,
Gender text,
Age double precision,
Person_injured text,
Pedestrian_role text
);

create table Veh_collision (
id serial  primary key,
Collision_id bigint ,
Vehicle_id text, 
Damage text,
 CONSTRAINT fk_Veh_collision
    FOREIGN KEY(collision_id) 
 	REFERENCES collision(id)
 	ON DELETE SET NULL,

 CONSTRAINT fk_Veh_Vehicle
    FOREIGN KEY(Vehicle_id) 
 	REFERENCES Vehicle(id)
 	ON DELETE SET NULL

);

create table per_vehicle(
Person_id  text, 
Vehicle_id text,
Driver_sex text,
Driver_license_status text,
	CONSTRAINT fk_per_Vehicle
	FOREIGN KEY(Vehicle_id) 
 	REFERENCES Vehicle(id)
	ON DELETE SET NULL,
  CONSTRAINT fk_per_Person
     FOREIGN KEY(Person_id) 
  	REFERENCES Person(id)
  	ON DELETE SET NULL
);



create table per_collision(
id serial primary key,
Person_id text,
Collision_id bigint,
Complaint text,
CONSTRAINT fk_per_collision
    FOREIGN KEY(collision_id) 
	REFERENCES collision(id)
	ON DELETE SET NULL,
CONSTRAINT fk_per_Person_2
    FOREIGN KEY(Person_id) 
	REFERENCES Person(id)
	ON DELETE SET NULL
);






































-- alter table Collision
-- alter column crash_date text;

-- constraints:
-- you can add constraints directly to the table or after uploading the data 
-- ALTER TABLE Collision ADD CONSTRAINT fk_Vehicle_Collision FOREIGN KEY("Collision_id") REFERENCES Collision ("Collision_id")

-- ALTER TABLE Vehicule ADD CONSTRAINT fk_Collision_Vehicle FOREIGN KEY("Vehicle_id") REFERENCES Vehicle ("Vehicle_id")

-- ALTER TABLE Person ADD CONSTRAINT fk_Person_Collision FOREIGN KEY("Collision_id") REFERENCES Collision ("Collision_id"),
-- ALTER TABLE persons ADD CONSTRAINT fk_Person_Vehicle FOREIGN KEY("Vehicle_id") REFERENCES Vehicle ("Vehicle_id")


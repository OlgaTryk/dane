CREATE SCHEMA IF NOT EXISTS raw;
CREATE TABLE IF NOT EXISTS raw.address(
    id int PRIMARY KEY,
    street varchar(255),
    buildingnum int,
    apptnum int,
    city varchar(255),
    region varchar(255),
    country varchar(255));

CREATE TABLE IF NOT EXISTS raw.clients(
    id int PRIMARY KEY,
    firstname varchar(100),
    lastname varchar(100),
    email varchar(100),
    gender varchar(100),
    birthdate date,
    addressid int REFERENCES raw.address(id));

CREATE TABLE IF NOT EXISTS raw.stores(
    id int PRIMARY KEY,
    storetype VARCHAR(50),
    addressid int REFERENCES raw.address(id));

CREATE TABLE IF NOT EXISTS raw.items(
    id int PRIMARY KEY,
    name varchar(255),
    brand varchar(255),
    category varchar(255));

CREATE TABLE IF NOT EXISTS raw.sales(
    id int PRIMARY KEY,
    clientid int REFERENCES raw.clients(id),
    storeid int REFERENCES raw.stores(id),
    itemid int REFERENCES raw.items(id),
    quantity int,
    unitprice varchar(50), --generowane ze skrótem waluty, do zmiany na real w czyszczeniu
    discount int, --w procentach
    orderdate date);
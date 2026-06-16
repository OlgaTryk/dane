--plik do projektowania, nie wykorzystywany w implementacji

CREATE SCHEMA IF NOT EXISTS warehouse;

CREATE TABLE IF NOT EXISTS warehouse.DimItem(
ItemKey int PRIMARY KEY,
Name varchar(255) IS NOT NULL,
Brand varchar(255) IS NOT NULL,
Category varchar(255) IS NOT NULL);

CREATE TABLE IF NOT EXISTS warehouse.DimStore(
StoreKey int PRIMARY KEY,
StoreType varchar(50) IS NOT NULL, --tradycyjny czy online
City varchar(255),
Region varchar(255),
Country varchar(255));

CREATE TABLE IF NOT EXISTS warehouse.DimClient(
ClientKey int PRIMARY KEY,
FirstName varchar(100) IS NOT NULL,
LastName varchar(100) IS NOT NULL,
Gender varchar(100) IS NOT NULL,
AgeGroup varchar(100) IS NOT NULL,
City varchar(255) IS NOT NULL,
Region varchar(255) IS NOT NULL,
Country varchar(255) IS NOT NULL);

CREATE TABLE IF NOT EXISTS warehouse.DimDate(
DateKey int PRIMARY KEY,
FullDate date,
Day int IS NOT NULL,
DayOfTheWeek varchar(20),
Month int IS NOT NULL,
Quarter int IS NOT NULL,
Year int IS NOT NULL,
Season varchar(20) IS NOT NULL,
IsWeekend boolean IS NOT NULL);

CREATE TABLE IF NOT EXISTS warehouse.FactSales(
SaleKey int PRIMARY KEY,
StoreKey int REFERENCES DimStore(StoreKey) IS NOT NULL,
DateKey int REFERENCES DimDate(DateKey) IS NOT NULL,
ClientKey int REFERENCES DimClient(ClientKey) IS NOT NULL,
ItemKey int REFERENCES DimItem(ItemKey) IS NOT NULL,
UnitPrice real IS NOT NULL,
Quantity int IS NOT NULL,
Discount real IS NOT NULL,
TotalValue real IS NOT NULL);





# Opis projektu
Hurtownia danych dla sieci sklepów odzieżowych. Obejmuje projekt bazy danych oraz procesu ETL. Do implementacji bazy danych użyto Python i PostgreSQL. Proces ETL wykorzystuje dbt.
# Instalacja 
wymagania: postgresql, Python 3, zawartość requirements.txt <br />
sql_scripts/init.sql - stworzenie bazy danych i użytkownika dla narzędzi 

Instrukcja dbt: <br />
dbt init - inicjalizacja <br />
dbt run - wykonanie skryptów w warehouse_dbt/models

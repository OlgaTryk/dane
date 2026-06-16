import psycopg2

user = 'etl'
password = 'etlpass'
host = 'localhost'
db = 'warehousedb'

tables = {
    "address.csv": "address",
    "clients.csv": "clients",
    "items.csv": "items",
    "stores.csv": "stores",
    "orders.csv": "sales"
}

with psycopg2.connect(dbname=db, user=user, password=password, host=host) as connection:
    with connection.cursor() as cursor:

        #cursor.execute("DROP SCHEMA raw CASCADE;")
        print("Tworzenie schematu i tabel.")
        cursor.execute(open("sql_scripts/raw.sql", "r").read())
        connection.commit()

        for filename, table in tables.items():
            print(f"Ładowanie pliku {filename} do tabeli {table}.")
            with open(f"data/{filename}", 'r') as file:
                cursor.copy_expert(
                    f"""
                    COPY raw.{table}
                    FROM STDIN
                    WITH (FORMAT CSV, HEADER TRUE)
                    """, file
                )
        connection.commit()

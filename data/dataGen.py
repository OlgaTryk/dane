#script generating data for the process
from faker import Faker
import csv
import random
from providers import regions_provider, category_provider, brand_provider


fake = Faker('pl_PL')
fake.add_provider(regions_provider)
fake.add_provider(category_provider)
fake.add_provider(brand_provider)

with open('data/clients.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['id','firstname','lastname','email', 'gender', 'birthdate', 'addressid'])

    for i in range(100):
        odds = random.random()
        if odds < 0.45:
            gender = 'F'
            firstname = fake.first_name_female()
        elif odds < 0.9:
            gender = 'M'
            firstname = fake.first_name_male()
        else:
            gender = ''
            firstname = fake.first_name_nonbinary()
        spamwriter.writerow([1000 + i, firstname, fake.last_name(), fake.email(), gender, fake.date_of_birth(minimum_age=15, maximum_age=70), 1000 + i])

with open('data/address.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['id','street','buildingnum','apptnum','city','region','country'])

    for i in range(120):
        street = fake.street_name() if random.random() < 0.8 else ''
        buildnum = random.randrange(1, 100)
        apptnum = random.randrange(1, 100) if street != '' else ''
        city = fake.city()
        region = fake.region()
        spamwriter.writerow([1000 + i, street, buildnum, apptnum, city, region, 'Polska'])

with open('data/items.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['id','name','brand','category'])

    for i in range(300):
        name = " ".join(fake.words(nb=3))
        brand = fake.brand()
        category = fake.product_category()
        spamwriter.writerow([1000 + i, name, brand, category])

with open('data/stores.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['id', 'storetype', 'addressid'])
    for i in range(20):
        spamwriter.writerow([i, 'retail', 1000 + i])
    for i in range(3):
        spamwriter.writerow([20 + i, 'online',''])

with open('data/orders.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=',')
    spamwriter.writerow(['id', 'clientid', 'storeid', 'itemid', 'quantity', 'unitprice', 'discount', 'date'])

    for i in range(500):
        clientid = random.randrange(1000, 1100)
        storeid = random.randrange(0, 23)
        itemid = random.randrange(1000, 1300)
        quantity = random.randrange(1, 6)
        unitprice = fake.pricetag()
        discount = 0 if random.random() < 0.7 else random.randrange(5, 51)
        date = fake.date_between(start_date='-1w', end_date="today")
        spamwriter.writerow([i, clientid, storeid, itemid, quantity, unitprice, discount, date])


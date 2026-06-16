#additional faker providers
from faker.providers import DynamicProvider

regions_provider = DynamicProvider(
    provider_name = "region",
    elements=["Dolnośląskie",
            "Kujawsko-pomorskie",
            "Lubelskie",
            "Lubuskie",
            "Łódzkie",
            "Małopolskie",
            "Mazowieckie",
            "Opolskie",
            "Podkarpackie",
            "Podlaskie",
            "Pomorskie",
            "Śląskie",
            "Świętokrzyskie",
            "Warmińsko-mazurskie",
            "Wielkopolskie",
            "Zachodniopomorskie"]
)

category_provider = DynamicProvider(
    provider_name = "product_category",
    elements=["spodnie",
              "kurtki",
              "skarpetki",
              "majtki",
              "stroje kąpielowe",
              "koszulki",
              "koszule",
              "buty",
              "bluzy",
              "torebki/plecaki",
              "sportowe",
              "szorty",
              "sukienki",
              "spódnice"]
)

brand_provider = DynamicProvider(
    provider_name = "brand",
    elements=[
        "4F",
        "Adidas",
        "Calvin Klein",
        "Chanel",
        "DeeZee",
        "Dolce&Gabbana",
        "Gino Rossi",
        "Gucci",
        "Guess",
        "H&M",
        "Hugo Boss",
        "Lasocki",
        "Nike",
        "Prada",
        "Puma"
    ]
)
    
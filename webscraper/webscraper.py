import requests
from bs4 import BeautifulSoup
import pandas as pd

def main():
    print("hello world :)")

    URL = "https://www.peta.org/living/food/animal-ingredients-list/"
    r = requests.get(URL)
    soup = BeautifulSoup(r.content, 'html5lib')

    table = soup.find('div', attrs = {'id':'content-block'})
    # print(table.prettify())

    ingredients = []
    reasons = []

    for idx, row in enumerate(table.findAll('b')):
        row_text_list = row.text.split(".")

        for x in row_text_list:
            if(x != ""):
                ingredients.append(x.lstrip())
    df = pd.DataFrame(ingredients)
    df.to_csv('ingredients.csv', index=False)

if __name__ == '__main__':
    main()
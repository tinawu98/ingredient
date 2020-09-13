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

    for idx, row in enumerate(table.findAll('p')):
        if(idx < 2):
            pass
        elif(idx == 2):
            for i in row.findAll('b'):
                row_text_list = i.text.split(".")
                for x in row_text_list:
                    if(x != ""):
                        ingredients.append(x.lstrip())
        elif(idx == 3):
            reasons.append(row.text)
        elif(idx == 227):
            break
        else:
            for i in row.find('br').next_siblings:
                exp = i
            for i in row.findAll('b'):
                row_text_list = i.text.split(".")
                for x in row_text_list:
                    if(x != ""):
                        ingredients.append(x.lstrip())
                        reasons.append(exp)
    df_dict = {"ingredients": ingredients, "reasons": reasons}
    df = pd.DataFrame(df_dict)
    df.to_csv('ingredients2.csv', index=False)

if __name__ == '__main__':
    main()
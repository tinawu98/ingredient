# HopHacks 2020: Ingredient

# Inspiration
The growing trend towards veganism has incited a need for an easy method to ensure that consumer products ranging from food, to makeup, to medicine, do not contain any non-vegan ingredients. Many of these ingredients are highly inconspicuous--isinglass, lactic acid, anyone?--let alone difficult to commit to memory.

# What it does
A mobile app that scans the product ingredients list for non-vegan ingredients and alerts the user of whether the product is vegan.

# How we built it
We built the iOS app utilizing Flutter after designing the UI in Figma. For the back-end, we extracted text from images using Google Cloud Optical Character Recognition and ran the text through a web scraper we developed using BeautifulSoup, thereby comparing the product's ingredients with a dynamic database of non-vegan ingredients.

# Challenges we ran into
No one on our team had experience with mobile app development, so learning how to use Flutter was a huge obstacle. Another major challenge was integrating all the different platforms we used, especially connecting the ML output to the web scraping algorithm on Flutter.

# Accomplishments that we're proud of
We created a functional app! We are also very proud of the fact that we were able to maintain motivation and work through the hackathon without the incentive of free pizza.

# What we learned
...is that one of our members is vegan! We also learned about many new frameworks, including Google Firebase, Flutter, and BeautifulSoup.

# What's next for Ingredient
This application could be translated to other diets like kosher and halal diets, as well as specific ingredients to watch out for, such as in allergies.

Devpost: https://devpost.com/software/codebrew-67hi12

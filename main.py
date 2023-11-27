import mysql.connector
import requests
from mysql.connector import errorcode
import openai
from PIL import Image
import random

# Connect to MySQL and check for errors
try:
    conn = mysql.connector.connect(host="localhost", user="admin", password="admin", database="masterdb")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
else:
    conn.close()

conn.reconnect()
cursor = conn.cursor()


class dbQuery:
    def __init__(self, username):
        self.username = username

    def getUserInfo(self):
        # Retrieve user ID and query to database for user inventory
        query = "SELECT * FROM user_info WHERE Username = %s"
        uName = (self.username,)

        cursor.execute(query, uName)
        records = cursor.fetchone()

        # returns (ID, FName, LName, Username, Password, Email)
        # ('U0001', 'James', 'Bond', 'jamesbond007', '007', 'jamesbond007@gmail.com')
        return records

    def getUserID(self):
        userInfo = self.getUserInfo()
        return userInfo[0]

    def getUserFullName(self):
        userInfo = self.getUserInfo()
        return userInfo[1] + " " + userInfo[2]

    def getUserEmail(self):
        userInfo = self.getUserInfo()
        return userInfo[5]

    def getUserPref(self):
        userInfo = self.getUserInfo()

        # Query to database for user preferences
        query = "SELECT * FROM user_has_preference WHERE UserID = %s"
        userID = (userInfo[0],)

        cursor.execute(query, userID)
        records = cursor.fetchall()

        # returns [(ID, UserID, PrefID1), (ID2, UserID, PrefID2), ...]
        # [(1, 'U0001', 'P0005'), (2, 'U0001', 'P0009')]
        return records

        # returns a string of preferences to enter into query

    def getPrefStr(self):
        records = self.getUserPref()

        preferences = ""
        query = "SELECT * FROM user_preference WHERE ID = %s"
        for record in records:
            prefID = (record[2],)

            cursor.execute(query, prefID)
            pRecords = cursor.fetchone()
            preferences += (pRecords[1] + " " + pRecords[2] + ", ")  # Name + Category

        # returns Name1 + Category, Name2 + Category2, ...
        # soybeans allergy, sesame allergy, ...
        return preferences

    def getUserIng(self):
        userInfo = self.getUserInfo()

        # Query to database for user preferences
        query = "SELECT * FROM ingredient_in_stock WHERE UserID = %s"
        userID = (userInfo[0],)

        cursor.execute(query, userID)
        records = cursor.fetchall()

        # returns [(ID1, UserID, IngredientID1), (ID2, UserID, IngredientID2), ...]
        # [(1, 'U0001', 'F0001'), (2, 'U0001', 'F0002'), ...]
        return records

    # returns a string of ingredients to enter into query
    def getIngStr(self):
        records = self.getUserIng()

        ingredients = ""
        query = "SELECT * FROM ingredient WHERE ID = %s"
        for record in records:
            ingID = (record[2],)

            cursor.execute(query, ingID)
            iRecords = cursor.fetchone()
            ingredients += (iRecords[1] + ", ")  # Name

        # returns Name1, Name2, Name3, ...
        # milk, cheese, egg, ...
        return ingredients


query = dbQuery("charlieBrown1968")
#print(query.getPrefStr()) This was a test
#print(query.getIngStr()) This was a test


# def add_until_colon(characters_to_add):
#   title = " "
#  while ':' not in characters_to_add:
#     title += characters_to_add
# return title

#
#
#
#This is where the API code starts
#
#
#
#
openai.api_key = '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'
messages = [{"role": "system", "content":
    "You are a intelligent home cook assistant."}]

# This call is to the image API
def call_to_image_api(imagtxt):
    try:
        response = openai.Image.create(
            model="dall-e-3",
            prompt="Close Top-down Delicious," + imagtxt + ". No dirty plates. White plate. Empty Table as background with nothing on it.",
            size="1024x1024",
            quality="standard",
            n=1,
        )
    except:
        print("ERROR IN THE IMAGE GENERATOR")
    image_url = response.data[0].url
    img = Image.open(requests.get(image_url, stream=True).raw)
    img.show()

# This is a call to the OpenAI API for chat GPT
title_text = ""
def call_to_api(message):
    resultString = " "
    if message:
        messages.append(
            {"role": "user", "content": message},
        )
        chat = openai.ChatCompletion.create(
            model="gpt-4", messages=messages, stream=True, temperature=1
        )
        # Prints out the api answer in the streaming way
    for r in chat:
        if r.choices[0].finish_reason is None:
            string = r.choices[0].delta.content
            resultString += string
            print(r.choices[0].delta.content, end='', flush=True)
    # This gets the title
    all_text = resultString.partition(":")
    global title_text
    title_text = all_text[2].partition("\n")[0]
    # This puts the title into the image API to generate the image
    call_to_image_api(title_text)


def show_menu():
    print("1. Italian Cuisine")
    print("2. Mexican Cuisine")
    print("3. Chinese Cuisine")
    print("4. Indian Cuisine")
    print("5. Any Type")


def chooseCusine():
    choice = 0
    while choice != 5:
        show_menu()
        choice = input("Choose your Cuisine type: ")
        if choice == "1":
            cuisine = "italian"
            choice = 5
        elif choice == "2":
            cuisine = "mexican"
            choice = 5
        elif choice == "3":
            cuisine = "chinese"
            choice = 5
        elif choice == "4":
            cuisine = "indian"
            choice = 5
        elif choice == "5":
            cuisine = ""
            choice = 5
        else:
            print("Invalid option. Please try again.")
    return cuisine


# This is the GO WILD Option it gives you a true random recipe
def random_option():
    cuisine = chooseCusine()
    apiQuery = (
             "Put the title of the dish first! Generate a random " + cuisine + " recipe. User also has " +
            query.getPrefStr() + ". Do not make " + title_text + " you have already made this!"
    )
    call_to_api(apiQuery)
    main_menu()


# This Option is the new option its gives a recipe based on the users ingredients
def new_option():
    cuisine = chooseCusine()
    apiQuery = ("Put the title of the dish first! Generate a" + cuisine + "recipe that only uses a "
                                                                                                        "selection of "
                                                                                                        "the "
                                                                                                        "following "
                                                                                                        "ingredients: "
                                                                                                        "" +
                query.getIngStr() +
                ". Other ingredients are not allowed. Salt and pepper are allowed to be added. User also has " +
                query.getPrefStr() +
                ". Give substitutions for ingredients if they are in the Users inventory. Do not make " + title_text + " you have already made this!"
                )
    call_to_api(apiQuery)
    main_menu()


# This does nothing yet! it is supposed to save a recipe to your inventory
def save_option():
    print("Save option selected.")
    main_menu()


def main_menu():
    print("\nWelcome to the Main Menu!")
    print("1. Random")
    print("2. New")
    print("3. Save")
    print("4. Exit")

    choice = input("Please select an option: ")

    if choice == "1":
        random_option()
    elif choice == "2":
        new_option()
    elif choice == "3":
        save_option()
    elif choice == "4":
        return
    else:
        print("Invalid option. Please try again.")
        main_menu()


main_menu()

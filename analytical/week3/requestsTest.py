import requests
import json

# use get method to GET data from an API
response = requests.get("https://api.github.com")

# change api data into JSON(dictionart) for future processing
data=response.json()
print(data)
print(data['current_user_url'])
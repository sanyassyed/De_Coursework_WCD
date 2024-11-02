import json

# json.loads() takes a JSON string and converts it to a Python object (like a dictionary or list).
# json.dumps() takes a Python object and converts it to a JSON string.
# loads : json string -> python obj
# dumps: python obj -> json string

# json.load(file) reads JSON from a file and returns a Python object.
# json.dump(obj, file) takes a Python object and writes it as JSON to a file.

# load and dump -> file related
# loads and dumps -> within python code

# dump and dumps perform serialization by converting Python objects into JSON-formatted strings.
json_string = '''{"firstName": "Jane",
                 "lastName": "Doe"}'''


data = json.loads(json_string)

# Data types
print(f"This is the type of json_string: {type(json_string)}")
print(f"This is the type of data created using loads: {type(data)}")

# writing python obj to a file as json
with open('data.json', 'w') as f:
    # dump when you use a file name
    json.dump(data, f, ensure_ascii=False, indent=4)

# dumps() function is used to serialize a Python object like dict into a 
# JSON formatted string
data_serialized = json.dumps(data, indent=4)
print(f"This is the type of the data_serialized created using dumps on dictionary called data: {type(data_serialized)}")

# reading json data from a file
with open('data.json', 'r') as f:
    data_json = json.load(f)

print(f"This is the type of data_json read from the json file using load: {type(data_json)}")
print(data)
print(data_json)
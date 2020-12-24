import requests
api = 'https://api.github.com/users/jbperezf'
r = requests.get(api)
print (r.json())



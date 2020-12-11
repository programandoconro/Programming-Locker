import json

data = {}


data['people'] = []
data['people'].append({
        'name': 'Scott',
        'website': 'stackabuse.com',  
        'from': 'Nebraska'
})
                                      


with open('data.txt', 'w') as outfile:
        json.dump(data, outfile) 

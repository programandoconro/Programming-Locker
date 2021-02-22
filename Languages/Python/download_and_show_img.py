import requests
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import shutil

url = "https://i.stack.imgur.com/BKC3m.jpg"

r = requests.get(url, stream = True)
filename = url.split("/")[-1]

if r.status_code == 200:
    print(True)
    r.raw.decode_content = True
    print(r.raw)
    with open(filename,'wb') as f:
        shutil.copyfileobj(r.raw, f)
   
    img = mpimg.imread(filename)
    imgplot = plt.imshow(img)
    plt.show()

# Install React
apt install npm nodejs -y
sudo npm install -g create-react-app

# create an sample App
create-react-app example-app
cd example-app
npm start

# Modify App.js file
nano example-app/src/App.js

# build
npm run build

# serve the app
npm install -g serve
serve -s build -l 4000

# deploy it on git hub
npm install gh-pages --save-dev
nano package.json 
##### add this with your credentials
"homepage": "http://gitname.github.io/react-gh-pages"
"scripts": {
  //...
  "predeploy": "npm run build",
  "deploy": "gh-pages -d build"
}
######
git init
git remote add origin https://github.com/gitname/react-gh-pages.git

npm run deploy

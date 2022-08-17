# Easily and fastly create basic typescript project
# This script will create a directory and install required packages
# Then, it will listen to changes in index.ts typescript file with nodemon

from os import system, chdir
from sys import platform

project_name = input("Project name: ")

system('mkdir ' + project_name)
chdir(project_name)

if platform == "linux" or platform == "darwin":
    system("touch index.ts")
elif platform == "win32":
    system("type nul > index.ts")

system('echo {"name": "' + project_name + '",' + '> package.json')
system('echo "main": "index.ts", ' + '>>package.json')
system('echo "scripts": { ' + ' >>package.json')
system('echo "dev": "nodemon index.ts" ' + '>>package.json')
system('echo } >> package.json')
system('echo } >> package.json')
system('npm install -D nodemon @types/node tslint')
system('npm run dev')

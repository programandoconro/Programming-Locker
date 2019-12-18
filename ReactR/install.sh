# Fedora

sudo yum install nodejs
npm install create-react-app
sudo yum install libxml2-devel openssl-devel libcurl-devel
R
#######################################
library(reactR)
library(htmltools)
 
browsable(tagList(
+   tags$div(id = "app"),
+   tags$script(
+   "
+     ReactDOM.render(
+       React.createElement(
+         'h1',
+         null,
+         'Powered by React'
+       ),
+       document.getElementById('app')
+     )
+   "
+   ),
+   #add core-js first to work in RStudio Viewer
+   html_dependency_corejs(),
+   html_dependency_react()
+ ))
###########################################

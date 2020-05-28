# Deploy React App

git clone https://github.com/programandoconro/KanjiTrainer
cd KanjiTrainer && npm run build && cd && mkdir app && cd app && cp -r KanjiTrainer/build .

printf 'FROM nginx:latest \nCOPY /build /usr/share/nginx/html' > Dockerfile

kubectl config use-context docker-for-desktop

docker build . -t react-app
docker run -dit -p 5657:80 react-app
curl localhost:5667

docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker tag my-react-app localhost:5000/my-react-app

kubectl apply -f deployment-react.yml 
kubectl create -f service-react.yml

curl localhost:31000


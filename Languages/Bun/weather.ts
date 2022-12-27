const apiKey = 'your api';
const lat = 'your lat';
const lon = 'your lon';
const url = `api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&appid=${apiKey}&units=metric`;

const response = fetch(url).then(res=> res.json());
const weather = response.then(data=> new Response(JSON.stringify(data)));

export default {
  port: 3000,
  fetch() {
      return weather;
  }
}

console.log('running bun on 3000');

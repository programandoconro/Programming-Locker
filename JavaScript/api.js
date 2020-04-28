// Get json data from API, for example from: https://api.github.com/users/programandoconro

// Example 1

const callAPI = async () => {
  const res = await fetch(" https://api.github.com/users/programandoconro");
  const data = await res.json();
  console.log(data);
};

// Example 2
const xhr = new XMLHttpRequest()
xhr.open('GET','https://api.github.com/users/programandoconro',true)
xhr.send()
xhr.responseText

// Example 3
const callAPI3 = () => {
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "https://api.github.com/users/programandoconro");
  xhr.responseType = "json";
  xhr.send();
  xhr.onload = function () {
    console.log(xhr.response);
  };
};
callAPI3();

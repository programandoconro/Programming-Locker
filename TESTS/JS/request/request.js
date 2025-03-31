console.log("init");
const url = "https://random-data-api.com/api/v2/users?size=2&is_xml=true"

const getRequest = async() => {
  try {
    const request = await fetch(url);
    const json = await request.json();
  
    return json;

  }
  catch (e) {
    console.log("Error: ", e);
  }
}
getRequest().then(console.log);







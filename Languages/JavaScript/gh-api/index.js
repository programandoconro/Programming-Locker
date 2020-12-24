
    
    
    ///////////////////////////INPUT/////////////////////////////

    const userName = [];
    const user = document.getElementById('lname');
    user.addEventListener('input', updateValue);

    function updateValue(e) {
       
       userName.push(e.target.value);
    }

    ///////////////////////////OUTPUT////////////////////////////

    const send = document.getElementById('send-button');
    send.addEventListener('click', sendValue);

    const  gitHubData= {}; 
    function sendValue() {
        const name = userName[userName.length - 1];
        const api = " https://api.github.com/users/" + name;

        const callAPI = async () =>{
            const res = await fetch(api);
            const data = await res.json();
            const json = JSON.stringify(data);
            gitHubData.json = json;
   
        }
   
        const editData = async() => {  
            results = '';
            await callAPI();
            const info = gitHubData.json;

             for(let i = 0; i<info.length; i++){
                if(info[i] === '{' | info[i] === '}' | info[i] === '"'){
                    results += ' '; 
                    continue;
                }
                if(info[i] === ','){
                    results += '\n'; 
                    continue;
                }
                results += info[i]; 
             }
             document.getElementById('body').innerHTML = results;                
       }
        editData();
    }
























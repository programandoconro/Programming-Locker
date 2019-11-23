console.log('hola amigo');

const test = () => console.log('Holaaa!! ');
test();

const resolveAfter10Seconds=()=> {
  return new Promise(saludos => {
    setTimeout(() => {
      saludos('Saludos al mundo, extraterrestre!');
    }, 10000);
  });
};

const resolveAfter5Seconds=()=> {
  return new Promise(saludos => {
    setTimeout(() => {
      saludos('Saludos al mundo, terrícola!');
    }, 5000);
  });
};

async function  asyncCallExtraterrestre() {
  console.log('calling');
  const result = await resolveAfter10Seconds();
  console.log(result);
};

async function  asyncCallTerricola() {
  console.log('esperando');
  const result = await resolveAfter5Seconds();
  console.log(result);
};

[asyncCallExtraterrestre(), asyncCallTerricola()];

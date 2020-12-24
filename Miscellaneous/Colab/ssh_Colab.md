# Conéctate por SSH a Colab (cloud-server), con GPU Tesla y más de 12GB de RAM 

 Colab ofrece servcio de servidor en la nube para programar en proyectos que requieren alto poder de cómputo.
 
Este tutorial explica la manera de ingresar a estos servidores por ```ssh``` utilizando ```ngrok```, proporcionando mayor facilidad de acceso y programación.

## Pasos:

1. Instala ```ssh```, (casi todos los sistemas los traen por defecto). 

2. Loguéate a Colab https://colab.research.google.com/.
 
3. En Colab notebook, escribe:  
  
```
!pip install git+https://github.com/demotomohiro/remocolab.git

```
Espera a que se instale el módulo de Python, disponible en https://github.com/demotomohiro/remocolab
  
```
import remocolab
remocolab.setupSSHD()
```

Deberían aparecer unas instrucciones sencillas: 
  * agregar el token de ```ngrok```
  * Descargar e instalar ```ngrok-client``` en https://ngrok.com/download
  * Agregar la región para el tunel

  
4. En la terminal, conéctate a tu servidor Colab con:
  
  ```
  ssh -o UserKnownHostsFile=/dev/null -o VisualHostKey=yes -p xxxxx colab@0.tcp.eu.ngrok.io
  ```

Debes cambiar el puerto y copiar/pegar la contraseña que se te proporciona en Colab

** Alternativamente, puedes hacer un Reverse Shell con ```ncat```, escuchando por un puerto abierto en tu Firewall local y enviando la petición desde el servidor Colab. 

Espero que este manual te haya sido útil, gracias por leerlo. Saludos. 



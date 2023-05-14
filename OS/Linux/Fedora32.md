# 10 cosas que hacer luego de instalar  Fedora 32  desarrollo Web y programacion

```
Fedora 32 
Gnome 3.
Python edition
```


Esta edicion de ``Fedora`` es bastante impresionante. Estas en la punta de la lanza en cuanto a las versiones mas actualizadas del software. Tiene ``Python3.8`` y ``Bash 5`` pre-instalados y por default, no como esos de Debian que todavia usan ``Python 2.7`` (buuu). Ademas, esta version ``Python-Classroom`` incluye ``Jupyter``, ``emacs``, ``Iddle 3`` y ``Mu``. La cereza del pastel, ``Podman``, (similar a ``Docker``) pre-instalado, para entornos virtuales. 

En este tutorial, explicare paso a paso como preparo un entorno de trabajo para programacion, ciencia de datos y desarrollo web, a partir de una instalacion fresca de Fedora 32.

1. Actualizar.
```
yum update -y
reboot
```
2. Configurar Tweaks (opcional)

Dale al boton de windows (Super) en tu teclado y dirigete settings:

* Mouse y Touchpad: Habilita el Tab to click y desactiva el Natural scrolling.
* Power: Desabilita el dim screen when inactive y el  blanck screen a NEVER.
* Keyboard shortcuts interesantes: 

``Super ->``: ajusta la ventana activa a la mitad de la pantalla en derecha.

``Super <-``: Lo mismo que lo anterior, pero a la izquierda.

Nuevamente, dando a Super, escrbimos ``gnome tweaks`` e instalamos esa aplicacion con el manager de software. Desactivamos ``suspend when lid is closed`` y vamos a las apariencias y escojemos el tema oscuro ``Adwaita-dark``

Para agregar programas a los favoritos, damos a ``Super`` y navegamos al programa de interes, por ejemplo Terminal, damos click derecho y le seleccionamos agregar a favoritos. Podemos eliminar el software manager ya que no lo utilizaremos demasiado.

<div> 

<img src="./'Screenshot from 2020-04-10 15-13-42.png'" />

</div>

3. Instalar programas complementarios.

Chrome: En el navegador, descarga ``Chrome``, verificando que la extension que escojiste es ``.rpm`` (red hat). Escojer la opcion de Abrir con software manager y dar click a install.
Visual Studio: Repetir el proceso anterior pero descargando el archivo ``.rpm`` de ``Visual Studio Code`` y de ``Skype``.

Abrir Terminal y:

```
sudo -i
yum install nmap

```

React y expo (react-native)
```
yum install nodejs npm -y
npm install -g create-react-app expo-cli
```

```
npm install -g firebase
```
Android Studio para emular react-native apps.

Descarga el ``.tar`` de Android studio, descomprimelo simplemente dandole doble click al icono. Navega a la carpeta /bin y abre un terminal es directorio, ejecuta:
``sh android.sh``

Elige custom installation, agrega el emulador para Android y sigue los pasos de instalacion. 

4. Configurar idiomas.

Español: Sencillamente dale a ``Super`` y escribe languages, donde podras agregar el input nuevo. Previamente ajustamos ``Ctrl Space`` para cambiar entre inputs. 

Japones (Kanji): ``yum install ibus-mozc -y``

Para cambiar entre lenguajes del teclado:

``Super space``

5. Entornos virtuales:

Podman (Docker): 

Rstudio ``podman run -dit --ulimit="nofile=4096" --env PASSWORD=***** -p 8787:8787 docker.io/rocker/rstudio``

MariaDB https://github.com/progamandoconro/My-Linux-Locker-/blob/master/Docker/MariaDB/maria_db.sh
Jupyter Spark Notebook ``podman run --rm -p 8888:8888 -p 4040:4040 -e JUPYTER_ENABLE_LAB=yes -v ~:/home/ro/jupyter jupyter/all-spark-notebook``

Apache server: https://github.com/progamandoconro/My-Linux-Locker-/tree/master/Docker/Apache

Java apps, React apps, servidores shiny 

Colab

https://github.com/progamandoconro/My-Linux-Locker-/blob/master/Colab/ssh_Colab.md

6. Login a tus cuentas:

Gmail, Facebook, GitHub.

Accede a Firebase.

7. Programas accesorios:

```
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install vlc -y
```

``yum install youtube-dl nmap openssh-server pavucontrol gimp transmission filezilla -y``

8. Plugins de Chrome:

```
dark github
youtube adblock
react tools
```
9. Agregar ssh-keys para acceder sin contraseña a mis servidores y máquinas locales.

```
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub user@ip
```
10. Instalar temas de escritorio

```
  dnf install gnome-shell-theme-flat-remix.noarch \
  gnome-shell-theme-selene.noarch \ 
  gnome-shell-theme-yaru.noarch

```


<div>
  <h1> Go Linux </h1>
</div>

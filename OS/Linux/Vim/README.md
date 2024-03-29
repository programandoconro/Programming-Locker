# Mis comandos favoritos en Vim:

## Sobrevivencia:

``i`` -> Modo insertar (insertar texto).

``ESC`` -> Modo Normal.

``v`` -> Modo visual.

``:w`` -> guardar.

``:wq`` -> guardar y salir.

``:qa!`` -> salir sin guardar.


## Básicos:

``k`` -> subir.

``j`` -> bajar.

``h`` -> izquierda.

``l`` -> derecha.

``o`` -> insertar + línea adicional.

``u`` -> undo, deshacer.

``Ctrl r`` -> rehacer.

``y`` -> copiar.

``d`` -> borrar (cortar).

``p`` -> pegar.

``a`` -> insertar a la derecha del cursor ``A`` -> inserta al final de la línea.

``I`` -> insertar al principio de la línea.

## Desplazamiento:

``e`` -> final de palabra.

``w ``-> comienzo y final de cada palabra.

``0`` -> principio de línea.

``Shift arrows`` -> desplazar rapidamente por el documento.

``[[`` -> Ir al primer bloque.

``]]`` -> Ir al último bloque.

``}`` -> Bloque siguiente.

``{`` -> Bloque anterior.

``(`` -> Principio de línea.

``)`` -> Fin de línea.

``:55`` -> Ir a línea 55.

``Ctrl o`` -> Regresar a la línea donde se estaba previamente.

``f + {`` -> Va directamente al siguiente ``{``. Funciona para otros caracteres, por ejemplo: ``[ , ( , [a-z], [0-9] ,``, etc.

En la vista actual, `H` arriba, `M` al medio y `L` al final. 
`b` va al principio de la palabra mientras `e` va al final (before, end).

## Selección:

``v`` -> seleccionar (usar cursor o letras para mover, sirve combiando con Shift).

``V`` -> seleccionar línea entera.

``:V G`` -> selecciona todo el texto abajo del cursor.

Seleccionar una función <- ``V }``.

Seleccionar bloques hacia abajo <- ``v }``.

Seleccionar bloques hacia arriba <- ``v {``.

## Funcionalidades:

Mostrar archivos en path <- ``:!ls``.

Buscar y abrir archivos en path <- ``Ctrl p``.

Encontrar patrón en texto <- ``/patron``.

Borrar una función <-  ``V } d``.

Borrar todo dentro de comillas <- ``d i "``

Cambiar entre ventanas <- ``Ctrl + w + k`` o ``Ctrl + w + j``

Borrar 10 líneas abajos <- ``10  dd ``

Ir al inicio <- ``gg``. Ir al final ``G``. Mostrar status ``Ctrl + g``.

## Ergonómicos:

Salir <- ``Z Q``

``Ctrl c``-> Modo Normal.

``:V G d`` -> borrar todo el documento

Borrar y editar directamente dentro de una función <- ``c i {`` 

``/`` -> buscar, ``n`` siguiente y ``N`` anterior

``Ctrl v`` -> Bloques visuales

``.`` -> Rehace el último comando en un sito nuevo.

## Marcas:

Escribe ``:mark a`` en la línea que desea marcar, navega a ella con ``'a``. También puedes navegar entre marcas con ``['`` y ``]'``.

## Editar múltiples líneas:

Seleccinamos con ``V`` y luego usamos ``Ctrl V`` seguido de las teclas de desplazamiento (j, k, l, h, etc...) y el texto a agregar.

Sustituir patrón de texto <- ``:%s 'texto a sustituir''nuevo texto'``.

## Comentar múltiples líneas:

Comentar <- Seleccionar texto a comentar y luego ``:norm i// (o :norm i#)``. O, puedes utilizar ``:s/^/# /`` .

## Autoindent múltiples líneas (Ideal para programar en Python):

Seleccionar líneas con ``V`` y luego ``>>``.

Autocompletar <- ``Ctrl x Ctrl o``, luego seleccionar con ``Ctrl n`` .

Prettier para js, html, css <- ``Ctrl l``. 

## Editar varias líneas al mismo tiempo
Encerrar texto seleccionado en un tab <- selecciona con v o V, luego ``S`` y finalmente el tag, por ejemplo, ```<div>```.
Para agregar espacios a multiples líneas seleccionamos con ``V`` y agregamos ``I``, luego con espacios movemos las líneas.  

## Editar varios archivos en la misma pantalla

Editar un nuevo archivo: ``:e nombre_archivo``

Dividir la pantalla verticalmente y abrir un nuevo archivo para editar: ``:vsplit nombre_archivo`` 

Para dividir horizontalmente usamos ``:split``

Navegar entre pantallas: ``Ctrl w + jklh``

Con ``:hide`` podemos esconder la ventana, o simplemente ``:q``, ``:qa!`` o ``:wq`` para cerrarla.

## Abrir la terminal sin salir de Vim:

Podemos usar ``:term`` o ``:vert term`` para que se divida la pantalla verticalmente. 

Adicionalmente, podemos usar ``Ctrl z`` para suspender Vim y luego ``fg`` en la terminal para regresar a vim. 

## Encapsular un ``tag``  con otro ``tag`` facilmente. Útil para react, react-native, etc...
*Requiere el plugin ``surround``.

Selecciona el tag a encapsular con ``v``, luego utiliza ``S`` y escribe el tag que va a encapsular al anterior, por ejemplo ``View`` o ``div``.  

## Seleccionar todo un tag y su contenido <- `vat`.

## Borrar una palabra sin importar en que parte de ella se esté el cursor <- `dat`.

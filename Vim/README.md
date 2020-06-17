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

Borrar una función <-  ``V } d``.

Borrar todo dentro de comillas <- ``d i "``

Sustituir patrón de texto <- ``:%s 'texto a sustituir''nuevo texto'``.

Comentar <- Seleccionar texto a comentar y luego ``:norm i// (o :norm i#)``.

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

## Basado en el ``.vimrc`` que comparto. Colocar el archivo en ``/home/`` y utilizar ``:PlugInstall`` 

Autocompletar <- ``Ctrl x Ctrl o``, luego seleccionar con ``Ctrl n`` .

Prettier para js, html, css <- ``Ctrl shift l``. 

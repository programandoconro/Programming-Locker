# Mis comandos favoritos en Vim:

## Sobrevivencia:

``i`` -> insertar texto (Modo editor).

``ESC`` , ``Crtl + c``, ``Crtl + {`` -> Modo Comando.

``:w`` -> guardar.

``:wq`` -> guardar y salir.

``:qa!`` -> salir sin guardar.

``:V G d`` -> borrar todo el documento

## Básicos:

``k`` -> subir.

``j`` -> bajar.

``h`` -> izquierda.

``l`` -> derecha.

``o`` -> insertar + línea adicional.

``u`` -> undo, deshacer.

``Ctrl + r`` -> rehacer.

``y`` -> copiar.

``d`` -> borrar (cortar).

``p`` -> pegar.

## Desplazamiento:

``e`` -> final de palabra.

``w ``-> comienzo y final de cada palabra.

``0`` -> principio de línea.

``Shift + arrows`` -> desplazar rapidamente por el documento.

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

Seleccionar una función <- ``V + }``.

Seleccionar bloques hacia abajo <- ``v + }``.

Seleccionar bloques hacia arriba <- ``v + {``.

## Funcionalidades:

Mostrar archivos en path <- ``:!ls``.

Borrar una función <-  ``V + } + d``.

Borrar todo dentro de comillas <- ``d + i + "``

Sustituir patrón de texto <- ``:%s 'texto a sustituir''nuevo texto'``.

Comentar <- Seleccionar texto a comentar y luego ``:norm i// (o :norm i#)``.

Autocompletar <- ``Ctrl x + Ctrl o``, luego seleccionar con ``Ctrl + n`` .

Cambiar entre ventanas <- ``Ctrl + w + k`` o ``Ctrl + w + j``

Borrar 10 líneas abajos <- ``10 + dd ``

Ir al inicio <- ``gg``. Ir al final ``G``. Mostrar status ``Ctrl + g``.


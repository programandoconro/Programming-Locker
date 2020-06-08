# Mis comandos favoritos en Vim:

## Sobrevivencia:
```
i -> insertar texto (Modo editor)
ESC , Crtl + c, Crtl + { -> Modo Comando
:w -> guardar
:wq -> guardar y salir
:qa! -> salir sin guardar
:V G d -> borrar todo el documento
```

## Básicos:
```
o -> insertar + línea adicional
u -> undo, deshacer
Ctrl + r -> rehacer
d -> borrar
k -> subir
j -> bajar
```

## Desplazamiento:
```
e -> final de palabra
w -> comienzo y final de cada palabra
v -> seleccionar (usar cursor o letras para mover, sirve combiando con Shift)
0 -> principio de línea
Shift + arrows -> desplazar rapidamente por el documento
[[ <- Ir al primer bloque
]] <- Ir al último bloque 
} <- Bloque siguiente
{ <- Bloque anterior
```

## Selección:
```
:V G -> selecciona todo el texto abajo del cursor
Seleccionar una función <- V + }
Seleccionar bloques hacia abajo <- v + }
Seleccionar bloques hacia arriba <- v + {
```

## Funcionalidades:
```
Mostrar archivos en path <- :!ls
Borrar una función <-  V + } + d
Sustituir patrón de texto <- :%s 'texto a sustituir''nuevo texto'
Comentar <- Seleccionar texto a comentar y luego :norm i// (o :norm i#)
Autocompletar <- Ctrl x + Ctrl o 
```


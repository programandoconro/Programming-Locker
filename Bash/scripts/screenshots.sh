 #!/bin/bash
 
 echo 'Número de fotos a tomar:'
 read n_fotos
 
 echo 'Segundos entre foto y foto:'
 read segundos
 
 vals=$(seq 0 1 $n_fotos)
 
 for i in $vals;do
     scrot $i'.png' && sleep $segundos;
 done

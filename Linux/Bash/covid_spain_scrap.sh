for i in {31..100}
do
sudo wget "https://www.mscbs.gob.es/profesionales/saludPublica/ccayes/alertasActual/nCov-China/documentos/Actualizacion_"$i"_COVID-19.pdf" 
echo "File: $i"
done  

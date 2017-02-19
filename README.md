# hijos-prolog-xtend
Applicación en Xtend que consulta una base en Prolog

## Instalación
Es importante tener instalado [swi-prolog](http://www.swi-prolog.org/download/stable) junto con **JPL**.
### Ubuntu
```
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
sudo apt-get install swi-prolog-java
```
### Windows
> Creo que instalandolo normalmente ya viene con JPL (VARIFICAR!)

_**Verificar que en el directorio donde se haya instalado swi-prolog `/lib` se encuentre el archivo `jpl.jar`**_

## Correr los tests
Para correr los tests hay que decirle a Eclipse dónde se encuentra las (.dll ó .so) el archivo `jpl`. Para eso hay que agergar el library path en _Run Configurations -> Arguments -> VM Arguments_. En mi caso queda:
```
-Djava.library.path=/usr/lib/swi-prolog/lib/amd64/
```

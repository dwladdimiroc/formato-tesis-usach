Plantilla para tesis - Formato Usach
---
Plantilla de LaTeX para las tesis realizadas por la Universidad de Santiago de Chile, según lo indicado en el [manual de tesis del 2014](http://biblioteca.usach.cl/sites/biblioteca/files/documentos/manual_tesis_version_final_2014.pdf).

El proyecto contiene los siguientes archivos:

* `apa-good.bst`: Estilo de la cita APA
* `bibliografia.bib`: Archivo para agregar la información de las citas a realizar
* `tesis-enumeracion.sty`: Archivo para la enumeración de la tesis
* `tesis-finales.sty`: Archivo para el formato de los anexos y apéndices
* `tesis-usach.cls`: Estilo modificado de book.cls, el cual posee el formato de tesis según lo indicado por el manual de tesis Usach 2014
* `tesis-usach.tex`: Archivo principal, en el cual deben agregarse las distintas partes de la tesis

Nota: Para la compilación del archivo se debe utilizar Xelatex.

En caso de usar el editor online ShareLaTeX se debe comentar las líneas 17 y 18 del archivo `tesis-usach.cls` y descomentar las líneas 21, 22 y 23.
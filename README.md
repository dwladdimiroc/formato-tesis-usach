# Plantilla de tesis — Formato USACH (LaTeX)

Plantilla en **LaTeX** para tesis de la **Universidad de Santiago de Chile**, alineada con el [manual de tesis (2014)](http://biblioteca.usach.cl/sites/biblioteca/files/documentos/manual_tesis_version_final_2014.pdf).

Está pensada para ser **reproducible** en distintos equipos y años de cohorte: misma secuencia de compilación, mismas banderas de error y verificación automática en CI con una **versión fijada de TeX Live** (ver abajo).

## Reproducibilidad (para toda la comunidad USACH)


| Qué se controla         | Cómo                                                                                                                                                                                                                                                                                                                                                                           |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Receta de compilación   | `make` (o los mismos cuatro pasos en la sección “A mano”).                                                                                                                                                                                                                                                                                                                     |
| Banderas                | `-interaction=nonstopmode -file-line-error -halt-on-error` en cada invocación del motor.                                                                                                                                                                                                                                                                                       |
| BibTeX                  | Siempre **BibTeX** (`bibtex tesis-usach`), no Biber.                                                                                                                                                                                                                                                                                                                           |
| CI / referencia de aula | GitHub Actions usa **TeX Live 2025** (valor `texlive_version` en `[.github/workflows/build-pdf.yml](.github/workflows/build-pdf.yml)`); conviene usar **la misma generación** de TeX Live en laboratorios o indicar a estudiantes instalar **TeX Live 2025 o más reciente** con esquema `scheme-full` o al menos los conjuntos que incluyan los paquetes de `tesis-usach.cls`. |
| `latexmk`               | El archivo `[.latexmkrc](.latexmkrc)` alinea las banderas con el `Makefile` y con la acción de compilación. Para XeLaTeX: `latexmk -pdfxe`; para pdfLaTeX: `latexmk -pdf`.                                                                                                                                                                                                     |


**Fuentes.** El formato institucional usa la fuente **Arial**. En **XeLaTeX**, si Arial está instalada en el sistema, se usa; si no (p. ej. muchos servidores Linux sin fuentes propietarias), la clase usa **TeX Gyre Heros** como sustituto tipográfico. En **pdfLaTeX** se usa **Helvetica** (`helvet`). El PDF **no** será idéntico en bytes entre máquinas distintas; lo que debe coincidir es el **flujo de trabajo** y, con el mismo motor y fuentes disponibles, el **resultado tipográfico** esperado.

**Comprobación local.** Tras instalar TeX:

```bash
make versions   # muestra motor y BibTeX
make clean && make
```

## Requisitos

- **TeX Live** (recomendado alineado con CI: **2025+**) con `xelatex` o `pdflatex`, **BibTeX** y los paquetes requeridos por la clase (`natbib`, `algorithm2e`, `hyperref`, `fontspec` solo para XeLaTeX/LuaLaTeX, etc.).
- Recursos ya incluidos en el repo: `images/LogoUsach.png`, `images/licences/cc_by.png`, `images/Ejemplo.png` (y demás figuras que agregues).

## Estructura del repositorio


| Ruta                    | Descripción                                                             |
| ----------------------- | ----------------------------------------------------------------------- |
| `tesis-usach.tex`       | Archivo principal: aquí se enlazan preliminares, capítulos y anexos.    |
| `tesis-usach.cls`       | Clase de documento (basada en `book`), formato según manual USACH.      |
| `tesis-enumeracion.sty` | Numeración de figuras, tablas y algoritmos.                             |
| `tesis-finales.sty`     | Formato de anexos y apéndices.                                          |
| `apa-good.bst`          | Estilo bibliográfico tipo APA.                                          |
| `bibliografia.bib`      | Base BibTeX.                                                            |
| `preliminares/`         | Cubierta, resumen, dedicatoria, agradecimientos.                        |
| `chapters/`             | Capítulos del cuerpo.                                                   |
| `finales/`              | Glosario, anexos y apéndices.                                           |
| `images/`               | Logo USACH, ícono CC (`images/licences/cc_by.png`), figuras de ejemplo. |


## Compilar

### Con Make (recomendado)

Por defecto: **XeLaTeX** y ciclo **LaTeX → BibTeX → LaTeX × 2**:

```bash
make                # genera tesis-usach.pdf
make LATEX=pdflatex # mismo flujo con pdfLaTeX
make clean          # borra auxiliares
make cleanall       # auxiliares + PDF
```

### A mano

```bash
xelatex -interaction=nonstopmode -halt-on-error -file-line-error tesis-usach.tex
bibtex tesis-usach
xelatex -interaction=nonstopmode -halt-on-error -file-line-error tesis-usach.tex
xelatex -interaction=nonstopmode -halt-on-error -file-line-error tesis-usach.tex
```

Sustituye `xelatex` por `pdflatex` si usas ese motor.

### Overleaf

Compilar con **XeLaTeX** o **pdfLaTeX** según el menú del proyecto; la clase elige fuentes según el motor.

## Integración continua (GitHub Actions)

El workflow `[.github/workflows/build-pdf.yml](.github/workflows/build-pdf.yml)` compila con **latexmk** dos matrices: **XeLaTeX** y **pdfLaTeX**, sube cada `tesis-usach.pdf` como artefacto y actúa como **prueba de regresión** del repositorio para todas/os.

Tras habilitar Actions en tu fork o repositorio:

```markdown
[![Compilar PDF](https://github.com/USUARIO/REPO/actions/workflows/build-pdf.yml/badge.svg)](https://github.com/USUARIO/REPO/actions/workflows/build-pdf.yml)
```

## Opciones de la clase

En `tesis-usach.tex`:

```latex
\documentclass[coguia]{tesis-usach}
```

Opciones relevantes: `coguia` (muestra co-guía), `propuesta` (formato de propuesta). Consulta los comentarios en `tesis-usach.cls` y `tesis-usach.tex`.

## Licencia y créditos

Plantilla desarrollada en el ámbito USACH; los autores originales están acreditados al inicio de `tesis-usach.cls`. Revisa las condiciones de uso y la licencia de los materiales que incorpores (logo institución, imágenes, etc.).
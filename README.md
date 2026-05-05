# Plantilla de tesis — Formato USACH (LaTeX)

Plantilla en **LaTeX** para tesis de la **Universidad de Santiago de Chile**, alineada con el [manual de tesis (2014)](http://biblioteca.usach.cl/sites/biblioteca/files/documentos/manual_tesis_version_final_2014.pdf).

Está pensada para ser **reproducible** en distintos equipos y años de cohorte: misma secuencia de compilación, mismas banderas de error y verificación automática en CI con una **versión fijada de TeX Live** (tabla en la sección **Reproducibilidad**).

## Explicabilidad (entender qué hace cada cosa)

Esta sección complementa la reproducibilidad: no basta saber *qué comando ejecutar*, sino *por qué* existe cada paso y *dónde* interviene el estudiante.

### Qué problema resuelve cada paso de la compilación

La plantilla usa **Natbib + BibTeX** (no Biber). El orden **LaTeX → BibTeX → LaTeX → LaTeX** tiene una función concreta:

1. **Primera pasada** (`xelatex` o `pdflatex`): genera `tesis-usach.aux`, donde se registran citas (`\cite{...}`) y etiquetas (`\label`/`\ref`). Aún no existe bibliografía resuelta; es normal ver avisos de citas indefinidas.
2. **BibTeX**: lee el `.aux` y `bibliografia.bib`, aplica `apa-good.bst` y escribe `tesis-usach.bbl` (el contenido formateado de la bibliografía).
3. **Segunda pasada LaTeX**: incorpora el `.bbl` y comienza a cerrar números de cita y referencias cruzadas.
4. **Tercera pasada LaTeX**: estabiliza índices, tablas de contenido y referencias cuando algo cambió entre pasadas (TeX vuelve a escribir `.aux` en el paso anterior).

Si solo corres el motor **una vez**, tendrás bibliografía vacía o citas `[?]`; no es un fallo de la plantilla, sino un ciclo incompleto.

### Dónde editar tu tesis (mapa rápido)


| Objetivo                                              | Archivo(s) típico(s)                                                           |
| ----------------------------------------------------- | ------------------------------------------------------------------------------ |
| Datos de portada y metadatos                          | `preliminares/cubierta.tex`                                                    |
| Resumen / abstract                                    | `preliminares/abstract.tex`                                                    |
| Dedicatoria y agradecimientos                         | `preliminares/dedicatoria.tex`, `preliminares/agradecimiento.tex`              |
| Capítulos numerados                                   | `chapters/*.tex` (y el orden se define en `tesis-usach.tex`)                   |
| Bibliografía                                          | `bibliografia.bib` + comando ya definido en `tesis-usach.tex`                  |
| Glosario, anexos, apéndices                           | `finales/Glosario.tex`, `finales/Anexo-*.tex`, `finales/Apendice-*.tex`        |
| Reglas de formato global (márgenes, títulos, fuentes) | `tesis-usach.cls` (solo si tu programa o el manual exigen un ajuste explícito) |


`tesis-usach.tex` es el **orquestador**: ahí se elige la opción de clase (`coguia`, `propuesta`, etc.) y el orden de inclusiones. No cambies la clase salvo que entiendas el impacto en todo el documento.

### Relación con el reglamento / manual

- `**tesis-usach.cls`** concentra decisiones de diseño citadas en el manual (márgenes carta, interlineado, nombres de índices, estilo de capítulos, etc.).
- La plantilla **no** valida el contenido académico ni sustituye las normas vigentes de la universidad; corresponde a la persona tutora y a los órganos de titulación exigir cumplimiento **sustantivo**.
- Si el manual institucional se actualiza, habrá que **revisar la clase** frente al PDF oficial, no solo compilar de nuevo.

### Interpretar avisos y errores frecuentes


| Síntoma                                                                             | Lectura razonable                                                                                                                                                                                              |
| ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Citation ... undefined` / `There were undefined references` tras un solo `xelatex` | Falta BibTeX o faltan pasadas; ejecuta el ciclo completo o `make`.                                                                                                                                             |
| `LaTeX Warning: Label(s) may have changed. Rerun`                                   | Normal: una pasada más del mismo motor suele bastar.                                                                                                                                                           |
| Fallo al incluir una figura (`File not found`)                                      | Ruta incorrecta o archivo fuera de `images/` (o carpeta que uses); revisa `\includegraphics{...}`.                                                                                                             |
| Errores de fuente con XeLaTeX                                                       | Arial puede faltar en Linux; la clase cae a **TeX Gyre Heros** si Arial no está; para máxima fidelidad “Arial” en tu equipo, instálala o usa un entorno donde exista (p. ej. Windows / instalación explícita). |


### Elección entre XeLaTeX y pdfLaTeX

- **XeLaTeX** (por defecto en `make`): usa `fontspec` y puede usar Arial del sistema cuando está disponible.
- **pdfLaTeX** (`make LATEX=pdflatex`): no usa `fontspec`; la clase activa **Helvetica** como sans serif principal. Útil en entornos mínimos o cuando prefieres evitar dependencia de fuentes del SO.

Ambos motores están probados en CI; elige uno **y mantén coherencia** en todo el proyecto (incluidas colaboraciones y Overleaf).

---

## Reproducibilidad (para toda la comunidad USACH)


| Qué se controla         | Cómo                                                                                                                                                                                                                                                    |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Receta                  | `make` o los cuatro pasos en [A mano](#a-mano).                                                                                                                                                                                                         |
| Banderas                | `-interaction=nonstopmode -file-line-error -halt-on-error` en cada invocación del motor (fallo claro y línea de archivo).                                                                                                                               |
| Referencias             | Siempre **BibTeX** (`bibtex tesis-usach`), no Biber.                                                                                                                                                                                                    |
| CI / referencia de aula | En `[.github/workflows/build-pdf.yml](.github/workflows/build-pdf.yml)`, `texlive_version: "2025"`. En laboratorios o guías de instalación, conviene **la misma generación** de TeX Live (2025 o más reciente, con paquetes suficientes para la clase). |
| `latexmk`               | `[.latexmkrc](.latexmkrc)` repite las mismas banderas. Motores: `latexmk -pdfxe` (XeLaTeX) o `latexmk -pdf` (pdfLaTeX).                                                                                                                                 |


**Fuentes.** El formato institucional alude a **Arial**. En XeLaTeX, si Arial está instalada, se usa; si no, **TeX Gyre Heros**. En pdfLaTeX, **Helvetica** (`helvet`). El PDF **no** será idéntico en bytes entre máquinas; debe alinearse el **procedimiento** y, con mismo motor y fuentes, el **aspecto** esperado.

**Comprobación local:**

```bash
make versions   # motor y BibTeX
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

El workflow `[.github/workflows/build-pdf.yml](.github/workflows/build-pdf.yml)` compila con **latexmk** en dos variantes (**XeLaTeX** y **pdfLaTeX**), sube cada `tesis-usach.pdf` como artefacto y funciona como **prueba de regresión** del repositorio.

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
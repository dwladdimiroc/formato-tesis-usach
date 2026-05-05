# Reproducibilidad: mismas banderas que `Makefile` y GitHub Actions (xu-cheng/latex-action).
# Motors: `latexmk -pdfxe` (XeLaTeX) o `latexmk -pdf` (pdfLaTeX).

$xelatex = 'xelatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$pdflatex = 'pdflatex -file-line-error -halt-on-error -interaction=nonstopmode %O %S';

# Limpiar con: latexmk -c
$clean_ext = 'loa lof lot out toc synctex.gz bbl';

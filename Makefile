# Compilación reproducible — misma receta para todas/os (USACH): LaTeX → BibTeX → LaTeX × 2.
# Uso:
#   make              # XeLaTeX (recomendado; Arial si el sistema la tiene)
#   make LATEX=pdflatex
#   make versions     # comprobar toolchain local
#   make clean

MAIN   := tesis-usach
LATEX ?= xelatex

LATEX_FLAGS := -interaction=nonstopmode -file-line-error -halt-on-error

TEX_PARTS := \
	$(wildcard preliminares/*.tex) \
	$(wildcard chapters/*.tex) \
	$(wildcard finales/*.tex)

STY_INPUTS := \
	$(MAIN).tex \
	$(TEX_PARTS) \
	bibliografia.bib \
	apa-good.bst \
	tesis-usach.cls \
	tesis-finales.sty \
	tesis-enumeracion.sty

# Figuras versionadas que afectan la compilación (evita PDF obsoleto si solo cambian assets).
FIGS := $(sort $(wildcard images/*.png images/*/*.png))

.PHONY: all pdf clean cleanall help versions

all: pdf

help:
	@echo "Objetivos:"
	@echo "  make pdf              compila $(MAIN).pdf (motor: \$$LATEX, default xelatex)"
	@echo "  make LATEX=pdflatex pdf"
	@echo "  make versions         muestra versiones de $(LATEX) y bibtex"
	@echo "  make clean            borra auxiliares del directorio raíz y preliminares/"
	@echo "  make cleanall         clean + $(MAIN).pdf"

versions:
	@$(LATEX) --version | head -n 2
	@bibtex --version | head -n 1

pdf: $(MAIN).pdf

$(MAIN).pdf: $(STY_INPUTS) $(FIGS)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	bibtex $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

clean:
	rm -f $(MAIN).{aux,bbl,blg,loa,lof,log,lot,out,toc,synctex.gz}
	rm -f preliminares/*.aux

cleanall: clean
	rm -f $(MAIN).pdf

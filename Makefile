BUILDDIR := build

PDFLATEX_FLAGS := -output-directory $(BUILDDIR)
BIBER_FLAGS := -output-directory $(BUILDDIR)

pdf: tex bib | out
	cp build/mechanics.pdf out/

tex: | build
	pdflatex $(PDFLATEX_FLAGS) src/mechanics/mechanics.tex

bib: tex
	biber $(BIBER_FLAGS) mechanics
	pdflatex $(PDFLATEX_FLAGS) src/mechanics/mechanics.tex
	pdflatex $(PDFLATEX_FLAGS) src/mechanics/mechanics.tex

build:
	mkdir -p build

out:
	mkdir -p out

clean:
	$(RM) -r build
	$(RM) -r out

.PHONY: pdf tex bib clean


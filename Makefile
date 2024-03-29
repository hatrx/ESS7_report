##################################################################
# Makefile for LaTeX
##################################################################
# Use:
# make
# make clean
# options for ps2pdf: http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.50/Ps2pdf.htm

TEX:=$(shell ls *.tex)
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.tdo *.run.xml *.log *.bib

pdflatex: master.tex
	rm -f $(OTHER) $(PS)
	pdflatex --synctex=1 master.tex
	bibtex master.aux
	pdflatex --synctex=1 master.tex
	pdflatex --synctex=1 master.tex
	#rm -f $(OTHER) $(PS)
	
quick: master.tex
	bibtex master.aux
	pdflatex --synctex=1 master.tex

clean:
	rm -f $(OTHER) $(PS)

default: pubstmt.pdf sample-pubstmt.pdf

pubstmt.pdf: pubstmt.sty
	pdflatex pubstmt.dtx
	makeindex -s gglo.ist -o pubstmt.gls pubstmt.glo
	makeindex -s gind.ist -o pubstmt.ind pubstmt.idx
	pdflatex pubstmt.dtx

pubstmt.sty: pubstmt.ins pubstmt.dtx
	pdflatex pubstmt.ins

sample-pubstmt.pdf: sample-pubstmt.tex sample-main.tex pubstmt.sty
	pdflatex sample-pubstmt.tex
	pdflatex sample-pubstmt.tex

clean:
	rm -f *.aux pubstmt.glo pubstmt.gls pubstmt.idx *.ilg pubstmt.ind *.log *.out sample-pubstmt.nlo sample-pubstmt.nls *.synctex.gz pubstmt.toc

cleanall: clean
	rm -f pubstmt.pdf pubstmt.sty sample-pubstmt.pdf

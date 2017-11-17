default: pubstmt.pdf sample-pubstmt.pdf sample-pubstmt-Springer.pdf sample-pubstmt-LNCS.pdf sample-pubstmt-Elsevier.pdf sample-pubstmt-SCP.pdf clean

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

sample-pubstmt-Springer.pdf: sample-pubstmt-Springer.tex sample-main.tex pubstmt.sty
	pdflatex sample-pubstmt-Springer.tex
	pdflatex sample-pubstmt-Springer.tex

sample-pubstmt-LNCS.pdf: sample-pubstmt-LNCS.tex sample-main.tex pubstmt.sty
	pdflatex sample-pubstmt-LNCS.tex
	pdflatex sample-pubstmt-LNCS.tex

sample-pubstmt-Elsevier.pdf: sample-pubstmt-Elsevier.tex sample-main.tex pubstmt.sty
	pdflatex sample-pubstmt-Elsevier.tex
	pdflatex sample-pubstmt-Elsevier.tex

sample-pubstmt-SCP.pdf: sample-pubstmt-SCP.tex sample-main.tex pubstmt.sty
	pdflatex sample-pubstmt-SCP.tex
	pdflatex sample-pubstmt-SCP.tex

clean:
	rm -f *.aux pubstmt.glo pubstmt.gls pubstmt.idx *.ilg pubstmt.ind *.log *.out *.rel sample-pubstmt.nlo sample-pubstmt.nls *.synctex.gz pubstmt.toc

cleanall: clean
	rm -f pubstmt.pdf pubstmt.sty sample-pubstmt.pdf sample-pubstmt-Springer.pdf sample-pubstmt-LNCS.pdf sample-pubstmt-Elsevier.pdf sample-pubstmt-SCP.pdf

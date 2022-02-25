del *.aux *.lo? *.toc *.ind *.inx *.gls *.glo *.ist *.idx *.ilg *.out *.bak *.bbl *.brf *.blg *.dvi *.ps *.xdv  *.aux *.bcf *.run.xml *.synctex.gz
del scutthesis.pdf

xelatex -no-pdf --interaction=nonstopmode scutthesis
biber scutthesis
xelatex -no-pdf --interaction=nonstopmode scutthesis
xelatex --interaction=nonstopmode scutthesis
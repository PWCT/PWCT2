PWCT - Documents folder
=======================

In this folder we have the pwct documentation 

The documentation is created using Sphinx (A popular tool written in Python)

(1) Install Python (Tested using Python 3.6)

(2) Install Sphinx (Tested using v3.1.1) 

(3) To use the pygments lexer, copy ring.py to Python\Lib\site-packages\pygments\lexers

(4) Then run : python _mapping.py

(5) To generate CHM file, Use Microsoft Help Workshop (from WayBack Machine): https://web.archive.org/web/20200918004813/http://download.microsoft.com/download/0/A/9/0A939EF6-E31C-430F-A3DF-DFAE7960D564/htmlhelp.exe

(6) To generate PDF file, Install MiKTeX (https://miktex.org/download) - Tested using MiKTeX 23.4

	buildlatex.bat

	cd build/latex

	pdflatex PWCT.tex

	makeindex PWCT -s python.ist

	pdflatex PWCT.tex
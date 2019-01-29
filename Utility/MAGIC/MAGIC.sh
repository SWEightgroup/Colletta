#!/bin/bash]
echo $(date --iso-8601) > Gulpease.txt

echo "Benvenuto in MAGIC!"
echo "Sto compilando i tex 3 volte (non si e' mai troppo sicuri)"
 for i in `seq 1 3`;
        do
            printf 'Complazione #'
            printf $i
            cd ../../Working_Dir/Norme-di-Progetto/
            sudo docker run -ti   -v miktex:/miktex/.miktex   -v `pwd`:/miktex/work   miktex/miktex sudo pdflatex norme-di-progetto.tex --enable-installer
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../Working_Dir/Analisi_dei_requisiti/
            sudo docker run -ti   -v miktex:/miktex/.miktex   -v `pwd`:/miktex/work   miktex/miktex pdflatex AnalisiDeiRequisiti.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../Working_Dir/Glossario/
            sudo docker run -ti   -v miktex:/miktex/.miktex   -v `pwd`:/miktex/work   miktex/miktex pdflatex Glossario.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../Working_Dir/pdq/
            sudo docker run -ti   -v miktex:/miktex/.miktex   -v `pwd`:/miktex/work   miktex/miktex pdflatex pdq.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../Working_Dir/Piano_di_Progetto/Documento/
            sudo docker run -ti   -v miktex:/miktex/.miktex   -v `pwd`:/miktex/work   miktex/miktex pdflatex Piano_di_Progetto.tex --enable-installer >/dev/null
            printf "."
            cd ../../../Utility/MAGIC/
            printf "Fatto"
            echo
        done  

perl gulpeasepdf.pl ../../Working_Dir/Norme-di-Progetto/norme-di-progetto.pdf "Scopo del documento" 1 Norme  >log.txt
perl gulpeasepdf.pl ../../Working_Dir/Analisi_dei_requisiti/AnalisiDeiRequisiti.pdf "Scopo del documento" 2 Analisi >log.txt
perl gulpeasepdf.pl ../../Working_Dir/Glossario/Glossario.pdf "Ambiente cloud" 1 Glossario >log.txt
perl gulpeasepdf.pl ../../Working_Dir/pdq/pdq.pdf "Scopo del documento" 2 Pdq >log.txt
perl gulpeasepdf.pl ../../Working_Dir/Piano_di_Progetto/Documento/Piano_di_Progetto.pdf "Scopo del documento" 2 Pdp >log.txt
echo "Tranquillo, questi warning sono normali"

echo "Sto mettendo i file nel foglio google"
python magic-sheet.py >/dev/null
echo "Bella zio! Fatto tutto"
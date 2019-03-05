#!/bin/bash]
echo $(date --iso-8601) > Gulpease.txt

echo "Benvenuto in MAGIC!"
echo "Sto compilando i tex 3 volte (non si e' mai troppo sicuri)"
 for i in `seq 1 3`;
        do
            printf 'Complazione #'
            printf $i
            cd ../../RP/Norme-di-Progetto/
            pdflatex norme-di-progetto.tex --enable-installer > /dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../RP/Analisi_dei_requisiti/
            pdflatex AnalisiDeiRequisiti.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../RP/Glossario/
            pdflatex Glossario.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../RP/pdq/
            pdflatex pdq.tex --enable-installer >/dev/null
            printf "."
            cd ../../Utility/MAGIC/
            cd ../../RP/Piano_di_Progetto/Documento/
            pdflatex Piano_di_Progetto.tex --enable-installer >/dev/null
            printf "."
            cd ../../../Utility/MAGIC/
            printf "Fatto"
            echo
        done  

perl gulpeasepdf.pl ../../RP/Norme-di-Progetto/norme-di-progetto.pdf "Scopo del documento" 1 Norme  >log.txt
perl gulpeasepdf.pl ../../RP/Analisi_dei_requisiti/AnalisiDeiRequisiti.pdf "Scopo del documento" 2 Analisi >log.txt
perl gulpeasepdf.pl ../../RP/Glossario/Glossario.pdf "Ambiente cloud" 1 Glossario >log.txt
perl gulpeasepdf.pl ../../RP/pdq/pdq.pdf "Scopo del documento" 2 Pdq >log.txt
perl gulpeasepdf.pl ../../RP/Piano_di_Progetto/Documento/Piano_di_Progetto.pdf "Scopo del documento" 2 Pdp >log.txt
echo "Tranquillo, questi warning sono normali"

echo "Sto mettendo i file nel foglio google"
python magic-sheet.py >/dev/null
echo "Bella zio! Fatto tutto"
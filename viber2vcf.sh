#/bin/bash

# skripta za preuzimanje kontakata iz Viber baze i konverziju u .vcf datoteku

# imamo li potrebne programe

which sqlite3 > /dev/null || { echo "Nedostaje sqlite3"; exit; }
which awk > /dev/null || { echo "Nedostaje awk"; exit; }

# imamo li bazu iz Vibera

test -e "viber.db" || { echo "Nema viber.db"; exit; }

# eksport podataka iz Viberove baze

sqlite3 -list -noheader viber.db "SELECT contact.FirstName,contactrelation.Number FROM contact,contactrelation WHERE contactrelation.ContactID=contact.ContactID;" > imenik-viber.csv

# spajanje brojeva istog kontakta

sort imenik-viber.csv | ./multiple.awk > imenik-multiple.csv

# konverzija u vCard format

./csv2vcf.awk imenik-multiple.csv > imenik-sve.vcf

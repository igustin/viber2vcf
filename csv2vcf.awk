#!/usr/bin/awk -f

BEGIN {
	FS="|"
}

{
	print "BEGIN:VCARD"
	print "VERSION:2.1"

	fullname = $1 == "<EmptyValue>." ? "" : $1
	spc=index(fullname," ")
	firstname=substr(fullname,1,spc-1)
	lastname=substr(fullname,spc+1)
	print "N:" lastname ";" firstname
	print "FN:" fullname

	for(num=2;num<=NF;++num) {
		numtype = substr($num,1,5)=="+3859" ? "CELL" : "VOICE"
		print "TEL;" numtype ":" $num
	}

	print "END:VCARD"
}

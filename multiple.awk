#!/usr/bin/awk -f

BEGIN {
	FS="|"
	OFS="|"
}

{
	fn=$1
	num=$2
	if(NR==1) {
		printf "%s|%s",fn,num
	}
	else {
		if(fn==lastfn && fn!="<EmptyValue>.") {
			printf "|%s",num
		}
		else {
			printf "\n%s|%s",fn,num
		}
		lastfn=fn
	}
}

END {
	printf "\n"
}

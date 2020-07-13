if [ $# -eq 1 ] ; then
    googler -t d10 -n20 --json filetype:pdf $1|jq .[].url|sed -e 's/^"//' -e 's/"$//'
elif [ $# -eq 2 ] ; then
    googler -w $2 -t d10 -n20 --json filetype:pdf $1|jq .[].url|sed -e 's/^"//' -e 's/"$//'
fi

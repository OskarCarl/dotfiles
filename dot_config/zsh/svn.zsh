alias svn-add-all="svn st | grep '^?' | sed 's/^?\s*//;s/^\(.*\)$/"\\1"/g' | xargs -I% svn add %"
alias svn-del-all="svn st | grep '^!' | sed 's/^!\s*//;s/^\(.*\)$/"\\1"/g' | xargs -I% svn del %"

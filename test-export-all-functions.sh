#!/bin/bash
## test-export-all-functions
## version 0.0.1 - initial
##################################################
a() { true ; }
b() { true ; }
c() { true ; }
test-export-all-functions() {
  _() {
    {
      declare -Fx
      declare -F
    } | sort \
      | uniq -c \
      | grep -v -e '^\s*2\s' -e '_' \
      | sed 's/.*-f\s//'
  }
  local function
  for function in $( _ )
  do
   export -f "${function}" 
  done
  declare -Fx
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
test-export-all-functions
##################################################
## generated by create-stub2.sh v0.1.2
## on Sun, 07 Jul 2019 16:18:26 +0900
## see <https://github.com/temptemp3/sh2>
##################################################

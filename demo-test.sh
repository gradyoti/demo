#!/bin/bash - 
#===============================================================================
#
#          FILE: demo-test.sh
# 
#         USAGE: ./demo-test.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 10/23/2013 10:57
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
STATUS=0

echo "Testing addition."
[ $(./demo.sh -a 2 2) != 4 ] && echo "FAILED!"; STATUS=1

echo "Testing subtraction."
[[ $(./demo.sh -s 4 2) != 2 ]] && echo "FAILED!"; STATUS=1

[[ $STATUS == 0 ]] && echo "PASSED!"
exit $STATUS

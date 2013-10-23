#!/bin/bash - 
#===============================================================================
#
#          FILE: demo.sh
# 
#         USAGE: ./demo.sh 
# 
#   DESCRIPTION: Demo script. 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Josh King (jheretic), jking@chambana.net
#  ORGANIZATION: 
#       CREATED: 10/23/2013 10:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#===============================================================================
#   SANITY CHECKS
#===============================================================================
if [ -z "$BASH" ] ; then
  printf "$SCRIPT:$LINENO: run this script with the BASH shell\n" >&2
  exit 192
fi

if [ ! -x "$mkdir" ] ; then
  printf "$SCRIPT:$LINENO: command '$mkdir' not available - aborting\n" >&2
  exit 192
fi

#===============================================================================
#   MAIN SCRIPT
#===============================================================================

ScriptVersion="1.0"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
	cat <<- EOT

  Usage :  ${0##/*/} [options] [--] 

  Options: 
  -h|help       Display this message
  -v|version    Display script version

	EOT
}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hv" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;

    v|version  )  echo "$0 -- Version $ScriptVersion"; exit 0   ;;

    \? )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))


#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

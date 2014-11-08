#! /bin/bash

# Used to have mail.ostermann.ws go through the
# regular connection instead of the VPN

ACTION=""

help()
{
echo "Usage: $(basename $0) Action"
echo
echo "Actions:"
echo "-a     Add mailserver to routing table."
echo "-d     Delete mailserver from routing table."
echo
}


case $1 in
    "-a")
        ACTION="add";
    ;;
    "-d")
        ACTION="delete";
        ;;
    *)
        help
        exit 0
        ;;
esac


# Configure
MAILSERVER=""

NETSTAT="$(which netstat)"
GREP="$(which grep)"
AWK="$(which awk)"
NSLOOKUP="$(which nslookup)"
ROUTE="$(which route)"

GATEWAY="$($NETSTAT -nr | $GREP -E '^default' | $AWK '{split($0, array, " ")} END {print array[2]}')"
SERVER="$($NSLOOKUP $MAILSERVER | $GREP -E '^Address' | $AWK '{split($0, array, " ")} END {print array[2]}')"

sudo $ROUTE -nv $ACTION $SERVER $GATEWAY
#!/bin/bash

set -u # Throw errors when unset variables are used
set -e # Exit on error
#set -o pipefail # Bash specific

usage() {
	echo "Tool to update the syncthing binaries"
	echo
	echo "Usage:"
	echo "$0 [-h] [-v <version>]"
	echo
	echo "-h            This help message"
	echo "-v <version>  Update the syncthing binaries to this version"
	exit
}

# A POSIX variable
OPTIND=1 # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
VERSION=""

# getopts only allows single letter options (but is apparently the most
# portable). If you want multi letter options (eg --help) use getopt.
while getopts "hv:" opt; do
	case "$opt" in
	v)	VERSION="$OPTARG";;
	h)
		usage
		;;
	?)	exit 1 ;; # message provided by getopts
	esac
done

if [ -z "$VERSION" ]; then
	usage
fi

shift $((OPTIND - 1))

[ $# -ge 1 ] && [ "$1" = "--" ] && shift

MYDIR=$(dirname "$(realpath "$0")")

# Add "v" to VERSION if needed
if ! [ "${VERSION/[0-9]*/}" = "v" ]; then
    VERSION="v${VERSION}"
fi

CURDIR=$(pwd)

cd "$MYDIR"

curl -LO "https://github.com/syncthing/syncthing/releases/download/$VERSION/syncthing-linux-arm-$VERSION.tar.gz"
tar -xavf "syncthing-linux-arm-$VERSION.tar.gz" --strip-components=1 "syncthing-linux-arm-$VERSION/syncthing"
mv syncthing syncthing.koplugin/syncthing-arm32
rm "syncthing-linux-arm-$VERSION.tar.gz"

curl -LO "https://github.com/syncthing/syncthing/releases/download/$VERSION/syncthing-linux-amd64-$VERSION.tar.gz"
tar -xavf "syncthing-linux-amd64-$VERSION.tar.gz" --strip-components=1 "syncthing-linux-amd64-$VERSION/syncthing"
mv syncthing syncthing.koplugin/syncthing-amd64
rm "syncthing-linux-amd64-$VERSION.tar.gz"

cd "$CURDIR"

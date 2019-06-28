# see
# https://stackoverflow.com/questions/13160309/conversion-hex-string-into-ascii-in-bash-command-line
hex2str() {
	if [[ $# -ne 1 ]]; then
		>&2 echo "Usage: hex2str HEX_STRING"
		return -1;
	fi
	echo "$1" | xxd -r -p
}

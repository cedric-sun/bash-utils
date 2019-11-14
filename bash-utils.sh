alias dush='du -sh'
alias unhtml= perl -MHTML::Entities -pe 'decode_entities($_);'

mkcd() {
    if [[ $# -ne 1 ]]; then
        echo "Argument error." >&2
        return 255
    fi
    if [[ -d "$1" ]]; then
        echo "Directory already exists." >&2
        return 255
    fi
    mkdir -v "$1"
    cd "$1"
}

hex2str() {
# https://stackoverflow.com/questions/13160309/conversion-hex-string-into-ascii-in-bash-command-line
    if [[ $# -ne 1 ]]; then
        >&2 echo "Usage: hex2str HEX_STRING"
        return -1;
    fi
    echo "$1" | xxd -r -p
}

h2d() {
    if [[ $# -ne 1 ]]; then
        return 255
    fi
    printf '%d\n' $1
}

d2h() {
    if [[ $# -ne 1 ]]; then
        return 255
    fi
    printf '%x\n' $1
}

unhtml() {
}

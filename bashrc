alias dush='du -sh'
alias unhtml="perl -MHTML::Entities -pe 'decode_entities(\$_);'"

# requires X and xclip; not working in Wayland
# alias xclipc='xclip -sel clip'

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

# extract line range [n,m] from file. https://stackoverflow.com/a/83347/8311608
# Usage: fcrop n m file
fcrop() {
    sed -n "$1,$2p;$(($2+1))q" $3
}

dgov() {
    for i in {0..7}; do
        governor=$(</sys/devices/system/cpu/cpu${i}/cpufreq/scaling_governor tr -d '\n')
        driver=$(</sys/devices/system/cpu/cpufreq/policy${i}/scaling_driver tr -d '\n')
        echo "CPU ${i}: ${driver} ${governor}"
    done
}


# remove comment line and empty line of unix .conf format file
noc() {
    grep -e '^\s*$' -e '^\s*#' -v $@
}

pyhttp() {
    python3 -m http.server $@
}


#variadic: rfcget 1234 5678 ...
rfcget() {
    for id in "$@"; do
        wget "https://tools.ietf.org/pdf/rfc${id}.pdf"
    done
}

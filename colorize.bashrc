setcolor='\[\e[32m\]'
resetcolor='\[\e(B\e[m\]'
PS1="${setcolor}${PS1}${resetcolor}"


man() {
    LESS_TERMCAP_mb='[1;32m' \
    LESS_TERMCAP_md='[1;32m' \
    LESS_TERMCAP_me='[0m' \
    LESS_TERMCAP_se='[0m' \
    LESS_TERMCAP_so='[01;43m' \
    LESS_TERMCAP_ue='[0m' \
    LESS_TERMCAP_us='[1;4;31m' \
    /usr/bin/man $@
}


alias grep='grep --color=auto'

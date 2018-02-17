# allow emacs started from bash to type chinese
alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"

# can use colors based on .Xdefaults
# or use 256 color palette
PS1_chroot="${debian_chroot:+($debian_chroot)}"

PS1_first_line="\[\033[1;33m\]\T [$PS1_chroot\w]"
PS1_second_line="\[\033[0;36m\]\u\[\033[0m\]@\[\033[0;35m\]\h\[\033[0m\]\$ "
PS1="$PS1_first_line\n$PS1_second_line"

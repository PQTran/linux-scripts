# allow emacs started from bash to type chinese
alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"

# can use colors based on .Xdefaults
# or use 256 color palette
function __in_git_repo {
    if (git rev-parse --git-dir > /dev/null 2> /dev/null); then
        exit 0
    else
        exit 1
    fi
}

function __git_dirty {
    while read line; do
	status_code=$(echo $line | awk '{print $1;}')
	if [[ "$status_code" =~ [MADRCU] ]]; then
	    exit 0
	fi
    done < <(git status --porcelain)

    exit 1
}

function __git_ps1_dirty {
    if $(__in_git_repo); then
	if $(__git_dirty); then
	    echo -n " (:<)"
	else
	    echo -n " (:3)"
	fi
    fi
}

PS1_chroot="${debian_chroot:+($debian_chroot)}"
PS1_git_info=" \[\033[1;31m\]\$(__git_ps1 '(%s)')\[\033[0m\]\$(__git_ps1_dirty)"

PS1_first_line="\[\033[1;33m\]\T [$PS1_chroot\w]$PS1_git_info"
PS1_second_line="\[\033[0;36m\]\u\[\033[0m\]@\[\033[0;35m\]\h\[\033[0m\]\$ "
PS1="$PS1_first_line\n$PS1_second_line"

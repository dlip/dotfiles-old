run() {
    DRY_RUN=${DRY_RUN:-false}
    if [ "$DRY_RUN" = "true" ]; then
        echo "DRY_RUN: $1"
    else
        echo $1
        eval $1
    fi
}

array_contains() {
    local seeking=$2
    local in=1
    ZSH_VERSION=${ZSH_VERSION:-}
    if [ -n "$ZSH_VERSION" ]; then
        local array=(${(P)${1}})
        if [[ ${array[(ie)$seeking]} -le ${#array} ]]; then
            in=0
        fi
    elif [ -n "$BASH_VERSION" ]; then
        local array="$1[@]"
        for element in "${!array}"; do
            if [[ $element = $seeking ]]; then
                in=0
                break
            fi
        done
    fi
    return $in
}

unix_to_windows_path() {
    echo $( echo "$1" | sed 's|^/\(.\)|\1:|' | sed 's|/|\\|g')
}

create_symlink() {
    FROM=$1
    TO=$2
    if [[ $(uname) =~ ^MINGW ]]; then
        WIN_FROM=$(unix_to_windows_path "$FROM")
        WIN_TO=$(unix_to_windows_path "$TO")
        if [ -e "$TO" ]; then
            run "rm -rf \"$TO\""
        fi
        if [ -d "$1" ]; then
            run "cmd //c \"mklink /J $WIN_TO $WIN_FROM\""
        else
            run "cmd //c \"mklink $WIN_TO $WIN_FROM\""
        fi
    else
        if [ -f "$TO" ] || [ -d "$TO" ] || [ -h "$TO" ] && [ "$(readlink "$TO")" != "$FROM" ]; then
            run "rm -rf \"$TO\""
        fi
        if [ ! -e "$TO" ]; then
            run "ln -s \"$FROM\" \"$TO\""
        fi
    fi
}

create_dir (){
    if [ ! -d "$1" ]; then
        run "mkdir -p \"$1\""
    fi
}

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

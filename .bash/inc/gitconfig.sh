gitconfig_install() {
    if [ ! -f "$(dotfiles_dir)/.local.gitconfig" ]; then
        run "gitconfig_create"
    fi
}

gitconfig_create() {
    echo -n 'Enter Git user name: '
    read GIT_USER
    echo -n 'Enter Git email: '
    read GIT_EMAIL
    cat > .local.gitconfig <<EOF
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
EOF
}
shell_bash() {
    if ! grep -q "/usr/local/bin/bash" /private/etc/shells; then
        sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
    fi
    chsh -s /usr/local/bin/bash
}

shell_zsh() {
    if ! grep -q "/usr/local/bin/zsh" /private/etc/shells; then
        sudo bash -c "echo /usr/local/bin/zsh >> /private/etc/shells"
    fi
    chsh -s /usr/local/bin/zsh
}
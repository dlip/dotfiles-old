function vscode_install() {
  case $(uname) in
    'Linux')
      create_dir "$HOME/.config/Code/User"
      create_symlink "$(dotfiles_dir)/nolink/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
      ;;
    MINGW*)
      create_dir "$APPDATA/Code"
      create_symlink "$(dotfiles_dir)/nolink/vscode" "$APPDATA/Code/User"
      ;;
    'Darwin')
      create_dir "$HOME/Library/Application Support/Code/User"
      create_symlink "$(dotfiles_dir)/nolink/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ;;
  esac
  vscode_install_extensions
}

function vscode_install_extensions() {
    # Install Visual Studio Code extensions
    if which code &> /dev/null; then
        echo "Installing Visual Studio Code extensions..."
        INSTALL_EXTENSIONS=(`cat $(dotfiles_dir)/nolink/vscode/extensions | tr '\n' ' '`)
        EXISTING_EXTENSIONS=(`code --list-extensions | tr '\n' ' '`)

        for EXTENSION in "${INSTALL_EXTENSIONS[@]}"; do
            if (! array_contains EXISTING_EXTENSIONS $EXTENSION); then
                run "code --install-extension $EXTENSION"
            fi
        done
        for EXTENSION in "${EXISTING_EXTENSIONS[@]}"; do
            if (! array_contains INSTALL_EXTENSIONS $EXTENSION); then
                run "code --uninstall-extension $EXTENSION"
            fi
        done
    else
        echo "Visual Studio Code doesn't exist, skipping extension installation"
    fi
}

vscode_save_extensions() {
    if which code &> /dev/null; then
        echo "Saving Visual Studio Code extensions..."
        code --list-extensions > "$(dotfiles_dir)/nolink/vscode/extensions"
    else
        echo "Visual Studio Code doesn't exist, can't save extensions"
    fi
}
vscode_install() {
  case $(uname) in
    'Linux')
      VSCODE_DIR="$HOME/.config/Code/User"
      ;;
    MINGW*)
      VSCODE_DIR="$APPDATA/Code"
      ;;
    'Darwin')
      VSCODE_DIR="$HOME/Library/Application Support/Code/User"
    ;;
  esac
  create_dir "$VSCODE_DIR"
  create_symlink "$DOTFILES_DIR/vscode" "$VSCODE_DIR"

  vscode_install_extensions
}

vscode_install_extensions() {
    # Install Visual Studio Code extensions
    if which code &> /dev/null; then
        INSTALL_EXTENSIONS=(`cat $DOTFILES_DIR/vscode/extensions | tr '\n' ' '`)
        EXISTING_EXTENSIONS=(`code --list-extensions | tr '\n' ' '`)
        EXISTING_EXTENSIONS=${EXISTING_EXTENSIONS:-()}

        for EXTENSION in "${INSTALL_EXTENSIONS[@]}"; do
            if (! array_contains EXISTING_EXTENSIONS $EXTENSION); then
                run "code --install-extension $EXTENSION"
            fi
        done
    else
        echo "Visual Studio Code doesn't exist, skipping extension installation"
    fi
}

vscode_cleanup_extensions() {
    # Remove Visual Studio Code extensions not in extensions file
    INSTALL_EXTENSIONS=(`cat $DOTFILES_DIR/vscode/extensions | tr '\n' ' '`)
    EXISTING_EXTENSIONS=(`code --list-extensions | tr '\n' ' '`)
    EXISTING_EXTENSIONS=${EXISTING_EXTENSIONS:-()}

    for EXTENSION in "${EXISTING_EXTENSIONS[@]}"; do
        if (! array_contains INSTALL_EXTENSIONS $EXTENSION); then
            run "code --uninstall-extension $EXTENSION"
        fi
    done
}

vscode_save_extensions() {
    if which code &> /dev/null; then
        echo "Saving Visual Studio Code extensions..."
        code --list-extensions > "$DOTFILES_DIR/vscode/extensions"
    else
        echo "Visual Studio Code doesn't exist, can't save extensions"
    fi
}
vscode_install() {
EXISTING_EXTENSIONS=(`code --list-extensions | tr '\n' ' '`)
EXISTING_EXTENSIONS=${EXISTING_EXTENSIONS:-()}

if (! array_contains EXISTING_EXTENSIONS "Shan.code-settings-sync"); then
    run "code --install-extension Shan.code-settings-sync"
fi
  
}

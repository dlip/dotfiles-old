# TODO: test this on linux
gitextensions_install() {
    if ! which gitextensions2 &> /dev/null; then
        run "curl -L https://github.com/gitextensions/gitextensions/releases/download/v2.51/GitExtensions-2.51-Mono.zip > /tmp/GitExtensions-2.51-Mono.zip"
        run "sudo rm -fr /usr/local/opt/GitExtensions && sudo unzip /tmp/GitExtensions-2.51-Mono.zip -d /usr/local/opt && sudo echo 'mono /usr/local/opt/GitExtensions/GitExtensions.exe' > /usr/local/bin/gitextensions && sudo chmod +x /usr/local/bin/gitextensions"
    fi
}

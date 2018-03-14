proxy_enable() {
    if [ -e $HOME/.proxy_enable ]; then
        export NO_PROXY=$BASH_IT_NO_PROXY
        export ALL_PROXY=$BASH_IT_HTTP_PROXY
        export HTTP_PROXY=$BASH_IT_HTTP_PROXY
        export HTTPS_PROXY=$BASH_IT_HTTPS_PROXY

        export no_proxy=$BASH_IT_NO_PROXY
        export all_proxy=$BASH_IT_HTTP_PROXY
        export http_proxy=$BASH_IT_HTTP_PROXY
        export https_proxy=$BASH_IT_HTTPS_PROXY
    else
        bash-it enable plugin proxy
        enable-proxy
        if [ "$(uname)" = "Darwin" ]; then
            networksetup -switchtolocation "Automatic"
        fi
        touch $HOME/.proxy_enable
    fi
}

proxy_disable() {
    rm -f $HOME/.proxy_enable
    disable-proxy
    if [ "$(uname)" = "Darwin" ]; then
        networksetup -switchtolocation "noproxy"
    fi
}
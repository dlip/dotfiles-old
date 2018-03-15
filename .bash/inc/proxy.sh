proxy_print() {
    echo http_proxy=$http_proxy;
    echo https_proxy=$https_proxy;
    echo noproxy=$no_proxy
}

proxy_enable() {
    export NO_PROXY=$BASH_IT_NO_PROXY
    export ALL_PROXY=$BASH_IT_HTTP_PROXY
    export HTTP_PROXY=$BASH_IT_HTTP_PROXY
    export HTTPS_PROXY=$BASH_IT_HTTPS_PROXY

    export no_proxy=$BASH_IT_NO_PROXY
    export all_proxy=$BASH_IT_HTTP_PROXY
    export http_proxy=$BASH_IT_HTTP_PROXY
    export https_proxy=$BASH_IT_HTTPS_PROXY

    if [ ! -e $HOME/.proxy_enable ]; then
        if [ -n "$BASH_VERSION" ]; then
            bash-it enable plugin proxy
            enable-proxy
        fi
        if [ "$(uname)" = "Darwin" ]; then
            networksetup -switchtolocation "Automatic" > /dev/null
        fi
        touch $HOME/.proxy_enable
    fi
}

proxy_disable() {
    rm -f $HOME/.proxy_enable
    unset NO_PROXY ALL_PROXY HTTP_PROXY HTTPS_PROXY no_proxy all_proxy http_proxy https_proxy
    if [ -n "$BASH_VERSION" ]; then
        disable-proxy
    fi
    if [ "$(uname)" = "Darwin" ]; then
        networksetup -switchtolocation "No Proxy" > /dev/null
    fi
}
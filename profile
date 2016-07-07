# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin


# Dircolors
eval `dircolors ~/.dircolors`

# Proxy
# http://www.jianshu.com/p/411a60f415a5
# above port number is invalid. Test later.  
# Lantern proxy
# http://127.0.0.1:8787
# https://wiki.archlinux.org/index.php/Proxy_settings

# 这里写你购买的地址
PROXY_1=xxxxxx.xxx.xxx:xxx
PROXY_2=xxxxxx.xxx.xxx:xxx
PROXY_3=xxxxxx.xxx.xxx:xxx
LANTERN=127.0.0.1:8787
# 这里填打开终端默认的代理，我这里用的是LANTERN
defp=$LANTERN


# No Proxy
function noproxy
{
    unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY ftp_proxy FTP_PROXY dns_proxy DNS_PROXY JAVA_OPTS GRADLE_OPTS MAVEN_OPTS
    echo "clear proxy done"
}


function setproxy
{
    export http_proxy=http://127.0.0.1:8787/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export HTTP_PROXY=$http_proxy
export all_proxy=$http_proxy
export ALL_PROXY=$http_proxy
export ftp_proxy=$http_proxy
export FTP_PROXY=$http_proxy
export dns_proxy=$http_proxy
export DNS_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export export JAVA_OPTS="-Dhttp.proxyHost=$HOST -Dhttp.proxyPort=$PORT -Dhttps.proxyHost=$HOST -Dhttps.proxyPort=$PORT"
export GRADLE_OPTS="-Dgradle.user.home=$HOME/.gradle"
export MAVEN_OPTS=$JAVA_OPTS
    echo "current proxy is ${http_proxy}"
}


setproxy

# anaconda
export PATH=/home/hustlion/anaconda2/bin:$PATH


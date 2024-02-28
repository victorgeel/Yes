#!/bin/bash
#############################
#psiphon installer
###########################
#modified By V@G
#########################
#openwrt tools
#######################
echo ""
echo -e "\033[1;33mUpdating packages\033[1;37m"
echo ""
sleep 1
pkg update
echo ""
echo -e "\033[1;33mInstalling requirements\033[1;37m"
echo ""
sleep 1
pkg install screen unzip wget redsocks
clear
echo ""
echo -e "\033[1;33mDownloading tools\033[1;37m"
echo ""
sleep 1
wget https://github.com/victorgeel/Termux-Psiphon-/raw/main/psiphon-pro-go.zip
echo ""
echo -e "\033[1;33mCreating Directory\033[1;37m"
echo ""
sleep 1
mkdir ~/yes
echo ""
echo -e "\033[1;33mExtracting tools\033[1;37m"
echo ""
sleep 1
unzip psiphon-pro-go.zip -d ~/yes
echo ""
echo -e "\033[1;33mcreating simple usage script\033[1;37m"
echo ""
sleep 1
cat > /data/data/com.termux/files/home/yes << EOF
#psiphon simple running script
#jakues
 start() {
        a=$(ls /usr/sbin | grep redsocks)
        b=$(ls /usr/sbin/ | grep screen)
        c="/home/yes/brainfuck-psiphon-pro-go"
        cd ~/yes
        clear
        echo -e "\033[1;35mpsiphon-pro-go\033[1;37m \033[1;32mez Running\033[1;37m"
        echo -e "\033[1;34m================================\033[1;37m"
        sleep 1
        if [ ! -z $a ] || [ ! -z $b ]; then
        echo -e "\033[1;36mChecking Compatible Package... \033[1;32m(OK)\033[1;37m"
        sleep 1
        if [ -f $c ] ; then
        echo -e "\033[1;36mChecking Psiphon Tunnel Core... \033[1;32m(OK)\033[1;37m"
        sleep 1
        else
        echo -e "\033[1;31mPlease check the compatible file\033[1;37m"
        sleep 1
        exit
        fi
        fi
        screen -d -m -L ./brainfuck-psiphon-pro-go
        sleep 3
        if cat screenlog.0 | grep Connected; then
        exit 1;
        else
        echo -e "\033[1;33mTunnel\033[1;37m \033[1;31mConnecting\033[1;37m"
        sleep 3
        if cat screenlog.0 | grep Connected; then
        exit 1;
        fi
        fi
        echo -e "\033[1;33mTunnel\033[1;37m \033[1;32mConnected\033[1;37m"
        sleep 1
        echo -e "\033[1;34m================================\033[1;37m"
        echo -e "\033[1;35mpsiphon-pro-go\033[1;37m \033[1;33mrunning on background\033[1;37m"
        sleep 1
}

 stop() {
        clear
        cd ~/yes
        echo -e "\033[1;31mStop\033[1;37m \033[1;33mProcess\033[1;37m \033[1;35mpsiphon-pro-go\033[1;37m \033[1;33m.....\033[1;37m"
        sleep 1
        echo -e "\033[1;34m================================\033[1;37m"
        echo -e "\033[1;33mKilling process ..."
        sleep 1
        killall screen brainfuck-psiphon-pro-go psiphon-tunnel-core redsocks > /dev/null 2>&1
        echo -e "Remove cache ..."
        sleep 1
        rm ~/yes/screenlog.0 > /dev/null 2>&1
        rm ~/yes/redsocks.log > /dev/null 2>&1
        echo -e "Restart Firewall ...\033[1;37m"
        sleep 1
        echo -e "\033[1;34m================================\033[1;37m"
        echo -e "\033[1;32mDone\033[1;37m"
}

 log() {
        log="screenlog.0"
        clear && cd
        if [ -e "$log" ]; then
        cat ~/$log
        elif [ -f /yes/screenlog.0 ]; then
        cat ~/$log
        else
        echo -e "\033[1;31mlog file not exist\033[1;37m"
        fi
}

 help() {
        echo -e "\033[1;32myes start\033[1;37m        : \033[1;36mstart the \033[1;35mpsiphon-pro-go\033[1;37m \033[1;36mservice\033[1;37m"
        echo -e "\033[1;32myes restart\033[1;37m      : \033[1;36mrestart \033[1;35mpsiphon-pro-go\033[1;37m \033[1;37m \033[1;36mservice\033[1;37m"
        echo -e "\033[1;32myes stop\033[1;37m : \033[1;36mstop \033[1;35mpsiphon-pro-go\033[1;37m \033[1;36mservice\033[1;37m"
        echo -e "\033[1;32myes log\033[1;37m  : \033[1;36mshow magic\033[1;37m"
}

case $1 in
 "start")
 start
;;
 "stop")
 stop
;;
 "log")
 log
;;
 "restart")
 stop
 start
;;
 *)
clear
help
;;
esac
EOF
echo ""
echo -e "\033[1;33mChanging Permission\033[1;37m"
echo ""
sleep 1
chmod +x *
echo ""
echo -e "\033[1;33mRemoving file cache\033[1;37m"
echo ""
rm -rf ~/psiphon-pro-go.zip
yes
echo -e "\033[1;33mInstalling Psiphon Done\033[1;37m"
rm -rf ~/install.sh

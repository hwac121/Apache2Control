#!/bin/bash

#=================================
#            FUNCTIONS
#=================================

Splash(){
echo -e "\e[33m  ____ ____   ____    __ __ __   ___\e[0m";
sleep 0.05
echo -e "\e[33m /    |    \ /    |  /  ]  |  | /  _]\e[0m";
sleep 0.05
echo -e "\e[33m|  o  |  o  )  o  | /  /|  |  |/  [_\e[0m";
sleep 0.05
echo -e "\e[33m|     |   _/|     |/  / |  _  |    _]\e[0m";
sleep 0.05
echo -e "\e[33m|  _  |  |  |  _  /   \_|  |  |   [_\e[0m";
sleep 0.05
echo -e "\e[33m|  |  |  |  |  |  \     |  |  |     |\e[0m";
sleep 0.05
echo -e "\e[33m|__|__|__|_ |__|__|\____|__|__|_____| _\e[0m";
sleep 0.05
echo -e "\e[33m   /  ]/   \|    \|      |    \ /   \| |\e[0m";
sleep 0.05
echo -e "\e[33m  /  /|     |  _  |      |  D  )     | |\e[0m";
sleep 0.05
echo -e "\e[33m /  / |  O  |  |  |_|  |_|    /|  O  | |___\e[0m";
sleep 0.05
echo -e "\e[33m/   \_|     |  |  | |  | |    \|     |     |\e[0m";
sleep 0.05
echo -e "\e[33m\     |     |  |  | |  | |  .  \     |     |\e[0m";
sleep 0.05
echo -e "\e[33m \____|\___/|__|__| |__| |__|\_|\___/|_____|\e[0m";
sleep 0.05
echo " "
}

#=================================
#         CHECK FOR ROOT
#=================================

if [ "$EUID" -ne 0 ]
  then echo -e "You must run as root or sudo myweb";
  exit
fi

#=================================
#            MAIN MENU
#=================================

options=("Start Apache2" "Restart Apache2" "Stop Apache2" "Check Status" "Check Port 80" "Kill Process" "Check Errors" "Quit")

PS3='Choose option for Apache2: '
while [ "$menu" != 1 ]; do
clear
Splash
select opt in "${options[@]}" ; do
	case $opt in
	"Start Apache2")
		service apache2 start
		sleep 2
		clear
		Splash
	break
	;;
	"Restart Apache2")
		service apache2 restart
		sleep 2
		clear
		Splash
	break
	;;
	"Stop Apache2")
		service apache2 stop
		sleep 2
		clear
		Splash
	break
	;;
	"Check Status")
		echo -e "\e[33mUse q to close results\e[0m";
		service apache2 status
		clear
		Splash
	break
	;;
	"Check Port 80")
		clear
		Splash
		netstat -tulpn | grep :80
		sleep 4
	break
	;;
	"Kill Process")
		echo -e "Enter PID to kill"
		read kpid
		kill $kpid
		clear
		Splash
	break
	;;
	"Check Errors")
		echo -e "Use q to close results";
		journalctl -xe
		clear
		Splash
	break
	;;
	 "Quit")
		clear
		Splash
		echo -e " "
		echo -e "\e[37mThank you for using Apache2 Manager by hwac121\e[0m";
		sleep 3
		clear
		menu=1
	break
	;;
#============================================================================================$
#========                        ERROR CAPTURE - INVALID OPTION                          ====$
#============================================================================================$
*)
		clear
		Splash
		echo -e "invalid option $REPLY";
		Clear
		Splash
	break
	;;
	esac
        done
done

exit 0


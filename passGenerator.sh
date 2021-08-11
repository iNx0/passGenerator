#!/bin/bash

#------------------------------------------------------------
#----------------------------color---------------------------
nocolor="\033[0m"
blue="\033[0;34m"
cyan="\033[0;36m"
red="\033[0;31m"
purple="\033[0;35m"
brown_Orange="\033[0;33m"
green="\033[0;32m"
yellow="\033[0;33m"
DF="\e[39m"
#--------------------------------------------------------------
#--------------------------------------------------------------

cat << "EOF"

     .--------.
    / .------. \
   / /        \ \
   | |        | |
  _| |________| |_
.' |_|        |_| '.
'._____ ____ _____.'
|     .'____'.     |
'.__.'.'    '.'.__.'
'.__  | iNx0 |  __.'
|   '.'.____.'.'   |
'.____'.____.'____.'LGB
'.________________.'
EOF
echo -e "--------------------------------
|------${blue}\e[1mBy: NadimAlzahrani${nocolor}------|
|-------${blue}\e[1mTwitter: iQwix_${nocolor}--------|
--------------------------------"
x=0

  while [ $x == 0 ]
    do
              echo -e "${red} =============================================${nocolor}"
              echo -e "${red}\e[1m||        Methods of password generating     ||${nocolor}"
              echo -e "${red} =============================================${nocolor}"
              echo -e "${yellow}\e[1m[1]${nocolor}" "\e[1mFirst Method"
              echo -e "${yellow}\e[1m[2]${nocolor}" "\e[1mSecond Method"
              echo -e "${yellow}\e[1m[3]${nocolor}" "\e[1mThird Method"
              echo -e "${red}=============================================${nocolor}"
              echo -e "${red}---------------------------------------------${nocolor}"
              echo -e "${yellow}\e[1m(Choose one of the methods by typing the number of method)${nocolor}"
              echo -e "\e[1m"
              read -p  "Method Number ##> " method

              #---------------------------------Functions-------------------------------------#
              #-------------------------------------------------------------------------------#

                        function passLengthBanner {
                          echo -e "${green} =============================================${nocolor}"
                          echo -e "\e[1m${green}||            ${yellow}\e[1mPassword Length                ${green}||${nocolor}"            
                          echo -e "${green} =============================================${nocolor}"
                          echo -e "${cyan}\e[1m[0] --> Back to the main menu${nocolor}"
                          echo -e "\e[1m"
                          read -p  "Enter password Length ##> " passLength

                        }


                      function method1 {
                        funName="method1"
                        echo -e ""
                        echo -e "${yellow}\e[1mYour password is :${red}\e[1m"
                        echo -e ""
                        passMeth1=$(openssl rand -base64 48 | cut -c-$passLength)
                        echo $passMeth1
                        sleep 1
                      }

                      function method2 {
                        funName="method2"
                        echo -e ""
                        echo -e "${yellow}\e[1mYour password is :${red}\e[1m"
                        echo -e ""
                        passMeth2=$(date +%s | sha256sum | base64 | head -c $passLength)
                        echo $passMeth2
                        sleep 1
                      }

                      function method3 {
                        funName="method3"
                        echo -e ""
                        echo -e "${yellow}\e[1mYour password is :${red}\e[1m"
                        echo -e ""
                        passMeth3=$(strings /dev/urandom | grep -o '[[:alnum:]]' | head -n $passLength | tr -d '\n')
                        echo $passMeth3
                        sleep 1
                      }


                      function savingPass {
                        x=101
                        while [ $x == 101 ]
                          do
                            echo -e "${cyan}\e[1m"
                            read -p "Do you want to save your password in file? : " answer
                            fixAnswer=$(tr '[:upper:]' '[:lower:]' <<<"$answer")
                            case $fixAnswer in 
                              "")
                                echo -e "${red}\e[1m[Error]: ${nocolor}\e[1mNo answer"
                                echo -e "${yellow}\e[1m[Please type \"Yes\" or \"No\"]${nocolor}"
                                sleep 2
                                x=101
                                ;;
                              "yes")
                                if [ $funName == "method1" ];then
                                  [ -f myPasswords.txt ] && echo $passMeth1 >> myPasswords.txt || touch myPasswords.txt | echo $passMeth1 >> myPasswords.txt
                                elif [ $funName == "method2" ];then
                                  [ -f myPasswords.txt ] && echo $passMeth2 >> myPasswords.txt || touch myPasswords.txt | echo $passMeth2 >> myPasswords.txt
                                elif [ $funName == "method3" ];then
                                  [ -f myPasswords.txt ] && echo $passMeth3 >> myPasswords.txt || touch myPasswords.txt | echo $passMeth3 >> myPasswords.txt
                                fi
                                x=102
                                ;;
                              "no")
                                echo ""
                                cat << "EOF"   
 __   ___     __        ___  ___               __      ___            __      
|__) |__     /__`  /\  |__  |__      /\  |\ | |  \    |__  |\ |    | /  \ \ / 
|__) |___    .__/ /~~\ |    |___    /~~\ | \| |__/    |___ | \| \__/ \__/  |                                                                               
EOF
                                echo ""
                                x=103
                                ;; 
                            esac
                          done

                      }


              #--------------Verification of entrance value [Number of Method]---------------#
              #------------------------------------------------------------------------------#
              case $method in 
                "")
                  echo -e "${red}\e[1m[Error]: ${nocolor}No method has been selected"
                  echo -e "${yellow}\e[1m[Please choose one of the methods]${nocolor}"
                  sleep 2
                  x=0
                  ;;
                "1")
                  x=1
                  while [ $x == 1 ]
                    do
                      passLengthBanner
                      if [ -z $passLength ];then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Password length hasn't been entered"
                                  echo -e "${yellow}\e[1m[Please enter password length]${nocolor}"
                                  sleep 2
                                  x=1
                            elif [ $passLength == 0 ];then
                                x=0
                            elif [[ "$passLength" !=  +([0-9]) && "$passLength" != +([0-9]).+([0-9]) ]]; then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Not allowed to enter text"
                                  echo -e "${yellow}\e[1m[Please enter password length --> ${red}\e[1mNumbers only${yellow}\e[1m]${nocolor}"
                                  sleep 2
                                  x=1  
                            else
                                  x=$(($x+10))
                                  method1
                                  savingPass
                             fi
                    done        
                  ;; 
                "2")
                  x=2
                  while [ $x == 2 ]
                    do
                      passLengthBanner
                      if [ -z $passLength ];then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Password length hasn't been entered"
                                  echo -e "${yellow}\e[1m[Please enter password length]${nocolor}"
                                  sleep 2
                                  x=2
                            elif [ $passLength == 0 ];then
                                x=0
                            elif [[ "$passLength" !=  +([0-9]) && "$passLength" != +([0-9]).+([0-9]) ]]; then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Not allowed to enter text"
                                  echo -e "${yellow}\e[1m[Please enter password length --> ${red}\e[1mNumbers only${yellow}\e[1m]${nocolor}"
                                  sleep 2
                                  x=2  
                            else
                                  x=$(($x+10))
                                  method2
                                  savingPass
                             fi
                    done
                  ;;
                "3")
                  x=3
                  while [ $x == 3 ]
                    do
                      passLengthBanner
                      if [ -z $passLength ];then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Password length hasn't been entered"
                                  echo -e "${yellow}\e[1m[Please enter password length]${nocolor}"
                                  sleep 2
                                  x=3
                            elif [ $passLength == 0 ];then
                                x=0
                            elif [[ "$passLength" !=  +([0-9]) && "$passLength" != +([0-9]).+([0-9]) ]]; then
                                  echo -e "${red}\e[1m[Error]: ${nocolor}Not allowed to enter text"
                                  echo -e "${yellow}\e[1m[Please enter password length --> ${red}\e[1mNumbers only${yellow}\e[1m]${nocolor}"
                                  sleep 2
                                  x=3  
                            else
                                  x=$(($x+10))
                                  method2
                                  savingPass
                             fi
                    done
                  ;;
              esac
             
  done




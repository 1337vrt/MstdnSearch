#!/bin/bash

banner()
{
printf "\033[1m\033[94m"
printf "o     o          o       8       .oPYo.                            8      \n"
printf "8b   d8          8       8       8                                 8      \n"
printf "8\`b d'8 .oPYo.  o8P .oPYo8 odYo. \`Yooo. .oPYo. .oPYo. oPYo. .oPYo. 8oPYo. \n"
printf "8 \`o' 8 Yb..     8  8    8 8' \`8     \`8 8oooo8 .oooo8 8  \`' 8    ' 8    8 \n"
printf "8     8   'Yb.   8  8    8 8   8      8 8.     8    8 8     8    . 8    8 \n"
printf "8     8 \`YooP'   8  \`YooP' 8   8 \`YooP' \`Yooo' \`YooP8 8     \`YooP' 8    8 \n"
printf "..::::..:.....:::..::.....:..::..:.....::.....::.....:..:::::.....:..:::..\n"
printf "::::::::::::: @1337vrt :::::::::::::::::::::: ver 1.1 ::::::::::::::::::::\n\n\033[0m"
}

check_user()
{
 g=$(curl --max-time 8 -A 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36' -s -o /dev/null -w '%{http_code}' https://$1/$2)
 if [[ "$g" == "200" ]];then 
    printf "\033[01m{\033[32mFOUND\033[0m\033[01m}[200] https://$1/$2\n"
 fi
}

main()
{
    file="/usr/share/mstdnsearch/instances/$1"
    while read -r line; do
        check_user "$line" "$2"
    done <$file
}

if [ ${1:0:1} != "@" ];then
    username="@"$1
else
    username=$1
fi
#===============
clear
banner
if [[ $1 == '' ]];then
    printf "\033[01m{\033[31mEXIT\033[0m\033[01m} \033[41mUsername not provided. (command: mstdnsearch username_here)\033[0m\n"
    exit
fi
printf "\033[01m{\033[93mUSERNAME\033[0m\033[01m} $1\n"
printf "\033[01m{\033[36mINFO\033[0m\033[01m} Starting 4 Threads...\n\n"
main '1.txt' $username &
thread1=${!}
main '2.txt' $username &
thread2=${!}
main '3.txt' $username &
thread3=${!}
main '4.txt' $username &
thread4=${!}
wait ${thread1}
printf "\033[01m{\033[36mINFO\033[0m\033[01m} Thread 1 Finished\n"
wait ${thread2}
printf "\033[01m{\033[36mINFO\033[0m\033[01m} Thread 2 Finished\n"
wait ${thread3}
printf "\033[01m{\033[36mINFO\033[0m\033[01m} Thread 3 Finished\n"
wait ${thread4}
printf "\033[01m{\033[36mINFO\033[0m\033[01m} Thread 4 Finished\n"
printf "\n\033[01m{\033[36mINFO\033[0m\033[01m} Finished , scanned 100 Mastodon instances\n"
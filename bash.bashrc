command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
clear
cyan='\033[1;36m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
purple='\033[1;35m'
reset='\033[0m'
echo -e "$red"
echo -e "$cyan       _______"
echo -e "$blue     _/       \_"
echo -e "$yellow    / |       | \ "
echo -e "$red   /  |__   __|  \ "
echo -e "$cyan  |__/((o| |o))\__|"
echo -e "$blue  |      | |      |"
echo -e "$yellow  |\     |_|     /|"
echo -e "$red  | \           / |"
echo -e "$cyan   \| /  ___  \ |/ "
echo -e "$blue    \ | / _ \ | / "
echo -e "$yellow     \_________/"
echo -e "$red      _|_____|_"
echo -e "$blue      Sk-script by "                                    
echo -e "$cyan  ____  __  __  _  _   ____    ____  _   _"
echo -e "$blue / ___)(  )(  )( \/ ) / __ \  /  __)( )_( )"
echo -e "$purple \___ \ )(__)(  \  / / (__) \ \__  \[ ]_[ ]"
echo -e "$yellow (____/(______) (__)(__)  (__)(____/(_) (_)"
echo -e "$reset"
echo -e "$red Please enter password:"
read -sp 'Password:' pass 
if [ $pass = 'suyash' ] ; then
echo -e "$green Pass Successful"
echo -e "$reset"
else
pkg install cmatrix
cmatrix
fi

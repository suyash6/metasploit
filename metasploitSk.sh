#!/data/data/com.termux/files/usr/bin/bash
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
echo -e "$purple \___ \ )(__)(  \  / / (__) \ \__  \ ) _ ("
echo -e "$yellow (____/(______) (__)(__)  (__)(____/(_) (_)"
echo -e "$red Important: Please Enter your name"
read quy
cd $HOME
cd ..
cd usr/etc
rm bash.bashrc
cd $HOME
cd metasploit
cp bash.bashrc /data/data/com.termux/files/usr/etc
echo -e "$purple WAIT keep Pateince............" 
apt install -y autoconf bison clang coreutils axel curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar postgresql termux-elf-cleaner
apt update && apt upgrade
echo -e "$blue Downloading + Processing....."

# Remove Old Tars
find $HOME -name "*.16.tar.gz" -type f

# Remove Old Folders
find $HOME -name "metasploit*" -type d

cd $HOME
axel --alternate https://github.com/rapid7/metasploit-framework/archive/4.16.16.tar.gz
tar -xf $HOME/metasploit-framework-4.16.16.tar.gz
mv $HOME/metasploit-framework-4.16.16 $HOME/metasploit-framework
rm $HOME/metasploit-framework-4.16.16.tar.gz
cd $HOME/metasploit-framework
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec
gem install bundler
sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock
# Many phones are claiming libxml2 not found error
ln -sf $PREFIX/include/libxml2/libxml $PREFIX/include/

gem install nokogiri -v 1.8.0 -- --use-system-libraries
 
#sed 's|grpc (.*|grpc (1.4.1)|g' -i $HOME/metasploit-framework/Gemfile.lock
#gem unpack grpc -v 1.4.1
#cd grpc-1.4.1
#curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
#curl -L https://raw.githubusercontent.com/Hax4us/Hax4us.github.io/master/extconf.patch
#patch -p1 < extconf.patch
#gem build grpc.gemspec
#gem install grpc-1.4.1.gem
#cd ..
#rm -r grpc-1.4.1


cd $HOME/metasploit-framework
bundle install -j5
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
rm ./modules/auxiliary/gather/http_pdf_authors.rb
if [ -e $PREFIX/bin/msfconsole ];then
	rm $PREFIX/bin/msfconsole
fi
if [ -e $PREFIX/bin/msfvenom ];then
	rm $PREFIX/bin/msfvenom
fi
ln -sf $HOME/metasploit-framework/msfconsole /data/data/com.termux/files/usr/bin/
ln -sf $HOME/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/
termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.4.0/gems/pg-0.20.0/lib/pg_ext.so
echo -e "$cyan Editing Files"

cd $HOME/metasploit-framework/config
curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/database.yml

mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

pg_ctl -D $PREFIX/var/lib/postgresql start
createuser msf
createdb msf_database

echo -e "$yellow Thanks to Vishalbaswani for making the Base Script"
echo "$red $quy Subscribe to my channel SKY & SK tech"
echo -e "$cyan $quy NOW YOU CAN LAUNCH METASPLOIT BY JUST EXECUTE THE COMMAND :: msfconsole"
echo -e "$green ________________DONE________________"
echo -e "$cyan Script from Suyash Khandare"
echo -e "reset"
#!/bin/sh
#
# Ubuntu's java installer
# for terminaless people

install(){
(
sudo apt-add-repository ppa:linuxuprising/java -y; sleep 5
echo 35
echo oracle-java14-installer shared/accept-oracle-license-v1-2 select true | sudo /usr/bin/debconf-set-selections && \
	sudo apt install oracle-java14-installer \
	--no-install-recommends -y; sleep 5
echo 75
sudo apt install oracle-java14-set-default -y; sleep 5
echo 100
) | 
	zenity --progress \
	--title="Progress" \
	--text="Oracle java 14 installer from linuxuprising repository" \
	--percentage=0 \
	--auto-close \
	--auto-kill

exit 0
}

TEXT="$(java --version)"

if [ "$TEXT" ];
then
	zenity --info \
		--title "Oracle Java 14" \
	 	--text "java already installed" \
		--width 300
	exit 0
else
	zenity --title "Oracle Java 14" --password | install
	zenity --info \
		--title "Oracle Java 14 Installed" \
		--width 300 \
		--text $TEXT
fi


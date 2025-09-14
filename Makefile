all: upgrade install ohmyzsh config dmenu chsh

upgrade:
	sudo sh -c 'echo "cedric ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/cedric && chmod 0440 /etc/sudoers.d/cedric'
	sudo apt-get -y -qq update
	sudo apt-get -y -qq full-upgrade

install:
	sudo apt-get -y -qq install sudo vim git make fzf build-essential cmake ninja-build trash-cli gcc silversearcher-ag nnn zsh ripgrep
	sudo apt-get -y -qq install aptitude universal-ctags curl wget tmux gettext unzip p7zip-full rsync fd-find bat tree btop locales-all npm nodejs
	sudo apt-get -y -qq install greetd sway swaylock i3blocks feh dex dunst caja flameshot alacritty numlockx xwayland vim-gtk3 swayosd
	sudo apt-get -y -qq install moc pulseaudio pavucontrol gimp firefox-esr firefox-esr-l10n-fr evince zathura okular pdftk imagemagick eog qimgv surf
	sudo apt-get -y -qq install fonts-hack-otf fonts-hack-ttf fonts-hack-web fonts-hack fonts-liberation2 fonts-liberation fonts-font-awesome fonts-terminus-otb fonts-agave
	sudo apt-get -y -qq install fonts-noto-color-emoji fonts-noto-core fonts-noto-extra fonts-noto-hinted fonts-noto-mono fonts-noto-ui-core
	sudo apt-get -y -qq purge xdg-desktop-portal xdg-desktop-portal-gtk
	sudo apt-get -y autoremove

ohmyzsh:
	sudo apt-get -y -qq install zsh
	rm -fr ~/.oh-my-zsh 2> /dev/null
	wget -q "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
	chmod +x ./install.sh
	./install.sh --unattended
	rm -fr ./install.sh
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

config:
	cp -fr .w ~/
	cp -fr .vimrc ~/
	cp -fr .zshrc ~/
	cp -fr .profile ~/
	cp -fr .gitconfig ~/
	cp -fr .alacritty.toml ~/
	cp -fr .config ~/
	cp -fr .moc ~/
	cp -fr .fonts ~/
	fc-cache -r
	sudo cp -fr .greetd/config.toml /etc/greetd/config.toml

dmenu:
	sudo apt-get -y -qq install libreadline-dev libx11-dev libxinerama-dev libxft-dev
	sudo make -C .dmenu clean install
	sudo make -C .dmenu clean

chsh:
	chsh -s /bin/zsh

locales:
	sudo dpkg-reconfigure locales

keyb:
	sudo dpkg-reconfigure keyboard-configuration



.SILENT:

all: upgrade install sway fonts ohmyzsh config

upgrade:
	echo "\n.......... Update and upgrade"
	sudo sh -c 'echo "cedric ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/cedric && chmod 0440 /etc/sudoers.d/cedric'
	sudo cp -fr .install/sources.list /etc/apt/
	sudo apt -q=5 update
	sudo apt -q=5 full-upgrade
	sudo apt -q=5 autoremove
	sudo apt -q=5 autoclean
	sudo apt -q=5 purge

install:
	echo "\n.......... Install base"
	sudo apt -q=5 install git make build-essential cmake ninja-build nnn vim vim-gtk3 lsd ripgrep aptitude nala universal-ctags nala
	sudo apt -q=5 install curl wget tmux gettext unzip p7zip-full rsync fd-find bat tree btop locales-all gcc silversearcher-ag jq suckless-tools
	sudo apt -q=5 install mpd mpc moc pulseaudio pavucontrol fzf trash-cli
	sudo apt -q=5 autoremove
	sudo apt -q=5 autoclean
	sudo apt -q=5 purge

sway:
	echo "\n.......... Install sway"
	sudo apt -q=5 install sway greetd dex i3blocks dunst xwayland kitty swaylock caja x11-utils libreadline-dev libx11-dev libxinerama-dev libxft-dev numlockx xdotool
	sudo cp -fr .install/greetd.config.toml /etc/greetd/config.toml
	# sudo apt -y -qq install greetd xorg xinit dex i3 i3blocks i3status feh suckless-tools dunst 
	# sudo apt -y -gg caja flameshot 
	sudo apt -q=5 autoremove
	sudo apt -q=5 autoclean
	sudo apt -q=5 purge

fonts:
	echo "\n.......... Install fonts"
	sudo apt -q=5 install 'fonts-hac*' 'fonts-libe*' fonts-font-awesome fonts-terminus-otb fonts-agave 'fonts-ibm*' 
	sudo apt -q=5 install fonts-noto-color-emoji fonts-noto-core fonts-noto-extra fonts-noto-hinted fonts-noto-mono fonts-noto-ui-core
	sudo apt -q=5 autoremove
	sudo apt -q=5 autoclean
	sudo apt -q=5 purge

ohmyzsh:
	echo "\n.......... Install Oh-my-zsh"
	sudo apt -q=5 install zsh nala
	nala --install-completion zsh
	rm -fr ~/.oh-my-zsh 2> /dev/null
	wget -q "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
	chmod +x ./install.sh
	./install.sh --unattended
	rm -fr ./install.sh
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	cp -fr .zshrc ~/
	cp -fr .install/avit.zsh-theme ~/.oh-my-zsh/themes/
	echo "\n.......... Change Shell to zsh"
	chsh -s /bin/zsh

config:
	echo "\n>>> Copy .zshrc, .vimrc and friends to ~/"
	cp -fr .w ~/
	cp -fr .vimrc ~/
	cp -fr .zshrc ~/
	cp -fr .moc ~/
	cp -fr .latexmkrc ~/
	cp -fr .config ~/
	sudo cp -fr bin/* /usr/bin/
	cp -fr .fonts ~/
	fc-cache -r

suckless:
	echo "\n.......... Install st and friends"
	sudo make -C dev clean install --silent
	sudo make -C dev clean --silent

locales:
	sudo dpkg-reconfigure locales

keyb:
	sudo dpkg-reconfigure keyboard-configuration

packages:
	echo "\n.......... Install some packages"
	sudo apt -y -qq install gimp firefox-esr firefox-esr-l10n-fr texlive-full evince zathura okular pdftk imagemagick eog qimgv

.SILENT:

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brews=(
	bash-completion
	mysql
	youtube-dl
	node
	git
	speedtest-cli
)

casks=(
	sequel-pro
	postman
	vlc
	atom
	qbittorrent
	slack
	google-chrome
	skype
	webstorm
)

git config --global alias.lol log --oneline --graph --decorate --all
git config --global alias.st status
git config --global alias.com checkout master
cp .gitignore_global ~/
git config --global core.excludesfile ~/.gitignore_global

brew tap caskroom/cask
brew tap caskroom/versions

for i in “${brews[@]}”
do
	:
	brew install $i
done

for i in “${casks[@]}”
do
	:
	brew cask install $i
done

brew cleanup
brew cask cleanup

sudo easy_install pip
sudo pip install virtualenv

brew services start mysql

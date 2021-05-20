cd ~/tmp

wget -iq "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb

echo GOOD

sudo apt install ./discord.deb --fix-broken -y
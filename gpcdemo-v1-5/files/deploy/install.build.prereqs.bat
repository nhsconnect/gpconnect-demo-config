REM Switch to using https instead of git to work around firewall
git config --global url."https://github.com/".insteadOf git@github.com:
git config --global url."https://".insteadOf git://

set "PATH=%PATH%;C:\Program Files\nodejs"
echo PATH is: %PATH%


rem cd webapp & npm install -g npm@4.5.0 & npm install -g grunt-cli bower & bower install & bower update & npm update & grunt build
cd webapp & bower install & bower update & npm update & grunt build
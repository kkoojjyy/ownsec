#!/usr/bin/bash

#1i
. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/risent/dns2tcp.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp
GITCONFDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent
EXECUTEABLE1=dns2tcp
EXECUTEABLE2=dns2tcp
#ph1b
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/dns2tcp
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/dns2tcp
DSKTPFL=dns2tcp.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/dns2tcp
#ph1a

echo "${bold}
 ____  _   _ ____ ____ _____ ____ ____  
|  _ \| \ | / ___|___ \_   _/ ___|  _ \ 
| | | |  \| \___ \ __) || || |   | |_) |
| |_| | |\  |___) / __/ | || |___|  __/ 
|____/|_| \_|____/_____||_| \____|_|    
              
UPDATE                               
${normal}"

GITUPTODATE
if git checkout $BRANCH &&
git fetch origin $BRANCH &&
[ `git rev-list HEAD...origin/$BRANCH --count` != 0 ] &&
git merge origin/$BRANCH
then
    
GITCLONEFUNC
GITRESET
GITSBMDLINIT
go build

CHMODXEX1

SYMLINKEX2TO1

#333d
CPDESKTFL

echo "${bold}
UPDATED
${normal}"

else

echo "${bold}
UP TO DATE
${normal}"
	
fi

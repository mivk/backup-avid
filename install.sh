#!/bin/bash

## Install script for https://github.com/mivk/backup-avid

## Create ~/bin dir and add it to path
mkdir -p $HOME/bin
echo $PATH | grep -q ~/bin || { echo "export PATH=\$PATH:~/bin" >> ~/.profile; export PATH=$PATH:~/bin; }

## Get files
cd bin
for f in backup-avid{,.conf}; do curl -LJOR https://github.com/mivk/backup-avid/raw/master/$f && echo OK; done
chmod +x backup-avid

## Or (if xcode installed or accepting prompt to install)
## cd bin
## git clone https://github.com/mivk/backup-avid
## mv backup-avid backup-avid-git
## cp -p backup-avid ./

## Save password for rsync server
read -ep "Password for remote rsync server:"
echo "$REPLY" > ~/backup-avid.p
chmod 600 ~/backup-avid.p

## Open configuration in editor
nano backup-avid.conf


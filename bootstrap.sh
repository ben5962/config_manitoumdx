#!/usr/bin/env bash


LINE=$(echo "deb http://manitou-mail.org/apt/" $(lsb_release -cs) "main")
FILE=/etc/apt/sources.list.d/manitou.list
grep -q "$LINE" "$FILE" || sudo sh -c "$LINE" >> "$FILE"

#sudo sh -c 'echo "deb http://manitou-mail.org/apt/" $(lsb_release -cs) "main" > /etc/apt/sources.list.d/manitou.list'
wget http://manitou-mail.org/download/5D414B77.asc
sudo apt-key add 5D414B77.asc
sudo apt-get update
sudo apt-get install -y postgresql
sudo "manitou-mdx	manitou-mdx/install-db	boolean true" | debconf-set-selections
sudo apt-get install -y manitou-mdx    # for the mail-database exchanger
sudo apt-get install -y manitou-ui


LISTE_MAILS = ~/liste-mails
CONF = /etc/mails_plannings-mdx.conf
git clone https://github.com/ben5962/mails_plannings.git
cd mails_plannings
find . -type f -name *.eml > $LISTE_MAILS
sudo manitou-mgr --create-database --db-name=mails_plannings
sudo cat < FIN >> $CONF
[common]
db_connect_string = Dbi:Pg:dbname=mails_plannings;user=manitou

update_runtime_info = no
update_addresses_last = no
apply_filters = no
index_words = no

preferred_datetime = sender
FIN
time manitou-mdx --import-list = $LISTE_MAILS  --conf = $CONF
psql -d enron -U manitou -c "select count(*) from mail;"



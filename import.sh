#!/usr/bin/env bash
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
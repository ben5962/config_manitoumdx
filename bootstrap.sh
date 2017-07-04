#!/usr/bin/env bash


# LINE=$(echo "deb http://manitou-mail.org/apt/" $(lsb_release -cs) "main")
# FILE=/etc/apt/sources.list.d/manitou.list
# grep -q "$LINE" "$FILE" || sudo sh -c "$LINE" >> "$FILE"

#sudo sh -c 'echo "deb http://manitou-mail.org/apt/" $(lsb_release -cs) "main" > /etc/apt/sources.list.d/manitou.list'
# wget http://manitou-mail.org/download/5D414B77.asc
# sudo apt-key add 5D414B77.asc
# sudo apt-get update
# sudo apt-get install -y postgresql
# sudo echo "manitou-mdx	manitou-mdx/install-db	boolean true" | debconf-set-selections
# sudo apt-get install -y manitou-mdx    # for the mail-database exchanger
# sudo apt-get install -y manitou-ui

# sudo apt-get install -y git
# LISTE_MAILS=/home/vagrant/liste-mails
# CONF="/etc/mails_plannings-mdx.conf"
# PLANNINGS="/home/vagrant/mails_plannings"
# sudo touch $LISTE_MAILS
# [[ -d "$PLANNINGS" ]] || git clone https://github.com/ben5962/mails_plannings.git
## [[ -d "$PLANNINGS" ]] && echo "existe" && sudo find "$PLANNINGS" -type f -name "*.eml" -printf '%f\n' | sudo tee $LISTE_MAILS
# [[ -d "$PLANNINGS" ]] && echo "existe" && sudo find "$PLANNINGS" -type f -name "*.eml" | sudo tee $LISTE_MAILS

# sudo -u postgres manitou-mgr --create-database --db-name=mails_plannings

# if [ ! -d  "$CONF" ]; then
# sudo cat << FIN >> "$CONF"
# [common]
# db_connect_string = Dbi:Pg:dbname=mails_plannings;user=manitou;password=manitou;host=127.0.0.1;

# update_runtime_info = no
# update_addresses_last = no
# apply_filters = no
# index_words = no

# preferred_datetime = sender
# FIN
# fi

#time sudo -u postgres manitou-mdx --import-list "$LISTE_MAILS"  --conf "$CONF"
# creer un utilisateur manitou avec un mdp manitou pouvant creer des db
# creer un acces extérieur à tt le monde pour la db (mouais la supprimer) dans pg_dba 
# creer un listen(*) dans pg_conf (mouais la supprimer)
sudo -u postgres psql -d mails_plannings -c "select count(*) from mail;"



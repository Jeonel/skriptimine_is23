#!/bin/bash
#
# mysql-server paigaldusskript
#
# Kontrollime, mitu korda mysql-server on korralikult paigaldatud
# Sõnad on leitud ja vastus salvestatakse muutujasse:



# Kui MYSQL muutuja väärtus võrdub 0-ga
    sudo apt install mysql
    sudo apt install gnupg -y
    wget -q http://repo.mysql.com/mysql-apt-config_0.8.15-1_all.deb
    sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb
    sudo apt update

if [ $MYSQL -eq 0 ]; then
    # Siis ok installed ei ole leitud
    # ja väljastame vastava teate ning
    # paigaldame teenuse
    echo "Paigaldame mysql ja vajalikud lisad"
    sudo apt install mysql-server
    echo "mysql on paigaldatud"
    # Lisame võimaluse kasutada mysql käsku ilma kasutaja ja parooli lisamiseta
    touch $HOME/.my.cnf # lisame vajaliku konfiguratsioonifaili antud kasutaja kodukausta
    echo "[client]" >> $HOME/.my.cnf
    echo "host=localhost" >> $HOME/.my.cnf
    echo "user=root" >> $HOME/.my.cnf
    echo "password=qwerty" >> $HOME/.my.cnf

# Kui MYSQL muutuja väärtus võrdub 1-ga
elif [ $MYSQL -eq 1 ]; then
    # Siis ok installed on leitud 1 kord
    # ja teenus on juba paigaldatud
    echo "mysql-server on juba paigaldatud"
    # Kontrollime olemasolu
    mysql
fi

# Skripti lõpp

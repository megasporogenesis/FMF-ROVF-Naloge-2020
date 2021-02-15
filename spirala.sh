#!/usr/bin/env bash

#RAOR vaja 1
#W. Brooks

#spirala.sh

#Touch ustvari datoteko "spirala.dat" v določem direktoriju če le-ta ne obstaja
#Če obstaja ga zbriše, nato "echo" vpiše ime vsake vrstice in koordinate izhod-
#išča.
touch spirala.dat
echo "i x_i y_i" > spirala.dat
echo "0 0 0" > spirala.dat

#Pomembne spremenljivke so v naprej definirane. Koda je v celoti napisana v ang-
#ležčini, ker mi mešanje jezikov v programiranju gre na živce.
N=1000
current_pos_x=0
current_pos_y=0
current_l=0
target_dist=1 #št. korakov, preden se smer spremeni

for ((i=0; i<=$N; i++)); do

  mod_target=$(( $target_dist % 4 ))

  #Ta skupina if-elif stavkov določi, v katero smer se bo spirala nadaljevala v
  #danem koraku glede na ostanek pri deljenju "target_dist" z 4
  if (($mod_target == 0)); then
    current_pos_x=$(( $current_pos_x + 1 ))

  elif (($mod_target == 1)); then
    current_pos_y=$(( $current_pos_y + 1 ))

  elif (($mod_target == 2)); then
    current_pos_x=$(( $current_pos_x - 1 ))

  elif (($mod_target == 3)); then
    current_pos_y=$(( $current_pos_y - 1 ))

  fi

  #Naslednji del kode preveri, če se bo smer spremenila.
  current_l=$(( $current_l + 1 ))

  if (($current_l == $target_dist)); then
    current_l=0
    target_dist=$(( $target_dist + 1 ))

  fi


  #Zadnja vrsta nam vrže trenutno pozicijo in i v datoteko, ki smo jo prej ust-
  #varili.
  echo "$i $current_pos_x $current_pos_y" >> spirala.dat


done

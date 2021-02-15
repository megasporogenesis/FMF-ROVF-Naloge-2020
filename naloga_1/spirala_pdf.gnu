#RAOR vaja 1
#W. Brooks

#Prvi plot
set terminal png
set output "spirala_xy.png"
set xlabel 'x_i'
set ylabel 'y_i'

plot "spirala.dat" u 2:3 t 'Prikaz spirale' w l


#Drugi plot tudi ima terminal nastavljen kot ".png" datoteka, ker je prišlo do
#korrupcije datoteke ko sem uporabil "set terminal pdf". Končna datoteka je še
#vedno v .pdf formatu.
set terminal pdf
set out "spirala_r_2.pdf"
set xlabel 'i'
set ylabel 'oddaljenost'
set log xy

razdalje(x,y) = sqrt((x ** 2) + (y ** 2))

plot "spirala.dat" u 1:(x=$2, y=$3, razdalje(x,y)) t 'Oddaljenost od izhodišča' w l,\
    "spirala.dat" u 1:(sqrt($1)) t 'Koren iz i' w l

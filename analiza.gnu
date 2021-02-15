#W. Brooks
#RAOR naloga 1

#analiza.gnu


#Iz istega razloga kot pri prejšni nalogi, je terminal nastavljen na png, končna
#datoteka je pa .pdf.
set term png
set out "analiza.pdf"
set xlabel "U[V]"
set ylabel "I[A]"

I_model(x) = A_0 * exp((-(x - a_0) ** 2)/(2 * sigma_0 ** 2)) + A_1 * exp((-(x - a_1) ** 2)/(2 * sigma_1 ** 2))

fit I_model(x) "meritve.dat" u 1:2 via A_0,A_1,a_0,a_1,sigma_0,sigma_1
plot "meritve.dat" t "Meritve" w p, I_model(x) w l

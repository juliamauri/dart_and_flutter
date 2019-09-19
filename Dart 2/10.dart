//tenint un txt amb: 9 4 10 11 13 -5 -2 -3 0 1 9 100 200 1000
import 'dart:io';
//que fa?
var seq = (x) => File(x).readAsStringSync().split(' ').map((s) => int.parse(s));
//Es una funció anònima
//Se le passa el string del archivo al metodo (actuaria como variable x).
//Detecat los numeros por las separaciones y los mete en una lista.
//Itera todos los elemetos y hace un parse para passar de string a int.
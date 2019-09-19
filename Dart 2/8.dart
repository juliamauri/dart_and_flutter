void main(){
  List cosas1 = ['hi', null, true, 7];
  List cosas2 = cosas1;
  cosas1.add("otra cosa");
  print(cosas2); 

  //cosas 1 y 2 son referencias al objeto que estan tratando.
  //Entonces si añadimos a la lista de la primera referencia des de la seunda accede al mismo objeto.
}
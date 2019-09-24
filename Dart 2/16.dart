mutiplyBy(int by){

  var f = (int to){
    return by*to;
  };

  return f;
}

void main(){
  var lista = [1, 2, 3, 4, 5];
  print(lista.map(mutiplyBy(2)));
}
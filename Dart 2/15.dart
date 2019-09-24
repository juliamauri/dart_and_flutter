makeCounter2(int initNum, int sumNum){
  int counter = 0;
  var f = (){
    if(counter == 0)
      return counter = initNum;
    else
      return counter += sumNum;
  };

  return f;
}

void main(){
  var c = makeCounter2(5, 3);

  print(c());
  print(c());
  print(c());
}
void main(){
  String abc = 'a,b,c';
  print(addPointToCome(abc));
}

String addPointToCome(String to){
  List<String> getLetters = to.split(',');
  return getLetters.join(';');
}
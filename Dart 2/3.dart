void main(){
  String toSplit = 'hola';
  print(splitWord(toSplit));
}

List<String> splitWord(String toS){
  List<String> ret = List<String>();
  for(int letter = 0; letter < toS.length; letter++){
    ret.add(toS.substring(letter, letter +1 ));
  }
  return ret;
}
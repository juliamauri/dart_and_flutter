void main(){
  int toCount = 34;
  print(count(toCount));
}

List<int> count(int toC){
  List<int> ret = List<int>();
  for(int c = 1; c < toC + 1; c++){
    ret.add(c);
  }
  return ret;
}
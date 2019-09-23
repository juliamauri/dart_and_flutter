void main(){
  List<dynamic> initList = [0, 'L', null, 'H', 'E', 'L', 'L', 'O', 'o', 9, 9, 2, 1, null, null, 2, 2, 5,5, 3];
  print(initList);

  print(uniq(initList));
}

List<dynamic> uniq(List<dynamic> toUniq){
  List<dynamic> ret = List<dynamic>();

  int index = -1;
  var lastValue = null;
  for(var x in toUniq){
    if(index != -1) {
      if(lastValue == x)
        continue;
    }
    ret.add(x);
    index++;
    lastValue = x;
  }
  return ret;
}
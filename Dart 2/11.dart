//determina la sortida de
void main(){
  bool b;
  List x = ['a', 'b', 'c'];
  print([
    10, 11,
    if(b == null) 12,
    for(var c in x) '[$c]',
    100, 200, 300
    //10, 11, 12, [a], [b], [c], 100, 200, 300
  ].map((x) => x.toString()).join(':'));
  //output: 10:11:12:[a]:[b]:[c]:100:200:300
}
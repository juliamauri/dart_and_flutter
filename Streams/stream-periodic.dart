main(){
  var stream = Stream.periodic(Duration(seconds: 1), (i) => i);
  stream.listen(print);
}
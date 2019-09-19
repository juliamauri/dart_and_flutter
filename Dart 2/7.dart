import 'dart:io';

void main(){
  var file = File('6.csv');
  var content = file.readAsStringSync();

  List<String> lines = content.split('\n');
  print('Tota lines: ${lines.length}');
}
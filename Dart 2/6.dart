import 'dart:io';

void main(){
  var file = File('6.csv');
  var content = file.readAsStringSync();
  print(content);
  List<String> lines = content.split('\n');
  print(lines);
  String ret = '';
  for(var line in lines)
  {
    int indexcoma = line.indexOf(',');
    int sum = int.parse(line.substring(0, indexcoma)) + 10;
    line.replaceRange(0, indexcoma, sum.toString());
    print(line);
    ret += line + '\n';
  }
  print(ret);
  file.writeAsStringSync(ret);
}
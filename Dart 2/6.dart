import 'dart:io';

void main(){
  var file = File('6.csv');
  var content = file.readAsStringSync();
  print(content);
  List<String> lines = content.split('\n');
  print(lines.length.toString());

  //print(lines); //Prints the list bad

  String ret = '';
  int linenum = 0;
  for(var line in lines)
  {
    if(line.isNotEmpty)
    {
      int indexcoma = line.indexOf(',');
      print('Line: $linenum and indexcoma: $indexcoma');
      if(indexcoma != -1) {
        //o fer un split de les comes i despres o ajuntem amb .join
        int sum = int.parse(line.substring(0, indexcoma)) + 10;
        print(sum.toString());
        ret += sum.toString() + line.substring(indexcoma, line.length);
        if(linenum != lines.length - 1)
          ret += '\n';
      }
      linenum++;
    }
  }
  print(ret);
  file.writeAsStringSync(ret);
}
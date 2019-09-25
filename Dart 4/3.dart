import 'dart:io';

abstract class Formatter {
  File _file;
  IOSink _sink;

  Formatter(String filename) {
    _file = File(filename);
    _sink = _file.openWrite();
  }
  write(String text) => _sink.write(text);

  String get prefix => '';
  String get suffix => '\n';
  String get separator => ', ';

  void writeItem(int num);

  void print(List<int> numList) {
    if (numList == null) {
      return;
    }
    write(prefix);
    for (int i = 0; i < numList.length; i++) {
      if (i > 0) write(separator);
      writeItem(numList[i]);
    }
    write(suffix);
  }
}

class LineFormatter extends Formatter {
  LineFormatter(String filename) : super(filename);
  writeItem(int num) => write('$num');
  String get separator => '\n';
}

class DelimitedFormatter extends Formatter {
  String _open, _close;
  DelimitedFormatter(String filename, this._open, this._close) 
  : super(filename);

  String get prefix => _open;
  String get suffix => _close;
  writeItem(int num) => write('$num');
}

class BracketFormatter extends DelimitedFormatter {
  BracketFormatter(String filename) : super(filename, '[', ']\n');
}

class ParenFormatter extends DelimitedFormatter {
  ParenFormatter(String filename) : super(filename, '(', ')\n');
}

void main() {
  var formatters = [
    BracketFormatter('3Bracket.txt'),
    LineFormatter('3Line.txt'),
    ParenFormatter('3Paren.txt'),
  ];
  final list = [1, 2, 3, 4, 5];
  for (var f in formatters) {
    f.print(list);
  }
}
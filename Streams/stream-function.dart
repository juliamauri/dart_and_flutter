import 'dart:io';

Stream<String> desgrana(String text) async*{
  for(int i = 0; i < text.length; i++){
    yield text[i];
    await Future.delayed(Duration(milliseconds: (text[i] == '\n' ? 500:80)));
  }
}

main(){
  desgrana("You programmed me\nprofessor.").listen((ch) {
    stdout.write(ch);
  });
}
import 'package:flutter/material.dart';
import 'ChooseColorScreen.dart';
import 'ColorMatchScreen.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/' : (context) => ColorMatchScreen(),
        '/choose' : (context) => ChooseColorScreen(),
      },
    );
  }
}
import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Semaphore'),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 200,
            height: 400,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Circulo(Colors.red),
                Circulo(Colors.yellow),
                Circulo(Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Circulo extends StatelessWidget {
  Circulo(
    this.color, {
    Key key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      foregroundDecoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
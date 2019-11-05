import 'package:flutter/material.dart';

class ColumnSemaphoreScreen extends StatelessWidget {
  const ColumnSemaphoreScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semaphore'),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 160,
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
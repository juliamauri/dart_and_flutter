import 'package:flutter/material.dart';

class ColumnBandsScreen extends StatelessWidget {
  const ColumnBandsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semaphore'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Banda(2, Colors.pinkAccent, '20%'),
          Banda(3, Colors.purple[300], '30%'),
          Banda(5, Colors.blue, '50%'),
        ],
      ),
    );
  }
}

class Banda extends StatelessWidget {
  Banda(
    this.flex,
    this.backgroundColor,
    this.text, {
    Key key,
  }) : super(key: key);

  final int flex;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.center,
        color: backgroundColor,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
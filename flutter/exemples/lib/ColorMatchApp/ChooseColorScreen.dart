import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChooseColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorMatch'),
      ),
      body: GridView.count(
        crossAxisCount: 6,
        children: <Widget>[
          for (int i = 0; i < 6 * 8; i++)
            BoxColor()
        ],
      ),
    );
  }
}

class BoxColor extends StatelessWidget {
  BoxColor({
    Key key,
  }) : super(key: key);

  final Color c = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: c,
      ),
      onTap: () {
        Navigator.of(context).pop(c);
      },
    );
  }
}

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
          title: Text('Numbers'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.yellow,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for(num i = 1; i<7;i++) CircleNumber(i)
            ],
          ),
        ),
      ),
    );
  }
}

class CircleNumber extends StatelessWidget {
  CircleNumber(this.number, {
    Key key
  }) : super(key: key)
  {
    num res = this.number % 3;
    if( res == 0){
      this.nColor = Colors.green;
    }
    else if(res == 2){
      this.nColor = Colors.blue;
    }
    else
      this.nColor = Colors.red;
  }

  final num number;
  Color nColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: nColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
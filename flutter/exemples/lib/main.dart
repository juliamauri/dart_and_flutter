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
          title: Text('Giorno'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Execute: Its a prank.dio',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.redAccent,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.battery_alert),
          onPressed: () {
            print("Has apretat el botó OwO");
          },
        ),
      ),
    );
  }
}

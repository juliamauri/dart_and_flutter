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
          title: Text('Hola'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(color: Colors.red),
              flex: 4,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.green,
              padding: EdgeInsets.all(10),
              child: Text(
                'hola saludos',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Yanone Kaffeesatz',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Image.asset(
                  'assets/zawarudo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

/*
class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Aplicació
      home: Scaffold(
        //Pantalla
        appBar: AppBar(
          title: Text('Giorno'),
        ),
        body: Center(
          child: Container(
            width: 250,
            height: 180,
            //color: Colors.blue[100],
            padding: EdgeInsets.fromLTRB(10, 20, 5, 27),
            child: Text(
              'Execute: Its a prank.dio',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.yellow,
                backgroundColor: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(
                color: Colors.brown,
                width: 3,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  color: Colors.grey,
                  blurRadius: 8,
                ),
              ],
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
*/

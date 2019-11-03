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
          title: Text('Tags'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 60,
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Tag("rock"),
                Tag("jazz"),
                Tag("classical"),
                Tag("hip-hop")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag(
    this.tagName, {
    Key key,
  }) : super(key: key);

  final String tagName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Text(
        tagName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
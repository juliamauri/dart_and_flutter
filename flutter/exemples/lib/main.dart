import 'package:flutter/material.dart';
import 'CounterListApp/CounterString.dart';

void main() {
  runApp(App());
}

List<Counter> GetCounters() {
  List<Counter> ret = List<Counter>();
  ret.add(Counter('lo peta'));
  ret.add(Counter('chachi'));
  ret.add(Counter('acuyunant'));
  ret.add(Counter('lo flipas'));
  ret.add(Counter('òstia'));
  ret.add(Counter('brutal'));
  ret.add(Counter('que te queigs'));
  return ret;
}

class App extends StatelessWidget {
  App({
    Key key,
  }) : super(key: key);

  final List<Counter> _counters = GetCounters();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CounterListScreen(_counters));
  }
}

class CounterListScreen extends StatefulWidget {
  const CounterListScreen(
    this._counters, {
    Key key,
  }) : super(key: key);

  final List<Counter> _counters;

  @override
  _CounterListScreenState createState() => _CounterListScreenState();
}

class _CounterListScreenState extends State<CounterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Reset Counters?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Reset'),
                            onPressed: () {
                              setState(() {
                                for (Counter c in widget._counters) c.times = 0;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("Return"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => NewCounterScreen(),
              ),
            )
                .then((newCounter) {
              if (newCounter != null) {
                setState(() {
                  widget._counters.add(newCounter);
                });
              }
            });
          },
        ),
        body: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            for (int i = 0; i < widget._counters.length; i++)
              Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[300])),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget._counters[i].times += 1;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        widget._counters[i].times -= 1;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              widget._counters[i].times.toString(),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4)),
                            border: Border.all(color: Colors.grey[300]),
                            color: Colors.blue[200].withOpacity(0.4),
                          ),
                          child: Center(child: Text(widget._counters[i].name)),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}

class NewCounterScreen extends StatefulWidget {
  const NewCounterScreen({
    Key key,
  }) : super(key: key);

  @override
  _NewCounterScreenState createState() => _NewCounterScreenState();
}

class _NewCounterScreenState extends State<NewCounterScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Counter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            RaisedButton(
              child: Text("Save"),
              onPressed: () {
                if (_controller.text.isNotEmpty)
                  Navigator.of(context).pop((Counter(_controller.text)));
              },
            )
          ],
        ),
      ),
    );
  }
}

/* Text Aligment 

        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('abcde'),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '12345',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              RaisedButton(
                child: Text(button),
              ),
            ],
          ),
        ),
        */

/*    Row/Colum TextFont and Images

          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text('Saludos'),
                  color: Colors.red,
                ),
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
                    fontSize: 10,
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
          */

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

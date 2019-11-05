import 'package:flutter/material.dart';
import 'CounterString.dart';

List<Counter> getCounters() {
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

class CounterListScreen extends StatefulWidget {
  const CounterListScreen( {
    Key key,
  }) : super(key: key);

  @override
  _CounterListScreenState createState() => _CounterListScreenState();
}

class _CounterListScreenState extends State<CounterListScreen> {
  List<Counter> _counters;

  @override
  void initState() {
    _counters = getCounters();
    super.initState();
  }

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
                                for (Counter c in _counters) c.times = 0;
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
                  _counters.add(newCounter);
                });
              }
            });
          },
        ),
        body: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            for (int i = 0; i < _counters.length; i++)
              Container(
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey[300])),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _counters[i].times += 1;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        _counters[i].times -= 1;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              _counters[i].times.toString(),
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
                          child: Center(child: Text(_counters[i].name)),
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
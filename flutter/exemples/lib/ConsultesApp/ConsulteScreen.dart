import 'package:flutter/material.dart';
import 'EscollirHorarisScreen.dart';
import 'horari.dart';

class ConsultesScreen extends StatefulWidget {
  ConsultesScreen({
    Key key,
  }) : super(key: key);

  @override
  _ConsultesScreenState createState() => _ConsultesScreenState();
}

class _ConsultesScreenState extends State<ConsultesScreen> {
  List<Horari> _horaris = GetHorariDisponible();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultes'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 75,
            color: Colors.blue[200],
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Horari escollit',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  RaisedButton(
                    color: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Canviar'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) =>
                                  EscollirHorarisScreen(_horaris)))
                          .then((newHours) {
                        if (newHours != null) {
                          setState(() {
                            _horaris = newHours;
                          });
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          for (int i = 0; i < _horaris.length; i++)
            Column(
              children: <Widget>[
                ListTile(
                  title: Text(_horaris[i].toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(
                        () {
                          _horaris.removeAt(i);
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
        ],
      ),
    );
  }
}
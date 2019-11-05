import 'package:flutter/material.dart';
import 'horari.dart';

class EscollirHorarisScreen extends StatefulWidget {
  const EscollirHorarisScreen(
    this._horaristoEdit, {
    Key key,
  }) : super(key: key);

  final List<Horari> _horaristoEdit;

  @override
  _EscollirHorarisScreenState createState() => _EscollirHorarisScreenState();
}

class _EscollirHorarisScreenState extends State<EscollirHorarisScreen> {
  ScrollController _controller;
  Map<Horari, bool> _allHoraris;
  List<Horari> _returnHoraris;

  @override
  void initState() {
    _controller = ScrollController();
    _returnHoraris = List<Horari>();
    _allHoraris = Map<Horari, bool>();
    for (Horari h in totsElsHoraris) {
      _allHoraris[h] = false;
    }

    for (int i = 0; i < widget._horaristoEdit.length; i++) {
      for (Horari h in totsElsHoraris) {
        if (h.dia == widget._horaristoEdit[i].dia &&
            h.hora == widget._horaristoEdit[i].hora) {
          _allHoraris[h] = true;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escull un horari...'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              for(int i = 0; i < totsElsHoraris.length; i++){
                if(_allHoraris[totsElsHoraris[i]]){
                  _returnHoraris.add(totsElsHoraris[i]);
                }
              }
              Navigator.of(context).pop(_returnHoraris);
            },
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemCount: totsElsHoraris.length,
        itemBuilder: (context, index) => Column(
              children: <Widget>[
                ListTile(
                  leading: Checkbox(
                    value: _allHoraris[totsElsHoraris[index]],
                    onChanged: (vH) {
                      setState(() {
                        _allHoraris[totsElsHoraris[index]] = vH;
                      });
                    },
                  ),
                  title: Text(totsElsHoraris[index].toString()),
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
      ),
    );
  }
}
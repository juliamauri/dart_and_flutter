import 'package:flutter/material.dart';
import 'Song.dart';

class SongEditScreen extends StatefulWidget {
  @override
  _SongEditScreenState createState() => _SongEditScreenState();
}

class _SongEditScreenState extends State<SongEditScreen> {
  Song _editingSong;
  List<TextEditingController> _controllers;

  @override
  void initState() {
    _editingSong = Song("None", "None", 2000);
    List<String> tEdit = [
      _editingSong.name,
      _editingSong.band,
      _editingSong.year.toString()
    ];
    _controllers = List<TextEditingController>();
    for (int i = 0; i < 3; i++) {
      TextEditingController c = TextEditingController();
      c.text = tEdit[i];
      _controllers.add(c);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _editingSong = ModalRoute.of(context).settings.arguments;
    if (_editingSong != null) {
      List<String> tEdit = [
        _editingSong.name,
        _editingSong.band,
        _editingSong.year.toString()
      ];
      for (int i = 0; i < 3; i++) _controllers[i].text = tEdit[i];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SongList'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Input(title: 'Name', controller: _controllers[0]),
            Input(title: 'Band', controller: _controllers[1]),
            Input(title: 'Year', controller: _controllers[2], isNum: true),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(Song(_controllers[0].text,
                        _controllers[1].text, int.parse(_controllers[2].text)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required String title,
    @required TextEditingController controller,
    bool isNum = false,
  })  : _title = title,
        _controller = controller,
        _isNum = isNum,
        super(key: key);

  final String _title;
  final TextEditingController _controller;
  final bool _isNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_title),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType:
                      (_isNum ? TextInputType.number : TextInputType.text),
                ),
              ),
              if (_isNum)
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    _controller.text =
                        (int.parse(_controller.text) + 1).toString();
                  },
                ),
              if (_isNum)
                IconButton(
                  icon: const Icon(Icons.do_not_disturb_on),
                  onPressed: () {
                    _controller.text =
                        (int.parse(_controller.text) - 1).toString();
                  },
                )
            ],
          )
        ],
      ),
    );
  }
}

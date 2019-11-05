import 'package:flutter/material.dart';

class ColorMatchScreen extends StatefulWidget {
  @override
  _ColorMatchScreenState createState() => _ColorMatchScreenState();
}

class _ColorMatchScreenState extends State<ColorMatchScreen> {
  TextEditingController _controller;

  String displayingText;
  bool boldText;
  Color textColor;
  Color bgColor;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = displayingText = 'SampleText';
    boldText = true;
    textColor = Colors.blue[900];
    bgColor = Colors.yellow[100];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ColorMatch'),
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            DisplayText(
                bgColor: bgColor,
                displayingText: displayingText,
                textColor: textColor,
                boldText: boldText),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RaisedButton(
                        child: Text('SET'),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              displayingText = _controller.text;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: boldText,
                        onChanged: (bold) {
                          setState(() {
                            boldText = bold;
                          });
                        },
                      ),
                      Text('Bold Text'),
                    ],
                  ),
                  ColorInput('TEXT COLOR', this,
                      colorEdit: textColor, bg: false),
                  ColorInput('BG COLOR', this, colorEdit: bgColor, bg: true),
                ],
              ),
            )
          ],
        ));
  }
}

class ColorInput extends StatelessWidget {
  const ColorInput(
    this.title,
    this.parent, {
    Key key,
    @required this.colorEdit,
    this.bg,
  }) : super(key: key);

  final String title;
  final Color colorEdit;
  final _ColorMatchScreenState parent;
  final bool bg;

  String toHex(Color c, {bool leadingHashSign = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${c.alpha.toRadixString(16)}'
      '${c.red.toRadixString(16)}'
      '${c.green.toRadixString(16)}'
      '${c.blue.toRadixString(16)}';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(toHex(colorEdit)),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              child: Text(title),
              onPressed: () {
                Navigator.of(context).pushNamed('/CM/C').then((newColor) {
                  if (newColor != null) {
                    parent.setState(() {
                      if (bg) {
                        parent.bgColor = newColor;
                      } else {
                        parent.textColor = newColor;
                      }
                    });
                  }
                });
              },
            ),
          ),
        )
      ],
    );
  }
}

class DisplayText extends StatelessWidget {
  const DisplayText({
    Key key,
    @required this.bgColor,
    @required this.displayingText,
    @required this.textColor,
    @required this.boldText,
  }) : super(key: key);

  final Color bgColor;
  final String displayingText;
  final Color textColor;
  final bool boldText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: bgColor,
      child: Center(
        child: Text(
          displayingText,
          style: TextStyle(
            color: textColor,
            fontSize: 42,
            fontWeight: (boldText ? FontWeight.w700 : FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

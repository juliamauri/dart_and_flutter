import 'package:flutter/material.dart';

class AddIngredientScreen extends StatefulWidget {
  @override
  _AddIngredientScreenState createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
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
        title: Text('Recipe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nuevo Ingrediente',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    cursorColor: Colors.pink,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'AÑADIR',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              onPressed: (){
                FocusScope.of(context).unfocus(); //Close the keyboard because cause rendering error returning at main screen
                Navigator.of(context).pop((_controller.text.isEmpty ? null : _controller.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Recipe.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 20,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PrincipalTitle(title: recipe.name),
            Minutes(minutes: recipe.minutes),
            Divider(color: Colors.grey),
            SecoondaryTitle("Preparación"),
            Description(description: recipe.description),
            Divider(color: Colors.grey),
            SecoondaryTitle("Ingredientes"),
            Ingredients(recipe.ingredients),
          ],
        ),
      ),
    );
  }
}

class Ingredients extends StatefulWidget {
  Ingredients(this._ingredients) {
    _lines = _ingredients.join('\n');
  }
  final List<String> _ingredients;
  String _lines = '';

  @override
  State<StatefulWidget> createState() => _Ingredients();
}

class _Ingredients extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              widget._lines,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                child: Text(
                  "AÑADIR INGREDIENT",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                color: Colors.grey[350],
                onPressed: () {
                  Navigator.of(context).pushNamed('/add').then((newIngredient) {
                    if (newIngredient != null) {
                      setState(() {
                        widget._ingredients.add(newIngredient);
                        widget._lines = widget._ingredients.join('\n');
                      });
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
        description,
        textAlign: TextAlign.justify,
      ),
      SizedBox(height: 20,)
      ],
    );
  }
}

class PrincipalTitle extends StatelessWidget {
  const PrincipalTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class Minutes extends StatelessWidget {
  const Minutes({
    Key key,
    @required this.minutes,
  }) : super(key: key);

  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
        minutes.toString() + " minutes",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 10,)
      ],
    );
  }
}

class SecoondaryTitle extends StatelessWidget {
  const SecoondaryTitle(
    this.sTitle, {
    Key key,
  }) : super(key: key);

  final String sTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
        sTitle,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 10,)
      ],
    );
  }
}

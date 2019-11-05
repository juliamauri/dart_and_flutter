import 'package:flutter/material.dart';
import 'Recipe.dart';

Recipe getTortillaDePatata() {
  Recipe ret = Recipe();
  ret.name = 'Tortilla de Patata';
  ret.minutes = 45;
  ret.description =
      'Corta las patatas (y opcionalmente, cebolla), fríelas suavemente durante 25-30 minutos. Bate los huevos. Añade sal a tu gusto. Mezcla las patatas y los huevos batidos y deja reposar almenos 2 horas. Frie la mezcla dejando que cuaje y dando la vuelta con un plato o una tapa.';
  ret.addIngredient = 'Patatas';
  ret.addIngredient = 'Huevos';
  return ret;
}

class RecipeScreen extends StatelessWidget {
   RecipeScreen({
    Key key,
  }) : super(key: key);

  final Recipe recipe = getTortillaDePatata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
      ),
      resizeToAvoidBottomPadding: false,
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
  Ingredients(this._ingredients);
  final List<String> _ingredients;

  @override
  State<StatefulWidget> createState() => _Ingredients();
}

class _Ingredients extends State<Ingredients> {

  List<String> _ingredients;
  String _lines;

  @override
  void initState() {
    _ingredients = List<String>();
    _ingredients.addAll(widget._ingredients);
    _lines = _ingredients.join('\n');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              _lines,
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
                  Navigator.of(context).pushNamed('/R/A').then((newIngredient) {
                    if (newIngredient != null) {
                      setState(() {
                        _ingredients.add(newIngredient);
                        _lines = _ingredients.join('\n');
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

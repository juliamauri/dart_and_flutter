import 'package:flutter/material.dart';
import 'Recipe.dart';
import 'RecipeScreen.dart';
import 'AddIngredientScreen.dart';
void main() {
  runApp(App());
}

Recipe GetTortillaDePatata() {
  Recipe ret = Recipe();
  ret.name = 'Tortilla de Patata';
  ret.minutes = 45;
  ret.description =
      'Corta las patatas (y opcionalmente, cebolla), fríelas suavemente durante 25-30 minutos. Bate los huevos. Añade sal a tu gusto. Mezcla las patatas y los huevos batidos y deja reposar almenos 2 horas. Frie la mezcla dejando que cuaje y dando la vuelta con un plato o una tapa.';
  ret.addIngredient = 'Patatas';
  ret.addIngredient = 'Huevos';
  return ret;
}

class App extends StatelessWidget {
  App({
    Key key,
  }) : super(key: key);

  final Recipe tortilladepatata = GetTortillaDePatata();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/' : (context) => RecipeScreen(recipe: tortilladepatata),
        '/add' : (context) => AddIngredientScreen(),
      },
    );
  }
}
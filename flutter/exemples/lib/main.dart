import 'package:flutter/material.dart';
import 'RecipeApp/Recipe.dart';
import 'RecipeApp/RecipeScreen.dart';
import 'RecipeApp/AddIngredientScreen.dart';
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

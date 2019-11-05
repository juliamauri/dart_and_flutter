import 'package:flutter/material.dart';
import 'Exercicis_Widgets_Basics/Column-Bands.dart';
import 'Exercicis_Widgets_Basics/Column-Semaphore.dart';
import 'Exercicis_Widgets_Basics/Row-Numbers.dart';
import 'Exercicis_Widgets_Basics/Row-Tags.dart';
import 'RecipeApp/RecipeScreen.dart';
import 'RecipeApp/AddIngredientScreen.dart';
import 'SongListApp/SongListScreen.dart';
import 'SongListApp/SongEditScreen.dart';
import 'ColorMatchApp/ColorMatchScreen.dart';
import 'ColorMatchApp/ChooseColorScreen.dart';
import 'CounterListApp/CounterListScreen.dart';
import 'ConsultesApp/ConsulteScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _sController;

  List<String> _screens;
  List<IconData> _icons;
  List<String> _routes;
  @override
  void initState() {
    _sController = ScrollController();
    _screens = [
      'Column bands',
      'Column Semaphore',
      'Row Numbers',
      'Row Tags',
      'Recipe App',
      'Song List App',
      'Color Match App',
      'Counter List App',
      'Consultes App',
    ];
    _icons = [
      Icons.view_column,
      Icons.more_vert,
      Icons.more_horiz,
      Icons.title,
      Icons.view_agenda,
      Icons.sort,
      Icons.color_lens,
      Icons.computer,
      Icons.calendar_today,
    ];
    _routes = [
      '/L/CB',
      '/L/CS',
      '/L/RN',
      '/L/RT',
      '/R',
      '/S',
      '/CM',
      '/CL',
      '/C',
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/L/CB': (context) => ColumnBandsScreen(),
        '/L/CS': (context) => ColumnSemaphoreScreen(),
        '/L/RN': (context) => RowNumbersScreen(),
        '/L/RT': (context) => RowTagsScreen(),
        '/R' : (context) => RecipeScreen(),
        '/R/A' : (context) => AddIngredientScreen(),
        '/S' : (context) => SongListScreen(),
        '/S/E' : (context) => SongEditScreen(),
        '/CM' : (context) => ColorMatchScreen(),
        '/CM/C' : (context) => ChooseColorScreen(),
        '/CL' : (context) => CounterListScreen(),
        '/C' : (context) => ConsultesScreen(),
      },
      home: Scaffold(
          appBar: AppBar(
            title: Text('All APPS'),
          ),
          body: ListView.separated(
            controller: _sController,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: _screens.length,
            itemBuilder: (context, index) {
              return AppRoute(_screens[index], _icons[index], _routes[index]);
            },
          )),
    );
  }
}

class AppRoute extends StatelessWidget {
  const AppRoute(
    this.title,
    this.iconImg,
    this.route, {
    Key key,
  }) : super(key: key);

  final String title;
  final IconData iconImg;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconImg),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushNamed(route);
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

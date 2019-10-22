import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Book {
  String name;
  String author;
  String description;
  String imageAssets;
  bool impression;
  bool robart;
  bool storybook;
  int stars;

  Book(this.name, this.author, this.description, this.imageAssets, this.impression, this.robart, this.storybook, this.stars);
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  final Book b = Book('Game Engine Architecture', 'by Jason Gregory', 'This book covers both the theory and practice of game engine software development, bringing together complete coverage of a wide range of topics. The concepts and techniques described are the actual ones used by real game studios like Electronic Arts and Naughty Dog. The examples are often grounded in specific technologies, but the discussion extends way beyond any particu ...more', 'assets/GameEngineArchitecture.jpg', false, true, false, 4);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(b.imageAssets),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          StarDisplay(
                            value: b.stars,
                          ),
                          Container(
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        b.name,
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        b.author,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Label(
                            name: 'Impression',
                            color: Colors.grey,
                          ),
                          Label(
                            name: 'Robart',
                            color: Colors.blue[900],
                          ),
                          Label(
                            name: 'Story Book',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        b.description,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: Colors.blue[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Read Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({Key key, this.name, this.color}) : super(key: key);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: color,
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10, right: 10),
    );
  }
}

//https://medium.com/icnh/a-star-rating-widget-for-flutter-41560f82c8cb
class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.orangeAccent,
        );
      }),
    );
  }
}

import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
  bool favorite = false;

  Book(this.name, this.author, this.description, this.imageAssets,
      this.impression, this.robart, this.storybook, this.stars);

  Book.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        author = json["author"],
        description = json["description"],
        imageAssets = json["imageAssets"],
        impression = json["impression"],
        robart = json["robart"],
        storybook = json["storybook"],
        stars = json["stars"];

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
        'description': description,
        'imageAssets': imageAssets,
        'impression': impression,
        'robart': robart,
        'storybook': storybook,
        'stars': stars
      };
}

class MyApp extends StatefulWidget {
  MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _sController;
  List<Book> _books = null;
  List<int> _starred = null;

  bool _showStarred = false;

  @override
  void initState() {
    _sController = ScrollController();
    _loadBooks();
    super.initState();
  }

  Future<void> _loadBooks() async {
    try {
      //Carga de llibres per json
      String filecontentes = await rootBundle.loadString('assets/books.json');
      var json = jsonDecode(filecontentes);
      List<Book> loaded = [];

      for (var elem in json) {
        loaded.add(Book.fromJson(elem));
      }
      super.setState(() {
        _books = loaded;
      });

      //Carga de llibres favorits guardats en sessions anterior, el que carga es un index de la posició
      //del llibre en _books
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/starredBooks.json');
      String filecontentesfavs = await file.readAsStringSync();
      var jsonFavs = jsonDecode(filecontentesfavs);
      List<int> starred = [];
      for (var elem in jsonFavs) {
        starred.add(elem);
        _books[starred.last].favorite = true;
      }
      super.setState(() {
        _starred = starred;
      });
    } catch (e) {
      super.setState(() {
        if (_books == null) _books = [];
        _starred = [];
      });
      print('ERROR: error al llegir els books json');
    }
  }

  Future<void> _writeBooks() async {
    //Guardar la llista de favorits
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/starredBooks.json');
    await file.writeAsString(jsonEncode(_starred));
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeBooks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Books"),
        actions: <Widget>[
          IconButton(
            icon: Icon((_showStarred) ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              super.setState(() {
                _showStarred = !_showStarred;
              });
            },
          )
        ],
      ),
      body: (_books == null && _starred == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              controller: _sController,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: (_showStarred) ? _starred.length : _books.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: IconButton(
                    icon: Icon((_showStarred)
                        ? (_books[_starred[index]].favorite)
                            ? Icons.favorite
                            : Icons.favorite_border
                        : (_books[index].favorite)
                            ? Icons.favorite
                            : Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        if (_showStarred) {
                          if (_books[_starred[index]].favorite =
                              !_books[_starred[index]].favorite) {
                            _starred.add(_starred[index]);
                          } else {
                            _starred.removeAt(index);
                          }
                        } else {
                          if (_books[index].favorite =
                              !_books[index].favorite) {
                            _starred.add(index);
                          } else {
                            _starred.remove(index);
                          }
                        }
                      });
                    }),
                title: InkWell(
                  child: Text(
                    (_showStarred)
                        ? _books[_starred[index]].name
                        : _books[index].name,
                  ),
                  onTap: () {
                    //Enviem l'objecte llibre amb el scaffold de la 1ra tasca.
                    bool was = (_showStarred)
                        ? _books[_starred[index]].favorite
                        : _books[index].favorite;
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => BookScaffold(
                                book: (_showStarred)
                                    ? _books[_starred[index]]
                                    : _books[index])))
                        .then((fav) {
                      if (fav != null) {
                        setState(() {
                          //Apliquem els canvis segons el que arrivi
                          if (was != fav) {
                            if (_showStarred) {
                              if (_books[_starred[index]].favorite = fav) {
                                _starred.add(_starred[index]);
                              } else {
                                _starred.removeAt(index);
                              }
                            } else {
                              if (_books[index].favorite = fav) {
                                _starred.add(index);
                              } else {
                                _starred.remove(index);
                              }
                            }
                          }
                        });
                      }
                    });
                  },
                ),
              ),
            ),
    ));
  }
}

class BookScaffold extends StatelessWidget {
  const BookScaffold({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(book.imageAssets),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(book.favorite);
                    },
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
                          value: book.stars,
                        ),
                        FavouriteBtn(book: book),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      book.name,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      book.author,
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
                          color: (book.impression)
                              ? Colors.blue[900]
                              : Colors.grey,
                        ),
                        Label(
                          name: 'Robart',
                          color: (book.robart) ? Colors.blue[900] : Colors.grey,
                        ),
                        Label(
                          name: 'Story Book',
                          color:
                              (book.storybook) ? Colors.blue[900] : Colors.grey,
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
                      book.description,
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
    );
  }
}

class FavouriteBtn extends StatefulWidget {
  const FavouriteBtn({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  _FavouriteBtnState createState() => _FavouriteBtnState();
}

class _FavouriteBtnState extends State<FavouriteBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
            (widget.book.favorite) ? Icons.favorite : Icons.favorite_border,
            color: Colors.white),
        onPressed: () {
          setState(() {
            widget.book.favorite = !widget.book.favorite;
          });
        },
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[900],
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

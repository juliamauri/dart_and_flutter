import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  ScrollController _sController;
  List<Todo> _todos;

  @override
  void initState() {
    _sController = ScrollController();
    _loadTodos();
    super.initState();
  }

  Future<void> _loadTodos() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/todo.json');
      String filecontentes = await file.readAsStringSync();
      var json = jsonDecode(filecontentes);
      List<Todo> loaded = [];
      for (var elem in json) loaded.add(Todo.fromJson(elem));
      super.setState(() {
        _todos = loaded;
      });
    } catch (e) {
      super.setState(() {
        _todos = [];
      });
      print('ERROR: error al llegir els todos json');
    }
  }

  Future<void> _writeTodos() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/todo.json');
    await file.writeAsString(jsonEncode(_todos));
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _writeTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            TextEditingController _textFieldController =
                TextEditingController();
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: "Add new Todo"),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Add'),
                        onPressed: () {
                          if (_textFieldController.text.isNotEmpty) {
                            setState(() {
                              _todos
                                  .add(Todo(_textFieldController.text, false));
                            });
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      FlatButton(
                        child: Text("Return"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
        ),
        body: (_todos == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                controller: _sController,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: _todos.length,
                itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        setState(() {
                          _todos[index].done = !_todos[index].done;
                        });
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Segur que vols eliminar el todo?'),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text('Remove'),
                                      onPressed: () {
                                        setState(() {
                                          _todos.removeAt(index);
                                          Navigator.of(context).pop();
                                        });
                                      }),
                                  FlatButton(
                                    child: Text("Return"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      child: ListTile(
                        leading: Checkbox(
                          value: _todos[index].done,
                        ),
                        title: Text(
                          _todos[index].what,
                          style: TextStyle(
                            decoration: (_todos[index].done
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
              )));
  }
}

class Todo {
  String what;
  bool done;

  Todo(this.what, this.done);
  Todo.fromJson(Map<String, dynamic> json)
      : what = json["what"],
        done = json["done"];

  Map<String, dynamic> toJson() => {
        'what': what,
        'done': done,
      };
}
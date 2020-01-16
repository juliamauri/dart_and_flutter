import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestió de usuaris',
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ScrollController _sController;
  List<DocumentSnapshot> usersInfo;
  CollectionReference users;
  @override
  void initState() {
    users = Firestore.instance.collection("users");
    _sController = ScrollController();
    usersInfo = List<DocumentSnapshot>();

    //Quan li arriven canvis, fa un setState passant la llista de usuaris provinent de la col·lecció.
    users.snapshots().listen((querySnaps) {
      setState(() {
        usersInfo = querySnaps.documents;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Llistat d'usaris"),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.person_add),
        onPressed: () {
          //Create user
          createUserShowDialog(context, users);
        },
      ),
      body: ListView.separated(
        itemCount: usersInfo.length,
        separatorBuilder: (context, i) => Divider(),
        controller: _sController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          return InkWell(
            //Informació completa de cada usuari
            child: ListTile(
              title: Text(usersInfo[i].data['username']),
              subtitle: Text(usersInfo[i].data['nomComplet']),
              trailing: Text((usersInfo[i].data['admin'])
                  ? 'És administrador'
                  : 'No és administrador'),
            ),
            onLongPress: () {
              //DELETE user
              users.document(usersInfo[i].documentID).delete();
            },
            onDoubleTap: () {
              //EDIT user
              createUserShowDialog(context, users,
                  editing: true, editingUser: usersInfo[i]);
            },
          );
        },
      ),
    );
  }
}

//Crea un usuari o el modifica en una finestra emergent
Future createUserShowDialog(BuildContext context, CollectionReference users,
    {bool editing = false, DocumentSnapshot editingUser}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return UserDialog(
          users: users, editing: editing, editingUser: editingUser);
    },
  );
}

//Aquest dialog és en stateful perquè té un checkbox i es te que actualitzar
class UserDialog extends StatefulWidget {
  final CollectionReference users;
  final bool editing;
  final DocumentSnapshot editingUser;

  const UserDialog({Key key, this.users, this.editing, this.editingUser})
      : super(key: key);

  @override
  _UserDialogState createState() => _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {
  TextEditingController _usController;
  TextEditingController _ncController;
  bool admin;

  @override
  void initState() {
    _usController = TextEditingController();
    _ncController = TextEditingController();
    if (!widget.editing) {
      _usController.text = 'username';
      _ncController.text = 'Nom Complet';
      admin = false;
    } else {
      admin = widget.editingUser.data['admin'];
      _usController.text = widget.editingUser.data['username'];
      _ncController.text = widget.editingUser.data['nomComplet'];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text((!widget.editing)
          ? 'New User'
          : 'Editing ${widget.editingUser.data['username']} user'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 55,
              child: TextField(
                controller: _usController,
                decoration: InputDecoration(
                    labelText: (!widget.editing)
                        ? "Introdueix el nom d'usuari"
                        : "Edita el nom d'usuari"),
              ),
            ),
            SizedBox(
              width: 250,
              height: 55,
              child: TextField(
                controller: _ncController,
                decoration: InputDecoration(
                    labelText: (!widget.editing)
                        ? "Introdueix el nom complet"
                        : "Edita el nom complet"),
              ),
            ),
            SizedBox(
              width: 95,
              height: 30,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: admin,
                    onChanged: (newAdmin) {
                      setState(() {
                        admin = newAdmin;
                      });
                    },
                  ),
                  Text('Admin')
                ],
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          child: Text('Upload'),
          onPressed: () {
            var data = {
              'username': _usController.text,
              'nomComplet': _ncController.text,
              'admin': admin,
            };
            if (!widget.editing) {
              widget.users.add(data);
            } else {
              widget.users
                  .document(widget.editingUser.documentID)
                  .updateData(data);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

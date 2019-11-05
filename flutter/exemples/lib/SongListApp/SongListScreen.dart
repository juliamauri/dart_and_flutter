import 'package:flutter/material.dart';
import 'Song.dart';

class SongListScreen extends StatefulWidget {
  final List<Song> _songs;
  SongListScreen(this._songs);
  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SongList"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Add Song',
            onPressed: () {
              Navigator.of(context).pushNamed("/edit").then((newSong) {
                if (newSong != null) {
                  setState(() {
                    widget._songs.add(newSong);
                  });
                }
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            for (int i = 0; i < widget._songs.length; i++)
              SongWidget(widget._songs[i], i, this)
          ],
        ),
      ),
    );
  }
}

class SongWidget extends StatelessWidget {
  const SongWidget(
    this.s,
    this.index,
    this.parent, {
    Key key,
  }) : super(key: key);

  final Song s;
  final int index;
  final _SongListScreenState parent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      s.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(s.band)
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      s.year.toString(),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/edit', arguments: s).then(
              (newSong) {
                if (newSong != null) {
                  parent.setState(
                    () {
                      parent.widget._songs[index] = newSong;
                    },
                  );
                }
              },
            );
          },
        ),
        Divider(height: 20, color: Colors.grey)
      ],
    );
  }
}

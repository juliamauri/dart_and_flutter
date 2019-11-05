import 'package:flutter/material.dart';
import 'Song.dart';
import 'SongEditScreen.dart';
import 'SongListScreen.dart';
void main() {
  runApp(App());
}

List<Song> GetSongs() {
  List<Song> ret = List<Song>();
  ret.add(Song('...And Justice For All','Metallica',1988));
  ret.add(Song('Night Train','Oscar Peterson Trio',1963));
  ret.add(Song('Mentiras','Toteking',2006));
  return ret;
}

class App extends StatelessWidget {
  App({
    Key key,
  }) : super(key: key);

  final List<Song> songs = GetSongs();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/' : (context) => SongListScreen(songs),
        '/edit' : (context) => SongEditScreen(),
      },
    );
  }
}
class Song{
  String name;
  String band;
  int year;

  Song(this.name, this.band, this.year);
}

List<Song> GetSongs() {
  List<Song> ret = List<Song>();
  ret.add(Song('...And Justice For All','Metallica',1988));
  ret.add(Song('Night Train','Oscar Peterson Trio',1963));
  ret.add(Song('Mentiras','Toteking',2006));
  return ret;
}
class Horari {
  final String dia;
  final int hora;
  Horari(this.dia, this.hora);

  String toString() => '$dia a les ${hora}h';
}

const List<String> dies = [
  'Dilluns',
  'Dimarts',
  'Dimecres',
  'Dijous',
  'Divendres',
];

const List<int> hores = [8, 10, 12, 15, 17, 19];

List<Horari> totsElsHoraris = [
  for (int i = 0; i < dies.length; i++)
    for (int j = 0; j < hores.length; j++) Horari(dies[i], hores[j]),
];

List<Horari> GetHorariDisponible() {
  List<Horari> ret = List<Horari>();
  ret.add(Horari(dies[0], 8));
  ret.add(Horari(dies[0], 15));
  ret.add(Horari(dies[2], 15));
  return ret;
}
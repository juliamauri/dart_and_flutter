class Vec3{
  List<double> coords;
  Vec3(double x, double y, double z) : coords = [x, y, z];

  String toString() => '(${coords[0]}, ${coords[1]}, ${coords[2]})';

  get x => coords[0];
  get y => coords[1];
  get z => coords[2];

  set x(double new_x) => coords[0] = new_x;
  set y(double new_y) => coords[1] = new_y;
  set z(double new_z) => coords[2] = new_z;
}

void main(){
  var p = Vec3(0.1, 0.2, 0.3);
  print(p.x);
  print(p);
  p.y = 3.5;
  print(p);
}
class Producto {
  String _descripcion;
  double _precio;

  Producto(this._descripcion, this._precio);

  String get descripcion => _descripcion;
  double get precio => _precio;
}

class ProductoEnOferta extends Producto{
  ProductoEnOferta(String d, double p, double desc) : super(d, p - ( p * desc / 100));
}

void main() {
  var productos = [
    Producto('Chocolate', 4.5),
    ProductoEnOferta('Jamon', 10.99, 20),
  ];
  for (var p in productos) {
    print('${p.descripcion}: ${p.precio.toStringAsFixed(2)}€');
  }
}    
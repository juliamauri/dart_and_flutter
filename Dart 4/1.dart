abstract class Persona {
  String nombre;
  Persona(this.nombre);
  saludo(Persona persona);
}

// faltan las clases: Educado, Autista y Normal
class Educado extends Persona{
  Educado(String n) : super(n);

  @override
  saludo(Persona persona) => 'Encantado de conocerte, ${persona.nombre}.';
}

class Autista extends Persona{
  Autista(String n) : super(n);

  @override
  saludo(Persona persona) => '...';
}

class Normal extends Persona{
  Normal(String n) : super(n);

  @override
  saludo(Persona persona) => 'Qué tal, ${persona.nombre}.';
}

void main() {
  var personas = [
    Educado('Javier'),
    Autista('Jacobo'),
    Normal('Marta'),
  ];
  var maria = Normal('Maria');
  for (var p in personas) {
    print('${p.nombre}: ${p.saludo(maria)}');
  }
}

class Actor{
  String nameInFilm;
  String name;
  String surname;

  Actor(this.nameInFilm, this.name, this.surname);

  @override
  String toString() => '$nameInFilm - $name $surname';
}

class Movie{
  String title;
  String description;
  List<Actor> actors = List<Actor>();

  Movie(this.title, this.description);

  addActor(Actor actor) => actors.add(actor);

  @override
  String toString(){ 
    String ret = 'Title: $title | Description: $description \nActors:\n';
    for(var x in actors){
      ret += '$x\n';
    }
    return ret;
  }
}

void main(){
  var interestellar = Movie('Interestellar', ' A team of explorers travel through a wormhole in space in an attempt to ensure humanity s survival. ');
  interestellar.addActor(Actor('Cooper', 'Matthew', 'McConaughey'));
  interestellar.addActor(Actor('Murph (10 Yrs.)', 'Mackenzie', 'Foy'));
  interestellar.addActor(Actor('Donald', 'John', 'Lithgow'));
  interestellar.addActor(Actor('Tom (15 Yrs.)', 'Timothée', 'Chalamet '));
  interestellar.addActor(Actor('School Principal', 'David', 'Oyelowo '));
  interestellar.addActor(Actor('Ms. Hanley', 'Collette', 'Wolfe'));

  print(interestellar);
}
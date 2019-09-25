class Event{
  List<String> groups = List<String>();
  String place;
  DateTime date;
  String description;
  double price;
  
  Event(this.place, this.date, this.description, this.price);
  addGroup(String group) => this.groups.add(group);

  @override
  String toString() {
    return place + groups.toString() + date.toString() + description + 'Price: $price e';
  }
}

void main(){
  var rockFest = Event('Santa Coloma', DateTime(2019, 9, 26, 10, 30), 'RocknRoll', 150);
  rockFest.addGroup('Iron Maiden');
  rockFest.addGroup('Scorpion');
  rockFest.addGroup('Kiss');
  rockFest.addGroup('King Diamond');
  rockFest.addGroup('Mago de Oz');

  print(rockFest);
}
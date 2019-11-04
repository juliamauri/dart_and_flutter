class Recipe{
  String _name;
  int _minutes;
  List<String> _ingredients = List<String>();
  String _description;
  
  String get name => _name;
  int get minutes => _minutes;
  List<String> get ingredients => _ingredients;
  String get description => _description;

  set name(String n) => _name = n;
  set minutes(int m) => _minutes = m;
  set addIngredient(String i) => _ingredients.add(i);
  set description(String d) => _description = d;
}
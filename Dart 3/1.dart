class User{
  String username;
  String password;
  String photoURL;
  bool isAdministrator;
  String wallaperURL;

  User(this.username, this.password, this.photoURL, this.isAdministrator, this.wallaperURL );
}

void main(){
  var firstUser = User('Juls', 'koliflor', 'www.myimages.com/profilephoto', false, 'www.wallapers.com/waterfall');
  print(firstUser.username);
}
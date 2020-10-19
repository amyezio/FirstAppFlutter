class User {
  String _name;
  String _email;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  User (this._name, this._email,);
}
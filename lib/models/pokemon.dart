class Pokemon {
  String _name;
  String _url;
  String _image;
  int _id;

  Pokemon({String name, String url, String image, int id}) {
    this._name = name;
    this._url = url;
    this._image = image;
    this._id = id;
  }

  String get name => this._name;

  String get url => this._url;

  String get image => this._image;

  int get id => this._id;
}
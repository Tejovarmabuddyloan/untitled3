class Post {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Post.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}
class Character {
  String? id;
  String? type;
  int? characterId;
  String? firstName;
  String? lastName;
  String? picture;
  String? birthdate;
  String? genre;
  String? blood;
  String? house;
  bool? alive;

  Character({
    this.id,
    this.type,
    this.characterId,
    this.firstName,
    this.lastName,
    this.picture,
    this.birthdate,
    this.genre,
    this.blood,
    this.house,
    this.alive,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    characterId = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    birthdate = json['birthdate'];
    genre = json['genre'];
    blood = json['blood'];
    house = json['house'];
    alive = json['alive'];
  }
}



// https://marauderapi.fr/api/characters?page=2
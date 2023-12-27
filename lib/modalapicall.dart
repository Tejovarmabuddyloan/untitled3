class CharacterResponse {
  List<Character> items;
  int total;
  String firstPage;
  String lastPage;
  String nextPage;

  CharacterResponse({
    required this.items,
    required this.total,
    required this.firstPage,
    required this.lastPage,
    required this.nextPage,
  });

  CharacterResponse.fromJson(Map<String, dynamic> json)
      : items = (json['items'] as List<dynamic>)
      .map((item) => Character.fromJson(item))
      .toList(),
        total = json['total'],
        firstPage = json['firstPage'],
        lastPage = json['lastPage'],
        nextPage = json['nextPage'];
}

class Character {
  String id;
  String type;
  int itemId;
  String firstName;
  String? lastName;
  String picture;
  DateTime birthdate;
  String genre;
  String blood;
  String house;
  bool alive;

  Character({
    required this.id,
    required this.type,
    required this.itemId,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.birthdate,
    required this.genre,
    required this.blood,
    required this.house,
    required this.alive,
  });

  Character.fromJson(Map<String, dynamic> json)
      : id = json['@id'],
        type = json['@type'],
        itemId = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        picture = json['picture'],
        birthdate = DateTime.parse(json['birthdate']),
        genre = json['genre'],
        blood = json['blood'],
        house = json['house'],
        alive = json['alive'];
}

class PokemonDetailModel {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    // Extract types list
    final typesList = <String>[];
    if (json['types'] != null) {
      for (var typeEntry in json['types']) {
        if (typeEntry['type'] != null && typeEntry['type']['name'] != null) {
          typesList.add(typeEntry['type']['name'] as String);
        }
      }
    }

    // Extract official-artwork sprite, with a fallback to front_default
    String imgUrl = '';
    if (json['sprites'] != null) {
      final sprites = json['sprites'];
      if (sprites['other'] != null &&
          sprites['other']['official-artwork'] != null &&
          sprites['other']['official-artwork']['front_default'] != null) {
        imgUrl = sprites['other']['official-artwork']['front_default'] as String;
      } else if (sprites['front_default'] != null) {
        imgUrl = sprites['front_default'] as String;
      }
    }

    return PokemonDetailModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      imageUrl: imgUrl,
      types: typesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'types': types,
    };
  }
}

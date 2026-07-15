class PokemonResponseModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonResult>? results;

  PokemonResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) {
    return PokemonResponseModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PokemonResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }
}

class PokemonResult {
  final String? name;
  final String? url;

  PokemonResult({
    this.name,
    this.url,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return PokemonResult(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
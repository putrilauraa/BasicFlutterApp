class PokeAPIModel {
  int count;
  dynamic nextUrl;
  List<PokemonResult> results;

  PokeAPIModel(
      {required this.count, required this.nextUrl, required this.results});

  factory PokeAPIModel.fromJson(Map<String, dynamic> json) {
    return PokeAPIModel(
        count: json['count'],
        nextUrl: json['next'],
        results: parsedDataResults(json['results']));
  }

  static List<PokemonResult> parsedDataResults(dataJson) {
    var list = dataJson as List;

    List<PokemonResult> datasResult =
        list.map((e) => PokemonResult.fromJson(e)).toList();
    return datasResult;
  }
}

class PokemonResult {
  String name;
  String url;

  PokemonResult({required this.name, required this.url});

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return PokemonResult(name: json['name'], url: json['url']);
  }
}

class SearchPokeAPIModel {
  int height;
  int weight;
  String name;
  int id;

  SearchPokeAPIModel(
      {required this.height,
      required this.id,
      required this.name,
      required this.weight});

  factory SearchPokeAPIModel.fromJson(Map<String, dynamic> json) {
    return SearchPokeAPIModel(
      height: json['height'],
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
    );
  }
}

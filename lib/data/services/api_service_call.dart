import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pockman/data/models/api_service_model.dart';
import 'package:pockman/data/models/pokemon_detail_model.dart';

class ApiServiceCall {
  Future<PokemonResponseModel> getpokemonlist() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/?limit=20"),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PokemonResponseModel.fromJson(data);
    } else {
      throw Exception('Failed to load initial pokemon list');
    }
  }

  Future<PokemonDetailModel> getPokemonDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return PokemonDetailModel.fromJson(data);
    } else {
      throw Exception('Failed to load pokemon detail from: $url');
    }
  }

  Future<List<PokemonDetailModel>> getPokemonDetailsList() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon/?limit=20"),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      PokemonResponseModel listResponse = PokemonResponseModel.fromJson(data);
      
      List<Future<PokemonDetailModel>> detailFutures = [];
      if (listResponse.results != null) {
        for (var pokemon in listResponse.results!) {
          if (pokemon.url != null) {
            detailFutures.add(getPokemonDetail(pokemon.url!));
          }
        }
      }
      return await Future.wait(detailFutures);
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }
}

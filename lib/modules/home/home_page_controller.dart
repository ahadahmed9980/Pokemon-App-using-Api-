import 'package:get/state_manager.dart';
import 'package:pockman/data/models/pokemon_detail_model.dart';
import 'package:pockman/data/services/api_service_call.dart';

class HomePageController extends GetxController {
  final ApiServiceCall apiServiceCall = ApiServiceCall();

  final isLoading = true.obs;
  final pokemonList = <PokemonDetailModel>[].obs;
  final filteredPokemonList = <PokemonDetailModel>[].obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPokemon();
  }

  void fetchPokemon() async {
    try {
      isLoading(true);
      errorMessage('');
      final list = await apiServiceCall.getPokemonDetailsList();
      pokemonList.assignAll(list);
      filteredPokemonList.assignAll(list);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void filterPokemon(String query) {
    if (query.isEmpty) {
      filteredPokemonList.assignAll(pokemonList);
    } else {
      filteredPokemonList.assignAll(
        pokemonList
            .where((pokemon) =>
                pokemon.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}

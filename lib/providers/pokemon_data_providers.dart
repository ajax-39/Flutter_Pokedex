import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/database_services.dart';
import 'package:pokedex/services/http_service.dart';

final pokemonDataProvider =
    FutureProvider.family<Pokemon?, String>((ref, url) async {
  HTTPService httpService = GetIt.instance.get<HTTPService>();
  Response? res = await httpService.get(url);

  if (res != null && res.data != null) {
    return Pokemon.fromJson(res.data);
  } else {
    return null;
  }
});

final favoritePokemonProvider =
    StateNotifierProvider<FavoritePokemonProvider, List<String>>(
        (ref) => FavoritePokemonProvider([]));

class FavoritePokemonProvider extends StateNotifier<List<String>> {
  final DatabaseService _databaseService =
      GetIt.instance.get<DatabaseService>();

  final FAVORITE_POKEMON_LIST_KEY = "favorite_pokemon_list";   
  FavoritePokemonProvider(super._state) {
    _setup();
  }

  Future<void> _setup() async { 
    List<String>? favoritePokemonList = await _databaseService.getList(FAVORITE_POKEMON_LIST_KEY);
    state = favoritePokemonList ?? [];
    
  }
  void addFavoritePokemon(String url) {
    state = [...state, url];
    _databaseService.saveList(FAVORITE_POKEMON_LIST_KEY, state);

  }

  void removeFavoritePokemon(String url) {
    state = state.where((e) => e != url).toList();
    _databaseService.saveList(FAVORITE_POKEMON_LIST_KEY, state);
  }
}

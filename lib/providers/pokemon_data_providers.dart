import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/models/pokemon.dart';
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
  FavoritePokemonProvider(super._state) {
    _setup();
  }

  Future<void> _setup() async {}
  void addFavoritePokemon(String url) {
    state = [...state, url];
  }

  void removeFavoritePokemon(String url) {
    state = state.where((e) => e != url).toList();
  }
}

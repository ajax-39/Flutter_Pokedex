import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_data_providers.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonURL;
  late FavoritePokemonProvider _favoritePokemonProvider;
  late List<String> _favoritePokemons;

  PokemonListTile({super.key, required this.pokemonURL});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonDataProvider(pokemonURL));
    _favoritePokemonProvider = ref.watch(favoritePokemonProvider.notifier);
    _favoritePokemons = ref.watch(favoritePokemonProvider);

    return pokemon.when(data: (data) {
      return _tile(context, false, data);
    }, error: (e, stackTrace) {
      return Text("Error: $e");
    }, loading: () {
      return _tile(context, true, null);
    });
  }

  Widget _tile(BuildContext context, bool isLoading, Pokemon? pokemon) {
    return ListTile(
      leading: pokemon != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(pokemon.sprites!.frontDefault!),
            )
          : CircleAvatar(),
      title: Skeletonizer(
        enabled: isLoading,
        child: Text(
          pokemon != null ? pokemon.name!.toUpperCase() : "Loading Pokemon...",
        ),
      ),
      subtitle: Text("Hash ${pokemon?.moves?.length.toString() ?? 0} moves"),
      trailing: IconButton(
        onPressed: () {
          if (_favoritePokemons.contains(pokemonURL)) {
            _favoritePokemonProvider.removeFavoritePokemon(pokemonURL);
          } else {
            _favoritePokemonProvider.addFavoritePokemon(pokemonURL);
          }
        },
        icon: Icon(
          _favoritePokemons.contains(pokemonURL)
              ? Icons.favorite
              : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}

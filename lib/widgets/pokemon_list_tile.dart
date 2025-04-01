import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_data_providers.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonURL;

  const PokemonListTile({super.key, required this.pokemonURL});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonDataProvider(pokemonURL));
    return pokemon.when(data: (data) {
      return _tile(context, false, data);
    }, error: (e, stackTrace) {
      return Text("Error: $e");
    }, loading: () {
      return _tile(context, false, null);
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
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/services/database_services.dart';
import 'package:pokedex/services/http_service.dart';

void main() async {
  await _setupServices();
  runApp(const MyApp());
}

Future<void> _setupServices() async {
  GetIt.instance.registerSingleton<HTTPService>(HTTPService());
  GetIt.instance.registerSingleton<DatabaseService>(DatabaseService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeDex',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            textTheme: GoogleFonts.quattrocentoSansTextTheme()),
        home: const HomePage(),
      ),
    );
  }
}

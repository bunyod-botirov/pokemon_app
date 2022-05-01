import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/home_page.dart';
import 'package:pokemon_app/service/pokemon_hive.dart';

Future<void> main() async {
  await PokemonHive.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Spartan",
      ),
      home: const HomePage(),
    );
  }
}

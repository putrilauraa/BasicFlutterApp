import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/Dashboard.dart';
import 'package:flutter_application_1/Modul/Modul.dart';
import 'package:flutter_application_1/Modul/ModulDetail.dart';
import 'package:flutter_application_1/PokeAPI/Screens/PokeAPI.dart';
import 'package:flutter_application_1/PokeAPI/Screens/PokeAPIDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var routes = {
    "/modul": (context) => ModulScreen(),
    "/modulDetail": (context) => ModulDetail(),
    "/PokeAPI": (context) => PokeAPI(),
    "/PokeAPIDetail": (context) => PokeAPIDetail(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
      home: Dashboard(),
    );
  }
}

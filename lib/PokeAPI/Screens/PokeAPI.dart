// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/PokeAPI/Screens/PokeAPIManual.dart';

class PokeAPI extends StatefulWidget {
  @override
  State<PokeAPI> createState() => _PokeAPIState();
}

class _PokeAPIState extends State<PokeAPI> {
  int selectedIndex = 0;
  List<String> title = ["PokeAPI Manual", "PokeAPI Bloc"];
  List<Widget> widgetScreen = [PokeAPIManual(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[selectedIndex]),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTapBar,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.list,
                color: Colors.brown,
              ),
              label: "Manual",
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.brown,
            ),
            label: "Bloc",
            icon: Icon(
              Icons.dashboard,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: widgetScreen.elementAt(selectedIndex),
    );
  }

  void onTapBar(int idx) {
    setState(() {
      selectedIndex = idx;
    });
  }
}

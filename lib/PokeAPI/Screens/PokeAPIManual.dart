import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/PokeAPI/Screens/Model/PokeAPIModel.dart';
import 'package:flutter_application_1/PokeAPI/Screens/PokeAPIDetail.dart';
import 'package:http/http.dart' as http;

class PokeAPIManual extends StatefulWidget {
  @override
  State<PokeAPIManual> createState() => _PokeAPIManualState();
}

class _PokeAPIManualState extends State<PokeAPIManual> {
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=10";
  List<PokemonResult> pokemonResult = [];
  ScrollController scrollController = ScrollController();
  bool loadMoreIndicator = false;
  TextEditingController searchCtrl = TextEditingController();
  String searchWarning = "-";
  late SearchPokeAPIModel searchPokeAPIModel;

  @override
  void initState() {
    super.initState();
    loadPokeAPI(url);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreIndicator == true;
        loadPokeAPI(url);
      }
    });
  }

  @override
  void initSate() {
    super.initState();
    loadPokeAPI(url);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreIndicator = true;
        loadPokeAPI(url);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          height: 80,
          child: TextField(
            controller: searchCtrl,
            decoration: InputDecoration(
                hintText: "Search your pokemon's name",
                suffixIcon: MaterialButton(
                  onPressed: () {
                    if (searchCtrl.text.isNotEmpty) {
                      searchPokemon(searchCtrl.text);
                    } else {
                      searchWarning = "-";
                      loadPokeAPI(url);
                    }
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        searchWarning == "Berhasil"
            ? Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/" +
                        searchPokeAPIModel.id.toString() +
                        ".png",
                    height: 55,
                  ),
                  Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${searchPokeAPIModel.name}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Weight: ${searchPokeAPIModel.weight.toString()}',
                            )
                          ])
                    ],
                  )
                ]))
            : searchWarning == "Data Tidak Ditemukan"
                ? Center(
                    child: Text(searchWarning),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pokemonResult.length + 1,
                    itemBuilder: (context, i) {
                      return i < pokemonResult.length
                          ? GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/PokeAPIDetail",
                                    arguments: PokeAPIDetailArgs(
                                        name: pokemonResult[i].name));
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 20),
                                        child: Image.network(
                                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/" +
                                              i.toString() +
                                              ".png",
                                          height: 55,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text("Name: $(searchPokeAPIModel)")
                                          Text(
                                            pokemonResult[i].name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(pokemonResult[i].url),
                                          // Container(
                                          //   height: 70,
                                          //   margin: EdgeInsets.all(3),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                CircularProgressIndicator(),
                              ],
                            );
                    })
      ],
    );
  }

  void searchPokemon(String query) async {
    var response =
        await http.get(Uri.parse("http://pokeapi.co/api/v2/pokemon/$query"));

    if (response.statusCode == 200) {
      SearchPokeAPIModel searchPokeAPIResponse = SearchPokeAPIModel.fromJson(
        json.decode(response.body),
      );

      setState(() {
        searchWarning = "Berhasil";
        searchPokeAPIModel = searchPokeAPIResponse;
      });
    } else {
      setState(() {
        searchWarning = "Data Tidak Ditemukan";
      });
    }
  }

  void loadPokeAPI(String url) async {
    var response = await http.get(Uri.parse(url));

    print("HASIL GET API ${response.body}");

    PokeAPIModel pokeAPIModel =
        PokeAPIModel.fromJson(json.decode(response.body));

    pokeAPIModel.results.forEach((e) {
      setState(() {
        url = pokeAPIModel.nextUrl;
        pokemonResult.add(e);
      });
    });
  }
}

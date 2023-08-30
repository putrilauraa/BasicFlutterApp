// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Style/FontStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5e5e5),
      // appBar: AppBar(title: Text("AppBar")),
      // drawer: SafeArea(child: Drawer()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome,", style: HeaderStyle()),
                        Text("Putri Laura!", style: SubHeaderStyle()),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 217, 217),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      "assets/my_profile.png",
                      scale: 0.8,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Menu",
                        style: SubHeaderStyle(),
                      ),
                    ),
                    Image.asset("assets/filter.png")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              "assets/logo_netflix.png",
                              height: 60,
                            ),
                          ),
                          Text(
                            "Netflix",
                            style: TitleStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/PokeAPI");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 175, 54),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/pokeapi.png",
                                height: 60,
                              ),
                            ),
                            Text(
                              "PokeAPI",
                              style: TitleStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/modul");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 163, 182, 240),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/m2.PNG",
                                height: 60,
                                scale: 0.5,
                              ),
                            ),
                            Text(
                              "Movie",
                              style: TitleStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                child: menuRow("News"),
              ),
              for (var i = 1; i <= 4; i++)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/banner3.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "Victory College",
                              "Victory College $i",
                              style: SubHeaderStyle(),
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  itemBuilder: (context, i) => Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  onRatingUpdate: (value) {},
                                  initialRating: 4.5,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  itemSize: 13,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "4.5",
                                    style: SmallStyle(),
                                  ),
                                ),
                                Text(
                                  "(210)",
                                  style: SmallStyle(),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Bio Science",
                                style: TitleStyle(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuRow(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TitleStyle(),
          ),
        ),
        Image.asset("assets/filter.png")
      ],
    );
  }
}

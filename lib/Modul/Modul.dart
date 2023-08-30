// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Modul/Widgets/ComingSoonCard.dart';
import 'package:flutter_application_1/Modul/Widgets/IosDialog.dart';
import 'package:flutter_application_1/Style/FontStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ModulScreen extends StatefulWidget {
  @override
  State<ModulScreen> createState() => _ModulScreenState();
}

class _ModulScreenState extends State<ModulScreen> {
  List<String> imgBanner = [
    "https://en.gundam.info/about-gundam/series-pages/witch/gwitch/en/news/2022/07/220617_gw_1280px_720px_banner_english.jpg",
    "https://www.horrornewsnetwork.net/wp-content/uploads/2021/02/Wednesday-Netflix.jpg",
    "https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2022/12/bleach-banner.jpg?q=50&fit=contain&w=1140&h=570&dpr=1.5",
    "http://www.otakuattack.org/wp-content/uploads/2018/12/MHA-Banner2.jpg"
  ];

  Color btnOngoing = Colors.yellow;
  Color btnComing = Colors.white;

  bool visOngoing = true;
  bool visComing = false;

  List<String> titleOngoing = [
    "Wednesday",
    "Gudam Wings",
    "Spy x Family",
  ];

  List<String> titleComing = [
    "Gudam Suit Mercury",
    "Full Metal Alchemist",
    "Bleach Thousand Year Blood War",
    "First Love",
  ];

  List<String> imgComing = [
    "assets/gundam2.jpg",
    "assets/fullmetal.jpg",
    "assets/bleach.jpg",
    "assets/first_love.jpg"
  ];

  List<String> imgGoing = [
    "assets/wednesday.jpg",
    "assets/gundam.jpg",
    "assets/spyxfamily.jpg",
  ];

  List<String> ratingValList = [];
  final storageCache = FlutterSecureStorage();
  String initialVal = "0";

  @override
  void initState() {
    super.initState();
    getValBar();
  }

  void getValBar() async {
    String ratingBar = await storageCache.read(key: "rating_value") ?? "0.0";
    setState(() {
      ratingValList = ratingBar.split(",");
      if (ratingValList.length < imgGoing.length) {
        ratingValList.add("0.0");
        ratingValList.add("0.0");
      } else {
        ratingValList.toList();
      }
      print("LENGTH RATING MODUL ${ratingValList.length}");
      print("LENGTH RATING MODUL ${ratingValList}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111c2f),
      appBar: AppBar(
        backgroundColor: Color(0xFF111c2f),
        title: Text("Modul",
            style: TextStyle(color: Color.fromARGB(255, 250, 248, 248))),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: imgBanner.length,
            itemBuilder: ((context, index, realIndex) {
              return Center(
                child: Image.network(
                  imgBanner[index],
                  height: 180,
                  fit: BoxFit.cover,
                ),
              );
            }),
            options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      btnOngoing = Colors.yellow;
                      btnComing = Colors.white;
                      visOngoing = true;
                      visComing = false;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: btnOngoing,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    height: 45,
                    child: Text(
                      "On Going",
                      style: DescBoldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      btnOngoing = Colors.white;
                      btnComing = Colors.yellow;
                      visOngoing = false;
                      visComing = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: btnComing,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    height: 45,
                    child: Text(
                      "Coming Soon",
                      style: DescBoldStyle(),
                    ),
                  ),
                )
              ],
            ),
          ),
          for (var g = 1; g <= imgGoing.length; g++)
            Visibility(
                visible: visOngoing,
                child: cardOnGoing(
                  titleOngoing[g - 1],
                  imgGoing[g - 1],
                  "${g - 1}",
                  ratingValList[g - 1],
                )),
          for (var s = 1; s <= imgGoing.length; s++)
            Visibility(
              visible: visComing,
              child: ComingSoonCard(
                  title: titleComing[s - 1], img: imgComing[s - 1]),
            )
        ],
      ),
    );
  }

  Widget cardOnGoing(String title, String img, String idx, String rating) {
    print("IND $idx");
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Card(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                height: 200,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TitleStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the.Lorem Ipsum is simply dummy text ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: DescStyle(),
                      ),
                    ),
                    RatingBar.builder(
                      itemBuilder: (context, i) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (value) {},
                      initialRating: double.parse(rating),
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemSize: 25,
                    ),
                    GestureDetector(
                      onTap: () =>
                          showIosDialog(context, title, img, rating, idx),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF638cef),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          "Lihat Detail",
                          style: DescStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

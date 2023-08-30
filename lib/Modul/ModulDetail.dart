// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Style/FontStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

class ModulDetail extends StatefulWidget {
  @override
  State<ModulDetail> createState() => _ModulDetailState();
}

class _ModulDetailState extends State<ModulDetail> {
  final storageCache = FlutterSecureStorage();
  var args;
  double initialVal = 0;
  String ratingBar = "0.0";
  List<String> ratingValList = [];

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), getCred);
  }

  void getCred() async {
    String ratingBars = await storageCache.read(key: "rating_value") ?? "0.0";
    args = ModalRoute.of(context)!.settings.arguments as ModulDetailArgs;
    setState(() {
      ratingBar = ratingBars;
      initialVal = args.rating != "" ? double.parse(args.rating) : 0.0;
    });
    // print("URL IMG ${args.url}");
    print("RATING BARS $ratingBar");
  }

  @override
  Widget build(BuildContext context) {
    // getCred();
    print("INDEX ${args.idx}");
    return Scaffold(
      backgroundColor: Color(0xFF111c2f),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 51, 85),
        title: Text("Modul Detail",
            style: TextStyle(color: Color.fromARGB(255, 250, 248, 248))),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                args.url,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            args.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "QuickSand",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: "QuickSand",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 10, bottom: 5),
          child: RatingBar.builder(
            initialRating: initialVal,
            itemBuilder: (context, i) => Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            onRatingUpdate: (value) {
              // setState(() {
              initialVal = value;
              // });
              print("NILAI INITIAL ${initialVal}");
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            ratingValList = ratingBar.split(",");

            // print(initialVal);
            // print(ratingValList);
            // print("INDEXs ${args.idx}");

            if (ratingValList.length < 3) {
              ratingValList.add("0.0");
              ratingValList.add("0.0");
            }
            ratingValList.asMap().forEach((index, value) {
              // print("INI IDX $index : ${args.idx}");
              print(args.idx);
              if (index == int.parse(args.idx)) {
                // print("INI IDX $index : ${args.idx}");
                // setState(() {
                ratingValList[index] = initialVal.toString();
                // });
              }
            });

            String listConvertString = ratingValList.join(",");
            // print("STRING RATING $listConvertString");
            // print("STRING VAL $ratingValList");
            storageCache.write(key: "rating_value", value: listConvertString);
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, "/modul");
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Text("Kirim Penilaian",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ]),
    );
  }
}

class ModulDetailArgs {
  final String title;
  final String url;
  final String idx;
  final String rating;

  ModulDetailArgs(
      {required this.title,
      required this.url,
      required this.idx,
      required this.rating});
}

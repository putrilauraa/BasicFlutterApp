import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modul/ModulDetail.dart';

void showIosDialog(BuildContext context, String title, String urlImg,
    String rating, String idx) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: Text("Informasi"),
            content: Column(children: [
              Text("Apakah anda ingin melihat detail lebih lengkap?"),
            ]),
            actions: [
              CupertinoDialogAction(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text("Lanjutkan"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/modulDetail",
                      arguments: ModulDetailArgs(
                          title: title, url: urlImg, rating: rating, idx: idx));
                },
              ),
            ]);
      });
}

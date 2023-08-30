import 'package:flutter/material.dart';
import 'package:flutter_application_1/Style/FontStyle.dart';
import 'package:flutter_application_1/Modul/Widgets/WebViewDialog.dart';

class ComingSoonCard extends StatelessWidget {
  ComingSoonCard({required this.title, required this.img});

  String title;
  String img;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
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
                    GestureDetector(
                      onTap: () {
                        showWebViewDialog(context, title,
                            "https://www.youtube.com/watch?v=mYd_l3E7yOc");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF638cef),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          "Lihat Trailer",
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

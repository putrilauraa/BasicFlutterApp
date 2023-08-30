import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PokeAPIDetail extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as PokeAPIDetailArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webviewController) {
          _controller.complete(webviewController);
        },
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://www.pokemon.com/us/pokedex/${args.name}",
      ),
    );
  }
}

class PokeAPIDetailArgs {
  final String name;
  PokeAPIDetailArgs({
    required this.name,
  });
}

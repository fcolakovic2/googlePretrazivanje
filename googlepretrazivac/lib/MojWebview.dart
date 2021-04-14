import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MojWebview extends StatefulWidget {
  String trazeno;
  MojWebview(String tekst) {
    trazeno = tekst;
  }

  @override
  _MojWebviewState createState() => _MojWebviewState();
}

class _MojWebviewState extends State<MojWebview> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: "https://www.google.com/search?q=" + widget.trazeno);
  }
}

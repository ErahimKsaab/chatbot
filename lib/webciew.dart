import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class webview extends StatefulWidget {
  @override
  _webviewState createState() => _webviewState();
}

class _webviewState extends State<webview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: WebView(initialUrl: "https://chat-bot-54c62.web.app",javascriptMode:JavascriptMode.unrestricted ,))
    );
  }
}

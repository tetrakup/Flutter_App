import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart' show rootBundle;

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    _loadHtmlFromAssets();
  }

  _loadHtmlFromAssets() async {
    String htmlContent = await rootBundle.loadString('assets/web_content/index.html');
    String cssContent = await rootBundle.loadString('assets/web_content/styles.css');
    String jsContent = await rootBundle.loadString('assets/web_content/scripts.js');

    setState(() {
      _htmlContent = '''
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Web Content</title>
          <style>
            $cssContent
          </style>
        </head>
        <body class="not-loaded">
          $htmlContent
          <script>
            $jsContent
          </script>
        </body>
        </html>
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView Example'),
      ),
      body: _htmlContent.isEmpty
          ? Center(child: CircularProgressIndicator())
          : WebviewScaffold(
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Center(child: CircularProgressIndicator()),
              url: Uri.dataFromString(_htmlContent, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString(),
            ),
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}

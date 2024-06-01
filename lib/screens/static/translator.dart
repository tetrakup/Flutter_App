// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../services/api.dart';
import '../../models/translation.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  TextEditingController wordController = TextEditingController(text: "Hello");

  List<Translation> ceviriler = [];

  translate() async {
    API api = API();
    var sonuc = await api.cevir(wordController.text);

    setState(() {
      ceviriler = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Kelime:"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: wordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: translate,
                child: Text("Cevir"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ceviriler.length,
                itemBuilder: (context, index) => Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ceviriler[index].word!),
                    Column(
                      children: ceviriler[index]
                          .meanings!
                          .map((e) => Text(e.partOfSpeech!))
                          .toList(),
                    ),
                    Column(
                      children: ceviriler[index]
                          .phonetics!
                          .map((e) => Text("-"))
                          .toList(),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

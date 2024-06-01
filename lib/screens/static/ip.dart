// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../services/api.dart';
import '../../models/ip.dart';

class IPScreen extends StatefulWidget {
  const IPScreen({super.key});

  @override
  State<IPScreen> createState() => _IPScreenState();
}

class _IPScreenState extends State<IPScreen> {
  TextEditingController ipAddressController =
      TextEditingController(text: "8.8.8.8");

  IpInfo? bilgiler;

  ipBul() async {
    API api = API();
    var sonuc = await api.konumBul(ipAddressController.text);

    setState(() {
      bilgiler = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("IP:"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ipAddressController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: ipBul,
                child: Text("Find Location"),
              ),
            ),
            if (bilgiler != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ulke Bilgiler: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bilgiler!.countryName.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sehir Adi: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bilgiler!.cityName.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Posta Kodu: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bilgiler!.zipCode.toString()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

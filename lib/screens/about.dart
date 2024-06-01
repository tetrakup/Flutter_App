/*import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../screens/core/cache.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Map<String, dynamic> pageConfig = {};
  bool configLoaded = false;

  loadData() async {
    // JSON dosyasını yükleme
    String data = await rootBundle.loadString('assets/static/about.json');
    final pageConfig = json.decode(data);

    setState(() {
      this.pageConfig = pageConfig;
      configLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkımızda'),
      ),
      body: configLoaded ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Biz Kimiz?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                pageConfig['slogan'] ?? 'Slogan burada yer alacak.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Vizyonumuz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                pageConfig['subSlogan'] ?? 'Alt slogan burada yer alacak.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'İletişim',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  abouts('Adres', 'Türkiye'),
                  abouts('E-posta', 'shoppingapp@gmail.com'),
                  abouts('Telefon', '123 456 7890'),
                ],
              ),
            ],
          ),
        ),
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  Widget abouts(String title, String aciklama) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              aciklama,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'dart:convert'; // JSON verilerini işlemek için kull.
import 'dart:io';

import 'package:flutter/foundation.dart'; // platforma özgü işlemler için kull.
import 'package:flutter/services.dart'; // assets dosyalarını yüklemek için
import 'package:path_provider/path_provider.dart'; // cihazdaki dosya sistemine erişmek için kull.

import '../screens/core/cache.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Map<String, dynamic> pageConfig = {};
  bool configLoaded = false;

  loadData() async {
    CacheSystem cs = CacheSystem();
    final pageConfig = await cs.getAboutConfig();

    setState(() {
      this.pageConfig = pageConfig;
      configLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkımızda'),
      ),
      body: configLoaded
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Biz Kimiz?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      pageConfig['slogan'] ?? 'Slogan burada yer alacak.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Text(
                        'Vizyonumuz',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      pageConfig['subSlogan'] ?? 'Alt slogan burada yer alacak.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Text(
                        'İletişim',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        abouts('Adres', 'Türkiye'),
                        abouts('E-posta', 'shoppingapp@gmail.com'),
                        abouts('Telefon', '123 456 7890'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget abouts(String title, String aciklama) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              aciklama,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

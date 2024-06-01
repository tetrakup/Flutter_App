import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Gap(8),
          //
          ProductWidget(
              urunAdi: 'iPhone 13',
              marka: 'Apple',
              avatarImagePath: "assets/images/iphone13.jpg",
              fiyat: '8000 TL',
              musteriPuani: '4.5',
              metin:
                  'Yüksek performanslı işlemci, gelişmiş kamera sistemleri ve dayanıklı tasarımıyla iPhone 13, teknoloji tutkunları için ideal bir seçimdir. Her detayıyla özenle tasarlanmış olan bu akıllı telefon, kullanıcılarına üst düzey bir deneyim sunar.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'Sony PlayStation 5',
              marka: 'Sony',
              avatarImagePath: "assets/images/ps5.jpg",
              fiyat: '5000 TL',
              musteriPuani: '4.9',
              metin:
                  'Sony PlayStation 5, oyun dünyasında sınırları zorlayan bir deneyim sunar. Güçlü işlemcisi ve etkileyici grafikleriyle, en yeni oyunları sorunsuz bir şekilde oynamanızı sağlar. Ultra hızlı SSD depolama ve gelişmiş denetim özellikleriyle oyuncular için mükemmel bir seçenektir.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'Samsung Galaxy S22 Ultra',
              marka: 'Samsung',
              avatarImagePath: "assets/images/galaxy_s22_ultra.jpg",
              fiyat: '9000 TL',
              musteriPuani: '4.7',
              metin:
                  'Samsung Galaxy S22 Ultra, yüksek performanslı işlemcisi, etkileyici kamera özellikleri ve şık tasarımıyla dikkat çekiyor. 8K video çekme, uzun pil ömrü ve büyük ekranıyla kullanıcılarına üstün bir deneyim sunuyor.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'Canon EOS R5',
              marka: 'Canon',
              avatarImagePath: "assets/images/canon_eos_r5.jpg",
              fiyat: '15000 TL',
              musteriPuani: '4.9',
              metin:
                  'Canon EOS R5, profesyonel fotoğrafçılar ve fotoğraf meraklıları için üst düzey bir seçenektir. Yüksek çözünürlüklü fotoğraf ve video çekimi, hızlı otomatik odaklama ve geniş ISO aralığı gibi özellikleriyle dikkat çeker.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'Apple AirPods Pro',
              marka: 'Apple',
              avatarImagePath: "assets/images/airpods_pro.jpg",
              fiyat: '1500 TL',
              musteriPuani: '4.8',
              metin:
                  'Apple AirPods Pro, gelişmiş aktif gürültü engelleme özelliği ve yüksek kaliteli ses performansıyla dikkat çekiyor. Şarj kutusuyla birlikte uzun pil ömrü sunar ve kablosuz şarj desteğiyle kullanım kolaylığı sağlar.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'Samsung Odyssey G9',
              marka: 'Samsung',
              avatarImagePath: "assets/images/odyssey_g9.jpg",
              fiyat: '10000 TL',
              musteriPuani: '4.9',
              metin:
                  'Samsung Odyssey G9, geniş kavisli ekranı ve yüksek yenileme hızıyla oyun tutkunları için ideal bir monitördür. QLED teknolojisiyle canlı renkler sunar ve G-Sync uyumluluğuyla akıcı bir oyun deneyimi sağlar.'),
          Gap(8),
          ProductWidget(
              urunAdi: 'DJI Mavic Air 2',
              marka: 'DJI',
              avatarImagePath: "assets/images/mavic_air_2.jpg",
              fiyat: '6000 TL',
              musteriPuani: '4.7',
              metin:
                  'DJI Mavic Air 2, kompakt tasarımı ve yüksek çözünürlüklü kamerasıyla dikkat çeken bir drone modelidir. Uzun uçuş süresi, akıllı uçuş modları ve yüksek kaliteli video çekimi özellikleriyle kullanıcılarına mükemmel bir hava fotoğrafçılığı deneyimi sunar.'),
        ],
      ),
    )
    ;
  }
}

class ProductWidget extends StatelessWidget {
  final String urunAdi;
  final String marka;
  final String avatarImagePath;
  final String fiyat;
  final String musteriPuani;
  final String metin;

  ProductWidget({
    required this.urunAdi,
    required this.marka,
    required this.avatarImagePath,
    required this.fiyat,
    required this.musteriPuani,
    required this.metin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(avatarImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            urunAdi,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Yeni eklenen özellik
                            ),
                          ),
                          Text(
                            'marka: $marka',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey, // Yeni eklenen özellik
                            ),
                          ),
                          Gap(35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Fiyatı: $fiyat',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'musteriPuaniı: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                musteriPuani,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black, // Yeni eklenen özellik
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetailsScreen(
                                    urunAdi: urunAdi,
                                    marka: marka,
                                    avatarImagePath: avatarImagePath,
                                    fiyat: fiyat,
                                    musteriPuani: musteriPuani,
                                    metin: metin,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Detayları Gör',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsScreen(
                              urunAdi: urunAdi,
                              marka: marka,
                              avatarImagePath: avatarImagePath,
                              fiyat: fiyat,
                              musteriPuani: musteriPuani,
                              metin: metin,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final String urunAdi;
  final String marka;
  final String avatarImagePath;
  final String fiyat;
  final String musteriPuani;
  final String metin;

  BookDetailsScreen({
    required this.urunAdi,
    required this.marka,
    required this.avatarImagePath,
    required this.fiyat,
    required this.musteriPuani,
    required this.metin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(avatarImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              urunAdi,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Yeni eklenen özellik
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'marka: $marka',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.grey, // Yeni eklenen özellik
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  index < int.parse(musteriPuani.split('.')[0])
                      ? Icons.star
                      : Icons.star_border,
                  color: index < int.parse(musteriPuani.split('.')[0])
                      ? Colors.amber
                      : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              metin,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductDetails(),
  ));
}

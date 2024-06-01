/*import 'dart:convert'; //JSON verilerini işlemek için kull.
import 'dart:io';

import 'package:flutter/foundation.dart'; //platforma özgü işlemler için kull.
import 'package:flutter/services.dart'; //assets dosy. yükl. için
import 'package:path_provider/path_provider.dart'; //cihazdaki dosy. siste. erişmek için kull.

class CacheSystem {
  //Splash ekran konfigürasyonunu yükleyen method.
  Future<Map<String, dynamic>> getSplashConfig() async {
    // Öncelikle önbellekten veriyi yüklemeye çalışıyoruz
    Map<String, dynamic>? cacheData = await loadJsonFromCache("splash.json");
    if (cacheData == null) {
      // Eğer önbellekte veri yoksa, asset dosyasından yükle.
      Map<String, dynamic> data =
          await loadJsonFromAssets("assets/static/splash.json");
      return data;
    } else {
      // Eğer önbellekte veri varsa, onu döndür.
      return cacheData;
    }
}
// Hakkında (About) konfigürasyonunu yükleyen bir metod.
  Future<Map<String, dynamic>> getAboutConfig() async {
    Map<String, dynamic>? cacheData = await loadJsonFromCache("about.json");
    if (cacheData == null) {
      Map<String, dynamic> data =
          await loadJsonFromAssets("/assets/static/about.json"); ///home/ceylan/Desktop/Flutter_App
      return data;
    } else {
      return cacheData;
    }
  }

  // İletişim (Contact) konfigürasyonunu yükleyen bir metod.
  Future<Map<String, dynamic>> getContactConfig() async {
    Map<String, dynamic>? cacheData = await loadJsonFromCache("contact.json");
    if (cacheData == null) {
      Map<String, dynamic> data =
          await loadJsonFromAssets("assets/static/contact.json");
      return data;
    } else {
      return cacheData;
    }
  }

  // Asset dosyasından JSON verisi yükleyen bir metod.
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    // Dosyanın içeriğini bir string olarak yükler.
    String jsonString = await rootBundle.loadString(filePath);
    // String'i JSON verisine dönüştürür ve döndürür.
    return jsonDecode(jsonString);
  }

  // Önbellekten JSON verisi yükleyen bir metod.
  Future<Map<String, dynamic>?> loadJsonFromCache(String filePath) async {
    // Eğer web platformundaysak, önbellek kullanma.
    if (kIsWeb) {
      return null;
    }
    // Cihazdaki uygulama önbellek dizinini al.
    final Directory appCacheDir = await getApplicationCacheDirectory();
    print(appCacheDir);
    // Dosya yolunu oluştur.
    File file = File("${appCacheDir.path}/$filePath");
    // Eğer dosya mevcutsa, içeriğini okuyup JSON olarak döndür.
    if (file.existsSync()) {
      return jsonDecode(await file.readAsString());
    } else {
      // Dosya yoksa null döndür.
      return null;
    }
  }

  // JSON verisini önbelleğe yazan bir metod.
  writeJsonToCache(String data, String fileName) async {
    // Cihazdaki uygulama önbellek dizinini al.
    final Directory appCacheDir = await getApplicationCacheDirectory();
    // Dosya yolunu oluştur.
    File _file = File("${appCacheDir.path}/$fileName");
    // Veriyi dosyaya yazar.
    _file.writeAsStringSync(data);
  }
}
*/
import 'dart:convert'; // JSON verilerini işlemek için kull.
import 'dart:io';

import 'package:flutter/foundation.dart'; // platforma özgü işlemler için kull.
import 'package:flutter/services.dart'; // assets dosyalarını yüklemek için
import 'package:path_provider/path_provider.dart'; // cihazdaki dosya sistemine erişmek için kull.

class CacheSystem {
  // Splash ekran konfigürasyonunu yükleyen method.
  Future<Map<String, dynamic>> getSplashConfig() async {
    // Öncelikle önbellekten veriyi yüklemeye çalışıyoruz
    Map<String, dynamic>? cacheData = await loadJsonFromCache("splash.json");
    if (cacheData == null) {
      // Eğer önbellekte veri yoksa, asset dosyasından yükle.
      Map<String, dynamic> data =
          await loadJsonFromAssets("assets/static/splash.json");
      return data;
    } else {
      // Eğer önbellekte veri varsa, onu döndür.
      return cacheData;
    }
  }

  // Hakkında (About) konfigürasyonunu yükleyen bir metod.
  Future<Map<String, dynamic>> getAboutConfig() async {
    Map<String, dynamic>? cacheData = await loadJsonFromCache("about.json");
    if (cacheData == null) {
      Map<String, dynamic> data =
          await loadJsonFromAssets("assets/static/about.json");
      return data;
    } else {
      return cacheData;
    }
  }

  // İletişim (Contact) konfigürasyonunu yükleyen bir metod.
  Future<Map<String, dynamic>> getContactConfig() async {
    Map<String, dynamic>? cacheData = await loadJsonFromCache("contact.json");
    if (cacheData == null) {
      Map<String, dynamic> data =
          await loadJsonFromAssets("assets/static/contact.json");
      return data;
    } else {
      return cacheData;
    }
  }

  // Asset dosyasından JSON verisi yükleyen bir metod.
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    // Dosyanın içeriğini bir string olarak yükler.
    String jsonString = await rootBundle.loadString(filePath);
    // String'i JSON verisine dönüştürür ve döndürür.
    return jsonDecode(jsonString);
  }

  // Önbellekten JSON verisi yükleyen bir metod.
  Future<Map<String, dynamic>?> loadJsonFromCache(String filePath) async {
    // Eğer web platformundaysak, önbellek kullanma.
    if (kIsWeb) {
      return null;
    }
    // Cihazdaki uygulama önbellek dizinini al.
    final Directory appCacheDir = await getApplicationCacheDirectory();
    // Dosya yolunu oluştur.
    File file = File("${appCacheDir.path}/$filePath");
    // Eğer dosya mevcutsa, içeriğini okuyup JSON olarak döndür.
    if (file.existsSync()) {
      return jsonDecode(await file.readAsString());
    } else {
      // Dosya yoksa null döndür.
      return null;
    }
  }

  // JSON verisini önbelleğe yazan bir metod.
  writeJsonToCache(String data, String fileName) async {
    // Cihazdaki uygulama önbellek dizinini al.
    final Directory appCacheDir = await getApplicationCacheDirectory();
    // Dosya yolunu oluştur.
    File _file = File("${appCacheDir.path}/$fileName");
    // Veriyi dosyaya yazar.
    _file.writeAsStringSync(data);
  }
}

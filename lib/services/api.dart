/*import 'package:dio/dio.dart';

import '../models/ip.dart';
import '../models/translation.dart';
import '../models/user.dart';

class API {
  final dio = Dio();

  Future<IpInfo> konumBul(String ip) async {
    Response response = await dio.get(
      'https://api.ip2location.io/',
      queryParameters: {'ip': ip},
    );
    return IpInfo.fromJson(response.data);
  }

  Future<List<Translation>> cevir(String word) async {
    Response response =
        await dio.get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');

    List<Translation> ceviriler = [];

    (response.data as List).forEach((element) {
      ceviriler.add(Translation.fromJson(element));
    });

    return ceviriler;
  }

  Future<List<User>> kullanicilar() async {
    Response response = await dio
        .get('https://fakerapi.it/api/v1/users?_quantity=100&_gender=male');

    List<User> kullanicilar = [];

    (response.data["data"] as List).forEach((element) {
      kullanicilar.add(User.fromJson(element));
    });

    return kullanicilar;
  }
}
*/
import 'package:dio/dio.dart';
import '../models/ip.dart';
import '../models/translation.dart';
import '../models/user.dart';

class API {
  final dio = Dio();
  final String baseUrl = 'https://yourapiurl.com'; // Buraya kendi API URL'nizi ekleyin

  Future<IpInfo> konumBul(String ip) async {
    Response response = await dio.get(
      'https://api.ip2location.io/',
      queryParameters: {'ip': ip},
    );
    return IpInfo.fromJson(response.data);
  }

  Future<List<Translation>> cevir(String word) async {
    Response response =
        await dio.get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');

    List<Translation> ceviriler = [];

    (response.data as List).forEach((element) {
      ceviriler.add(Translation.fromJson(element));
    });

    return ceviriler;
  }

  Future<List<User>> kullanicilar() async {
    Response response = await dio
        .get('https://fakerapi.it/api/v1/users?_quantity=100&_gender=male');

    List<User> kullanicilar = [];

    (response.data["data"] as List).forEach((element) {
      kullanicilar.add(User.fromJson(element));
    });

    return kullanicilar;
  }

  Future<User?> register(User user) async {
    try {
      Response response = await dio.post(
        '$baseUrl/register',
        data: user.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 201) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Register error: $e');
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      Response response = await dio.post(
        '$baseUrl/login',
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}

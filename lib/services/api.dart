import 'package:dio/dio.dart';

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

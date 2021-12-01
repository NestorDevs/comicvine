import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../config/constants/endpoints.dart';

part 'comics_services.g.dart';

@Injectable()
class ComicsServices {
  late Dio dio;

  ComicsServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 5 * 1000);
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllComics() async {
    try {
      Response response = await dio.get(getComics);
      log(response.data['results'].toString());

      final results = response.data['results'];

      return results;
    } catch (e) {
      print('ESTAMOS EN ERRORRRRR');
      log(e.toString());
      return [];
    }
  }
}

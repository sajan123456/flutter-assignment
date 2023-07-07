import 'package:dio/dio.dart';

import '../models/products.dart';

class Api {
  static String baseApi = 'https://fakestoreapi.com/products';
}

class ApiService {
  static Future<List<Products>> getProducts() async {
    final dio = Dio();
    try {
      final response = await dio.get(Api.baseApi);

      final data =
          (response.data as List).map((e) => Products.fromJson(e)).toList();

      return data;
    } on DioException catch (err) {
      print(err);
      return [];
    }
  }
}

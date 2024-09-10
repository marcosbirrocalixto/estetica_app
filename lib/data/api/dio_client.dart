import 'package:dio/dio.dart';

import '../../data/api/interceptors/dio_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = dioInterceptor();
  }

  Future<dynamic> get(String url) async {
    try {
      final Response response = await _dio.get(url);
      print(response);

      return response.data;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> post(
      String url, formData, Map<String, dynamic> queryParameters) async {
    try {
      final Response response = await _dio.post(url,
          data: formData, queryParameters: queryParameters);

      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

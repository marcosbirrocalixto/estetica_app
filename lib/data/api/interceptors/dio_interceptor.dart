import 'package:dio/dio.dart';

import '../../../constantes/api.dart';

Dio dioInterceptor() {
  Dio dio = Dio();
    dio.options.baseUrl = API_URL;
    dio.options.connectTimeout = Duration(seconds: API_CONNECTION_TIMEOUT);
    dio.options.receiveTimeout = Duration(seconds: API_RECEIVE_TIMEOPUT);
  return dio;
}

import '../../data/api/dio_client.dart';

class FiltroRepository {
  var _httpClient;

  FiltroRepository() {
    _httpClient = DioClient();
  }

  Future<List<dynamic>> getFiltros() async {
    final response =
        await _httpClient.get('/filtros/pegarFiltros/');
    print(response);

    return (response as List).toList();
  }
}

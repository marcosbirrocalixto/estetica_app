import '../../data/api/dio_client.dart';

class ServiceRepository {
  var _httpClient;

  ServiceRepository() {
    _httpClient = DioClient();
  }

  Future<List<dynamic>> getServices(String numeroOrdem) async {
    final response =
        await _httpClient.get('/servicos/pegarServicos/$numeroOrdem');
    print(response);

    return (response as List).toList();
  }
}

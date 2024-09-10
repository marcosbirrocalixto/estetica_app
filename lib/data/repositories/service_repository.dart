import '../../data/api/dio_client.dart';
import '../../models/servico_model.dart';

class ServiceRepository {
  var _httpClient;

  ServiceRepository() {
    _httpClient = DioClient();
  }

  Future<List<dynamic>> getServices(String numeroOrdem) async {
    final response = await _httpClient
        .get('/ordem/pegarServicos/$numeroOrdem');
    print(response);
    final _services = (response as List).map((service) {
      return ServicoModel.fromJson(service);
    }).toList();

    return _services;
  }
}

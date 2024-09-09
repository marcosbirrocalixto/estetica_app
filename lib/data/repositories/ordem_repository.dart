import '../../data/api/dio_client.dart';
import '../../models/ordem_model.dart';

class OrdemRepository {
  var _httpClient;

  OrdemRepository() {
    _httpClient = new DioClient();
  }

  Future<List<OrdemModel>> getOrdens() async {
    final response = await _httpClient.get('/ordem/pegarOrdens/RME4J27');
    final _ordens = (response.data as List).map((ordem) {
      //(response.data as List).map((ordem) => OrdemModel.fromJson(ordem).toList();
      //_ordens.add(OrdemModel.fromJson(ordem));
      //print("-------------------------------------");
      return OrdemModel.fromJson(ordem);
    }).toList();

    return _ordens;
  }
}

import '../../data/api/dio_client.dart';

class EvaluationRepository {
  var _httpClient;

  EvaluationRepository() {
    _httpClient = DioClient();
  }

  Future evaluationOrdem(String numeroOrdem, int stars, {String ?comments}) async {
    final response =
        await _httpClient.post("/ordem/$numeroOrdem/gravarEvaluation/",
        formData: {
          'ordem_id': numeroOrdem,
          'stars': stars,
          'comments':  comments ?? '',
        });
 
    return (response as List).toList();
  }
}
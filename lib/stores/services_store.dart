import 'package:mobx/mobx.dart';

import '../../models/servico_model.dart';
import '../../data/repositories/service_repository.dart';

part 'services_store.g.dart';

class ServicesStore = _ServicesStoreBase with _$ServicesStore;

abstract class _ServicesStoreBase with Store {
  ServiceRepository _serviceRepository = ServiceRepository();

  @observable
  ObservableList<ServicoModel> services = ObservableList<ServicoModel>();

  @action
  void addService(ServicoModel service) {
    services.add(service);
  }

  @action
  void removeService(ServicoModel service) {
    services.remove(service);
  }

  @action
  void cleanServices() {
    services.clear();
  }

  @action
  void addAllServices(List<ServicoModel> services) {
    services.addAll(services);
  }

  @action
  Future getServices(String numeroOrdem) async {
    final response = await _serviceRepository.getServices(numeroOrdem);

    response.map((service) {
      return addService(ServicoModel.fromJson(service));
    }).toList();
  }
}

import 'package:mobx/mobx.dart';

import '../../data/repositories/service_repository.dart';
import '../../models/servico_model.dart';

part 'services_store.g.dart';

class ServicesStore = _ServicesStoreBase with _$ServicesStore;

abstract class _ServicesStoreBase with Store {
  ServiceRepository _serviceRepository = ServiceRepository();

  @observable
  ObservableList<ServicoModel> services = ObservableList<ServicoModel>();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

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
    setLoading(true);
    final response = await _serviceRepository.getServices(numeroOrdem);

    response
        .map((service) => addService(ServicoModel.fromJson(service)))
        .toList();

    setLoading(false);
  }
}

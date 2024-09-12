import 'package:mobx/mobx.dart';

import '../../data/repositories/ordem_repository.dart';
import '../../data/repositories/evaluation_repository.dart';

import '../../models/ordem_model.dart';

part 'ordens_store.g.dart';

class OrdensStore = _OrdensStoreBase with _$OrdensStore;

abstract class _OrdensStoreBase with Store {
  OrdemRepository _ordemRepository = OrdemRepository();
  EvaluationRepository _evaluationRepository = EvaluationRepository();

  @observable
  late OrdemModel ordem;

  @action
  void setOrdem(OrdemModel value) => ordem = value;

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => isLoading = value;

  @observable
  ObservableList<OrdemModel> ordems = ObservableList<OrdemModel>();

  @action
  void addOrdem(OrdemModel ordem) {
    ordems.add(ordem);
  }

  @action
  void removeOrdem(OrdemModel ordem) {
    ordems.remove(ordem);
  }

  @action
  void clearOrdem() {
    ordems.clear();
  }

/*
  @action
  Future getOrdens() async {
    clearOrdem();
    setLoading(true);
    final response = await _ordemRepository.getOrdens();

    response
        .map((ordemJson) => addOrdem(OrdemModel.fromJson(ordemJson)))
        .toList();

    setLoading(false);
  }
  */

  @action
  Future evaluationOrdem(String numeroOrdem, int stars, {String ?comments}) async {
    isLoading = true;
    await _evaluationRepository.evaluationOrdem(numeroOrdem, stars, comments: comments);

    isLoading = false;
  }
}

import 'package:mobx/mobx.dart';

import '../../models/filtro_model.dart';
import '../../data/repositories/filtro_repository.dart';

part 'filtros_store.g.dart';

class FiltrosStore = _FiltrosStoreBase with _$FiltrosStore;
  FiltroRepository _filtroRepository = FiltroRepository();

abstract class _FiltrosStoreBase with Store {
  @observable
  ObservableList<FiltroModel> filtros = ObservableList<FiltroModel>();

  @observable
  bool isLoading = false;

  @action
  setLoading(bool value) => isLoading = value;

  @action
  void addFiltro(FiltroModel filtro) {
    filtros.add(filtro);
  }

  @action
  void removeFiltro(FiltroModel filtro) {
    filtros.remove(filtro);
  }

  @action
  void clearFiltro(FiltroModel filtro) {
    filtros.clear();
  }

  @action
  Future getFiltros() async {
    setLoading(true);
    final response = await _filtroRepository.getFiltros();

    response
        .map((filtroJson) => addFiltro(FiltroModel.fromJson(filtroJson)))
        .toList();

    setLoading(false);
  }
}

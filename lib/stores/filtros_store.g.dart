// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtros_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FiltrosStore on _FiltrosStoreBase, Store {
  late final _$filtrosAtom =
      Atom(name: '_FiltrosStoreBase.filtros', context: context);

  @override
  ObservableList<FiltroModel> get filtros {
    _$filtrosAtom.reportRead();
    return super.filtros;
  }

  @override
  set filtros(ObservableList<FiltroModel> value) {
    _$filtrosAtom.reportWrite(value, super.filtros, () {
      super.filtros = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FiltrosStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getFiltrosAsyncAction =
      AsyncAction('_FiltrosStoreBase.getFiltros', context: context);

  @override
  Future<dynamic> getFiltros() {
    return _$getFiltrosAsyncAction.run(() => super.getFiltros());
  }

  late final _$_FiltrosStoreBaseActionController =
      ActionController(name: '_FiltrosStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_FiltrosStoreBaseActionController.startAction(
        name: '_FiltrosStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_FiltrosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFiltro(FiltroModel filtro) {
    final _$actionInfo = _$_FiltrosStoreBaseActionController.startAction(
        name: '_FiltrosStoreBase.addFiltro');
    try {
      return super.addFiltro(filtro);
    } finally {
      _$_FiltrosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFiltro(FiltroModel filtro) {
    final _$actionInfo = _$_FiltrosStoreBaseActionController.startAction(
        name: '_FiltrosStoreBase.removeFiltro');
    try {
      return super.removeFiltro(filtro);
    } finally {
      _$_FiltrosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFiltro(FiltroModel filtro) {
    final _$actionInfo = _$_FiltrosStoreBaseActionController.startAction(
        name: '_FiltrosStoreBase.clearFiltro');
    try {
      return super.clearFiltro(filtro);
    } finally {
      _$_FiltrosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtros: ${filtros},
isLoading: ${isLoading}
    ''';
  }
}

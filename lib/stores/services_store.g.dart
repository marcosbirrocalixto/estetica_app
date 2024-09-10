// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServicesStore on _ServicesStoreBase, Store {
  late final _$servicesAtom =
      Atom(name: '_ServicesStoreBase.services', context: context);

  @override
  ObservableList<ServicoModel> get services {
    _$servicesAtom.reportRead();
    return super.services;
  }

  @override
  set services(ObservableList<ServicoModel> value) {
    _$servicesAtom.reportWrite(value, super.services, () {
      super.services = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ServicesStoreBase.isLoading', context: context);

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

  late final _$getServicesAsyncAction =
      AsyncAction('_ServicesStoreBase.getServices', context: context);

  @override
  Future<dynamic> getServices(String numeroOrdem) {
    return _$getServicesAsyncAction.run(() => super.getServices(numeroOrdem));
  }

  late final _$_ServicesStoreBaseActionController =
      ActionController(name: '_ServicesStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ServicesStoreBaseActionController.startAction(
        name: '_ServicesStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ServicesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addService(ServicoModel service) {
    final _$actionInfo = _$_ServicesStoreBaseActionController.startAction(
        name: '_ServicesStoreBase.addService');
    try {
      return super.addService(service);
    } finally {
      _$_ServicesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeService(ServicoModel service) {
    final _$actionInfo = _$_ServicesStoreBaseActionController.startAction(
        name: '_ServicesStoreBase.removeService');
    try {
      return super.removeService(service);
    } finally {
      _$_ServicesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanServices() {
    final _$actionInfo = _$_ServicesStoreBaseActionController.startAction(
        name: '_ServicesStoreBase.cleanServices');
    try {
      return super.cleanServices();
    } finally {
      _$_ServicesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllServices(List<ServicoModel> services) {
    final _$actionInfo = _$_ServicesStoreBaseActionController.startAction(
        name: '_ServicesStoreBase.addAllServices');
    try {
      return super.addAllServices(services);
    } finally {
      _$_ServicesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
services: ${services},
isLoading: ${isLoading}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordens_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdensStore on _OrdensStoreBase, Store {
  late final _$ordemAtom =
      Atom(name: '_OrdensStoreBase.ordem', context: context);

  @override
  OrdemModel get ordem {
    _$ordemAtom.reportRead();
    return super.ordem;
  }

  bool _ordemIsInitialized = false;

  @override
  set ordem(OrdemModel value) {
    _$ordemAtom.reportWrite(value, _ordemIsInitialized ? super.ordem : null,
        () {
      super.ordem = value;
      _ordemIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_OrdensStoreBase.isLoading', context: context);

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

  late final _$ordemsAtom =
      Atom(name: '_OrdensStoreBase.ordems', context: context);

  @override
  ObservableList<OrdemModel> get ordems {
    _$ordemsAtom.reportRead();
    return super.ordems;
  }

  @override
  set ordems(ObservableList<OrdemModel> value) {
    _$ordemsAtom.reportWrite(value, super.ordems, () {
      super.ordems = value;
    });
  }

  late final _$evaluationOrdemAsyncAction =
      AsyncAction('_OrdensStoreBase.evaluationOrdem', context: context);

  @override
  Future<dynamic> evaluationOrdem(String numeroOrdem, int stars,
      {String? comments}) {
    return _$evaluationOrdemAsyncAction.run(
        () => super.evaluationOrdem(numeroOrdem, stars, comments: comments));
  }

  late final _$_OrdensStoreBaseActionController =
      ActionController(name: '_OrdensStoreBase', context: context);

  @override
  void setOrdem(OrdemModel value) {
    final _$actionInfo = _$_OrdensStoreBaseActionController.startAction(
        name: '_OrdensStoreBase.setOrdem');
    try {
      return super.setOrdem(value);
    } finally {
      _$_OrdensStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_OrdensStoreBaseActionController.startAction(
        name: '_OrdensStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_OrdensStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOrdem(OrdemModel ordem) {
    final _$actionInfo = _$_OrdensStoreBaseActionController.startAction(
        name: '_OrdensStoreBase.addOrdem');
    try {
      return super.addOrdem(ordem);
    } finally {
      _$_OrdensStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOrdem(OrdemModel ordem) {
    final _$actionInfo = _$_OrdensStoreBaseActionController.startAction(
        name: '_OrdensStoreBase.removeOrdem');
    try {
      return super.removeOrdem(ordem);
    } finally {
      _$_OrdensStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearOrdem() {
    final _$actionInfo = _$_OrdensStoreBaseActionController.startAction(
        name: '_OrdensStoreBase.clearOrdem');
    try {
      return super.clearOrdem();
    } finally {
      _$_OrdensStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ordem: ${ordem},
isLoading: ${isLoading},
ordems: ${ordems}
    ''';
  }
}

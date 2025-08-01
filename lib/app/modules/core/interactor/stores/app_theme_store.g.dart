// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppThemeStore on AppThemeStoreBase, Store {
  Computed<bool>? _$isLightComputed;

  @override
  bool get isLight => (_$isLightComputed ??= Computed<bool>(
    () => super.isLight,
    name: 'AppThemeStoreBase.isLight',
  )).value;

  late final _$themeStateAtom = Atom(
    name: 'AppThemeStoreBase.themeState',
    context: context,
  );

  @override
  AppThemeState get themeState {
    _$themeStateAtom.reportRead();
    return super.themeState;
  }

  @override
  set themeState(AppThemeState value) {
    _$themeStateAtom.reportWrite(value, super.themeState, () {
      super.themeState = value;
    });
  }

  late final _$changeThemeAsyncAction = AsyncAction(
    'AppThemeStoreBase.changeTheme',
    context: context,
  );

  @override
  Future<void> changeTheme() {
    return _$changeThemeAsyncAction.run(() => super.changeTheme());
  }

  late final _$loadThemeAsyncAction = AsyncAction(
    'AppThemeStoreBase.loadTheme',
    context: context,
  );

  @override
  Future<void> loadTheme() {
    return _$loadThemeAsyncAction.run(() => super.loadTheme());
  }

  @override
  String toString() {
    return '''
themeState: ${themeState},
isLight: ${isLight}
    ''';
  }
}

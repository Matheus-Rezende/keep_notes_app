// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_color_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppThemeColorStore on AppThemeColorStoreBase, Store {
  late final _$colorThemeStateAtom = Atom(
    name: 'AppThemeColorStoreBase.colorThemeState',
    context: context,
  );

  @override
  AppColorThemeState get colorThemeState {
    _$colorThemeStateAtom.reportRead();
    return super.colorThemeState;
  }

  @override
  set colorThemeState(AppColorThemeState value) {
    _$colorThemeStateAtom.reportWrite(value, super.colorThemeState, () {
      super.colorThemeState = value;
    });
  }

  late final _$changePinkColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changePinkColorTheme',
    context: context,
  );

  @override
  Future<void> changePinkColorTheme() {
    return _$changePinkColorThemeAsyncAction.run(
      () => super.changePinkColorTheme(),
    );
  }

  late final _$changeRedColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeRedColorTheme',
    context: context,
  );

  @override
  Future<void> changeRedColorTheme() {
    return _$changeRedColorThemeAsyncAction.run(
      () => super.changeRedColorTheme(),
    );
  }

  late final _$changeGreenColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeGreenColorTheme',
    context: context,
  );

  @override
  Future<void> changeGreenColorTheme() {
    return _$changeGreenColorThemeAsyncAction.run(
      () => super.changeGreenColorTheme(),
    );
  }

  late final _$changeYellowColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeYellowColorTheme',
    context: context,
  );

  @override
  Future<void> changeYellowColorTheme() {
    return _$changeYellowColorThemeAsyncAction.run(
      () => super.changeYellowColorTheme(),
    );
  }

  late final _$changeBlueColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeBlueColorTheme',
    context: context,
  );

  @override
  Future<void> changeBlueColorTheme() {
    return _$changeBlueColorThemeAsyncAction.run(
      () => super.changeBlueColorTheme(),
    );
  }

  late final _$changePurpleColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changePurpleColorTheme',
    context: context,
  );

  @override
  Future<void> changePurpleColorTheme() {
    return _$changePurpleColorThemeAsyncAction.run(
      () => super.changePurpleColorTheme(),
    );
  }

  late final _$changeCyanColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeCyanColorTheme',
    context: context,
  );

  @override
  Future<void> changeCyanColorTheme() {
    return _$changeCyanColorThemeAsyncAction.run(
      () => super.changeCyanColorTheme(),
    );
  }

  late final _$changeOrangeColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.changeOrangeColorTheme',
    context: context,
  );

  @override
  Future<void> changeOrangeColorTheme() {
    return _$changeOrangeColorThemeAsyncAction.run(
      () => super.changeOrangeColorTheme(),
    );
  }

  late final _$loadColorThemeAsyncAction = AsyncAction(
    'AppThemeColorStoreBase.loadColorTheme',
    context: context,
  );

  @override
  Future<void> loadColorTheme() {
    return _$loadColorThemeAsyncAction.run(() => super.loadColorTheme());
  }

  @override
  String toString() {
    return '''
colorThemeState: ${colorThemeState}
    ''';
  }
}

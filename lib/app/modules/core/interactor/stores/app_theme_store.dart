import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage.dart';
import 'package:keep_notes_app/app/modules/core/interactor/states/app_theme_state.dart';
import 'package:mobx/mobx.dart';

part 'app_theme_store.g.dart';

class AppThemeStore = AppThemeStoreBase with _$AppThemeStore;

abstract class AppThemeStoreBase with Store {
  final LocalStorage localStorage;

  AppThemeStoreBase({required this.localStorage});

  @observable
  AppThemeState themeState = AppThemeLightState();

  @computed
  bool get isLight => themeState is AppThemeLightState;

  final String themeKey = "isDarkTheme";

  @action
  Future<void> changeTheme() async {
    if (themeState is AppThemeLightState) {
      themeState = themeState.darkTheme();
      localStorage.setItem(key: themeKey, value: true);
    } else if (themeState is AppThemeDarkState) {
      themeState = themeState.lightTheme();
      localStorage.setItem(key: themeKey, value: false);
    }
  }

  @action
  Future<void> loadTheme() async {
    if (await localStorage.contains(key: themeKey) && await localStorage.getItem(key: themeKey)) {
      themeState = themeState.darkTheme();
    }
  }
}

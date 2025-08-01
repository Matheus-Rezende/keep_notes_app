import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage.dart';
import 'package:keep_notes_app/app/modules/core/interactor/states/app_color_theme_state.dart';
import 'package:mobx/mobx.dart';

part 'app_theme_color_store.g.dart';

class AppThemeColorStore = AppThemeColorStoreBase with _$AppThemeColorStore;

abstract class AppThemeColorStoreBase with Store {
  final LocalStorage localStorage;

  AppThemeColorStoreBase({required this.localStorage});

  @observable
  AppColorThemeState colorThemeState = AppColorThemeDefaultState();

  String themeColorKey = 'isDefaultColorTheme';

  @action
  Future<void> changePinkColorTheme() async {
    colorThemeState = colorThemeState.colorPinkTheme();
    themeColorKey = 'isPinkColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> changeRedColorTheme() async {
    colorThemeState = colorThemeState.colorRedTheme();
    themeColorKey = 'isRedColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> changeGreenColorTheme() async {
    colorThemeState = colorThemeState.colorGreenTheme();
    themeColorKey = 'isGreenColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> changeYellowColorTheme() async {
    colorThemeState = colorThemeState.colorYellowTheme();
    themeColorKey = 'isYellowColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> changeBlueColorTheme() async {
    colorThemeState = colorThemeState.colorBlueTheme();
    themeColorKey = 'isBlueColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> changeCyanColorTheme() async {
    colorThemeState = colorThemeState.colorCyanTheme();
    themeColorKey = 'isCyanColorTheme';
    await localStorage.setItem(key: themeColorKey, value: true);
    await localStorage.setItem(key: 'currentColorKey', value: themeColorKey);
  }

  @action
  Future<void> loadColorTheme() async {
    final savedKey = await localStorage.getItem(key: 'currentColorKey');

    if (savedKey != null && await localStorage.contains(key: savedKey)) {
      themeColorKey = savedKey;

      switch (themeColorKey) {
        case 'isPinkColorTheme':
          colorThemeState = colorThemeState.colorPinkTheme();
          break;
        case 'isRedColorTheme':
          colorThemeState = colorThemeState.colorRedTheme();
          break;
        case 'isGreenColorTheme':
          colorThemeState = colorThemeState.colorGreenTheme();
          break;
        case 'isYellowColorTheme':
          colorThemeState = colorThemeState.colorYellowTheme();
          break;
        case 'isBlueColorTheme':
          colorThemeState = colorThemeState.colorBlueTheme();
          break;

        case 'isCyanColorTheme':
          colorThemeState = colorThemeState.colorCyanTheme();
          break;

        default:
          colorThemeState = colorThemeState.colorDefaultTheme();
      }
    } else {
      colorThemeState = colorThemeState.colorDefaultTheme();
      themeColorKey = 'isDefaultColorTheme';
    }
  }
}

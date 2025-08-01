import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage.dart';
import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage_shared_impl.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_color_store.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_store.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(AppTheme());
    i.addLazySingleton<LocalStorage>(LocalStorageSharedImpl.new);
    i.addLazySingleton(AppThemeStore.new);
    i.addLazySingleton(AppThemeColorStore.new);

    super.exportedBinds(i);
  }
}

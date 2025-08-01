import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/core_module.dart';
import 'package:keep_notes_app/app/modules/notes/notes_module.dart';
import 'package:keep_notes_app/app/modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //  i.addLazySingleton(CoreStore.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: NotesModule());
    r.module('/settings', module: SettingsModule());
    super.routes(r);
  }
}

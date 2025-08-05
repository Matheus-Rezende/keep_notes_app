import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/core_module.dart';
import 'package:keep_notes_app/app/modules/settings/presentation/pages/settings_page.dart';

class SettingsModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => SettingsPage(), transition: TransitionType.fadeIn);
    super.routes(r);
  }
}

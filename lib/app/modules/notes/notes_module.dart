import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/core_module.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/pages/create_note_page.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/pages/notes_page.dart';

class NotesModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => NotesPage());
    r.child('/create-note', child: (context) => CreateNotePage());

    super.routes(r);
  }
}

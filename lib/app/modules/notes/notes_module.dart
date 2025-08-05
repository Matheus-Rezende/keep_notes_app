import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/core_module.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/pages/note_editor_page.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/pages/notes_page.dart';

class NotesModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(NoteStore.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => NotesPage(), transition: TransitionType.fadeIn);
    r.child('/note-editor', child: (context) => NoteEditorPage(), transition: TransitionType.fadeIn);

    super.routes(r);
  }
}

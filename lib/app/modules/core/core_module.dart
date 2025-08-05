import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/data/repositories/note_repository_impl.dart';
import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage.dart';
import 'package:keep_notes_app/app/modules/core/data/services/local_storage/local_storage_shared_impl.dart';
import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/datasource/notes_local_datasource.dart';
import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/datasource/notes_local_datasource_impl.dart';
import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/drift_database.dart';
import 'package:keep_notes_app/app/modules/core/domain/repositories/note_repository.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/delete_note_usecase.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/get_notes_usecase.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/save_note_usecase.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_color_store.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_store.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(AppTheme());
    i.addLazySingleton<LocalStorage>(LocalStorageSharedImpl.new);
    i.addSingleton<NoteLocalDatasource>(NoteLocalDatasourceImpl.new);
    i.addSingleton<DfDatabase>(DfDatabase.new);
    i.addSingleton<NoteRepository>(NoteRepositoryImpl.new);
    i.addSingleton(SaveNoteUseCase.new);
    i.addSingleton(DeleteNoteUseCase.new);
    i.addSingleton(GetNotesUsecase.new);
    i.addLazySingleton(AppThemeStore.new);
    i.addLazySingleton(AppThemeColorStore.new);

    super.exportedBinds(i);
  }
}

// data/repositories/note_repository_impl.dart
import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/datasource/notes_local_datasource.dart';
import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';
import 'package:keep_notes_app/app/modules/core/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDatasource datasource;

  NoteRepositoryImpl(this.datasource);

  @override
  Future<List<NoteEntity>> getNotes() => datasource.getNotes();

  @override
  Future<void> saveNote(NoteEntity note) async {
    if (note.id == null) {
      await datasource.createNote(note);
    } else {
      await datasource.updateNote(note);
    }
  }

  @override
  Future<void> deleteNote(int id) => datasource.deleteNote(id);
}

import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';

abstract interface class NoteRepository {
  Future<List<NoteEntity>> getNotes();
  Future<void> saveNote(NoteEntity note);
  Future<void> deleteNote(int id);
}

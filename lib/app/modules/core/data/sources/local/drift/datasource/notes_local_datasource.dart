import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';

abstract interface class NoteLocalDatasource {
  Future<List<NoteEntity>> getNotes();
  Future<NoteEntity?> getNoteById(int id);
  Future<int> createNote(NoteEntity note);
  Future<int> updateNote(NoteEntity note);
  Future<int> deleteNote(int id);
}

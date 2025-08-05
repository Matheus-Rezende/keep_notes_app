import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/drift_database.dart';
import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';
import '../mappers/note_dto_mapper.dart';
import 'notes_local_datasource.dart';

class NoteLocalDatasourceImpl implements NoteLocalDatasource {
  final DfDatabase db;

  NoteLocalDatasourceImpl(this.db);

  @override
  Future<List<NoteEntity>> getNotes() async {
    final result = await db.select(db.noteTable).get();
    return result.map((row) => row.toEntity()).toList();
  }

  @override
  Future<NoteEntity?> getNoteById(int id) async {
    final query = await (db.select(db.noteTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return query?.toEntity();
  }

  @override
  Future<int> createNote(NoteEntity note) async {
    return await db.into(db.noteTable).insert(note.toCompanion());
  }

  @override
  Future<int> updateNote(NoteEntity note) async {
    if (note.id == null) {
      throw ArgumentError('ID não pode ser nulo para atualização.');
    }

    return await (db.update(db.noteTable)..where((tbl) => tbl.id.equals(note.id!))) // uso do !
        .write(note.toCompanion());
  }

  @override
  Future<int> deleteNote(int id) async {
    return await (db.delete(db.noteTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}

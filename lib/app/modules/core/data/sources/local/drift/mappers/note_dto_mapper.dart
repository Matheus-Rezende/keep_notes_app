import 'package:keep_notes_app/app/modules/core/data/sources/local/drift/drift_database.dart';
import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';
import 'package:drift/drift.dart';

extension NoteEntityMapper on NoteEntity {
  NoteTableCompanion toCompanion() {
    return NoteTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      title: Value(title),
      content: Value(content),
      contentJson: Value(contentJson), // adicionado aqui
      createdAt: Value(createdAt),
    );
  }
}

extension NoteRowMapper on NoteTableData {
  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      content: content,
      contentJson: contentJson, // adicionado aqui
      createdAt: createdAt,
    );
  }
}

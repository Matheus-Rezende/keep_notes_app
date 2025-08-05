import '../../domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    super.id,
    required super.title,
    required super.content,
    required super.contentJson,
    required super.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'] as int?,
      title: json['title'],
      content: json['content'],
      contentJson: json['contentJson'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'contentJson': contentJson,
    'createdAt': createdAt.toIso8601String(),
  };

  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      contentJson: entity.contentJson,
      createdAt: entity.createdAt,
    );
  }

  NoteEntity toEntity() {
    return NoteEntity(id: id, title: title, content: content, contentJson: contentJson, createdAt: createdAt);
  }
}

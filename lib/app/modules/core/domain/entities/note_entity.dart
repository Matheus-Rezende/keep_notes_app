class NoteEntity {
  final int? id;
  final String title;
  final String content;
  final String contentJson;
  final DateTime createdAt;

  const NoteEntity({
    this.id,
    required this.title,
    required this.content,
    required this.contentJson,
    required this.createdAt,
  });
}

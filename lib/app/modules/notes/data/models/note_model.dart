class NoteModel {
  final String title;
  final String jsonContent;
  final DateTime createIn;

  NoteModel({required this.title, required this.jsonContent, required this.createIn});

  Map<String, dynamic> toMap() {
    return {'title': title, 'jsonContent': jsonContent, 'createIn': createIn.toIso8601String()};
  }
}

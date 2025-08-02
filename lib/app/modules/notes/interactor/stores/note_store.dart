import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:mobx/mobx.dart';
part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  @observable
  String titleValue = '';

  @observable
  QuillController quillController = QuillController.basic();

  @action
  void setTitle(String value) => titleValue = value;

  @computed
  String get jsonContent => jsonEncode(quillController.document.toDelta().toJson());

  Map<String, dynamic> toMap() => {
    'title': titleValue,
    'jsonContent': jsonContent,
    'createIn': DateTime.now().toIso8601String(),
  };
}

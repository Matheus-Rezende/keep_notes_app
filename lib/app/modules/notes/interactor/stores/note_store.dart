// interactor/stores/note_store.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:keep_notes_app/app/modules/core/domain/entities/note_entity.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/delete_note_usecase.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/get_notes_usecase.dart';
import 'package:keep_notes_app/app/modules/core/domain/usecases/save_note_usecase.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';

part 'note_store.g.dart';

class NoteStore = NoteStoreBase with _$NoteStore;

abstract class NoteStoreBase with Store {
  final GetNotesUsecase _getNotes;
  final SaveNoteUseCase _saveNote;
  final DeleteNoteUseCase _deleteNote;

  NoteStoreBase(this._getNotes, this._saveNote, this._deleteNote);

  @observable
  ObservableList<NoteEntity> notes = ObservableList();

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @observable
  quill.QuillController controller = quill.QuillController.basic();

  @observable
  NoteEntity? originalNote;

  @observable
  String? errorMessage;

  @computed
  bool get hasChanged {
    final currentPlain = controller.document.toPlainText().trim();
    final originalPlain = originalNote?.content ?? '';
    return title != (originalNote?.title ?? '') || currentPlain != originalPlain;
  }

  @computed
  bool get titleIsEmpty => title.trim().isEmpty;

  @action
  Future<void> loadNotes() async {
    final result = await _getNotes();
    notes = ObservableList.of(result);
  }

  @action
  Future<bool> saveCurrentNote() async {
    final trimmedTitle = title.trim();

    final jsonContent = jsonEncode(controller.document.toDelta().toJson());

    final note = NoteEntity(
      id: originalNote?.id, // Se tiver id, edita. Se for null, cria nova.
      title: trimmedTitle,
      content: controller.document.toPlainText().trim(),
      contentJson: jsonContent,
      createdAt: originalNote?.createdAt ?? DateTime.now(),
    );

    if (titleIsEmpty) {
      errorMessage = 'O titulo não pode ser vazio!';
      return false;
    }

    await _saveNote(note); // Repositório decide entre insert/update
    await loadNotes(); // Atualiza a lista de notas na tela
    originalNote = note; // Atualiza o estado interno da nota atual
    errorMessage = null;

    return true;
  }

  @action
  Future<void> deleteNote(int id) async {
    await _deleteNote(id);
    await loadNotes();
  }

  @action
  void setNoteFromJson({required String title, required String contentJson, int? id}) {
    this.title = title;

    try {
      final deltaJson = jsonDecode(contentJson);
      controller = quill.QuillController(
        document: quill.Document.fromJson(deltaJson),
        selection: const TextSelection.collapsed(offset: 0),
      );

      originalNote = NoteEntity(
        id: id, // <- aqui está o diferencial!
        title: title,
        content: '',
        contentJson: contentJson,
        createdAt: DateTime.now(), // ou preserve o valor original se desejar
      );
    } catch (e) {
      errorMessage = 'Erro ao carregar o conteúdo da nota.';
    }
  }

  @action
  void setNote(NoteEntity note) {
    originalNote = note;
    title = note.title;

    quill.Document doc;

    try {
      final deltaList = jsonDecode(note.contentJson) as List<dynamic>;
      doc = quill.Document.fromJson(deltaList);
    } catch (e) {
      doc = quill.Document()..insert(0, note.content);
    }

    controller = quill.QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
  }

  @action
  void clear() {
    originalNote = null;
    title = '';
    controller = quill.QuillController.basic();
    errorMessage = null;
  }
}

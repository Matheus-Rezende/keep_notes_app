// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on NoteStoreBase, Store {
  Computed<bool>? _$hasChangedComputed;

  @override
  bool get hasChanged => (_$hasChangedComputed ??= Computed<bool>(
    () => super.hasChanged,
    name: 'NoteStoreBase.hasChanged',
  )).value;
  Computed<bool>? _$titleIsEmptyComputed;

  @override
  bool get titleIsEmpty => (_$titleIsEmptyComputed ??= Computed<bool>(
    () => super.titleIsEmpty,
    name: 'NoteStoreBase.titleIsEmpty',
  )).value;

  late final _$notesAtom = Atom(name: 'NoteStoreBase.notes', context: context);

  @override
  ObservableList<NoteEntity> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteEntity> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$titleAtom = Atom(name: 'NoteStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$controllerAtom = Atom(
    name: 'NoteStoreBase.controller',
    context: context,
  );

  @override
  quill.QuillController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(quill.QuillController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$originalNoteAtom = Atom(
    name: 'NoteStoreBase.originalNote',
    context: context,
  );

  @override
  NoteEntity? get originalNote {
    _$originalNoteAtom.reportRead();
    return super.originalNote;
  }

  @override
  set originalNote(NoteEntity? value) {
    _$originalNoteAtom.reportWrite(value, super.originalNote, () {
      super.originalNote = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: 'NoteStoreBase.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadNotesAsyncAction = AsyncAction(
    'NoteStoreBase.loadNotes',
    context: context,
  );

  @override
  Future<void> loadNotes() {
    return _$loadNotesAsyncAction.run(() => super.loadNotes());
  }

  late final _$saveCurrentNoteAsyncAction = AsyncAction(
    'NoteStoreBase.saveCurrentNote',
    context: context,
  );

  @override
  Future<bool> saveCurrentNote() {
    return _$saveCurrentNoteAsyncAction.run(() => super.saveCurrentNote());
  }

  late final _$deleteNoteAsyncAction = AsyncAction(
    'NoteStoreBase.deleteNote',
    context: context,
  );

  @override
  Future<void> deleteNote(int id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  late final _$NoteStoreBaseActionController = ActionController(
    name: 'NoteStoreBase',
    context: context,
  );

  @override
  void setTitle(String value) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
      name: 'NoteStoreBase.setTitle',
    );
    try {
      return super.setTitle(value);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNoteFromJson({
    required String title,
    required String contentJson,
    int? id,
  }) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
      name: 'NoteStoreBase.setNoteFromJson',
    );
    try {
      return super.setNoteFromJson(
        title: title,
        contentJson: contentJson,
        id: id,
      );
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(NoteEntity note) {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
      name: 'NoteStoreBase.setNote',
    );
    try {
      return super.setNote(note);
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$NoteStoreBaseActionController.startAction(
      name: 'NoteStoreBase.clear',
    );
    try {
      return super.clear();
    } finally {
      _$NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
title: ${title},
controller: ${controller},
originalNote: ${originalNote},
errorMessage: ${errorMessage},
hasChanged: ${hasChanged},
titleIsEmpty: ${titleIsEmpty}
    ''';
  }
}

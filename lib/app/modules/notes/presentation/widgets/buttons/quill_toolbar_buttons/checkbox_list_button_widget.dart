import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class CheckboxListButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.check_box),
      tooltip: 'Lista checkBox',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isChecklist = attrs[Attribute.list.key]?.value == 'unchecked';

        controller.formatSelection(isChecklist ? Attribute.clone(Attribute.list, null) : Attribute.unchecked);
      },
    );
  }
}

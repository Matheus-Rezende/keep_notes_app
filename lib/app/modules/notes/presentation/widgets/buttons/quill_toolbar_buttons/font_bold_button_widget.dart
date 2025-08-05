import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontBoldButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_bold),
      tooltip: 'Negrito',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isBold = attrs.containsKey(Attribute.bold.key);
        controller.formatSelection(isBold ? Attribute.clone(Attribute.bold, null) : Attribute.bold);
      },
    );
  }
}

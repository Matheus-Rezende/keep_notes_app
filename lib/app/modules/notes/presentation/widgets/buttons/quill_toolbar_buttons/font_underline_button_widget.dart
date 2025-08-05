import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontUnderlineButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_underline),
      tooltip: 'Sublinhado baixo',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isUnderline = attrs.containsKey(Attribute.underline.key);
        controller.formatSelection(
          isUnderline ? Attribute.clone(Attribute.underline, null) : Attribute.underline,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontItalicButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_italic),
      tooltip: 'Italico',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isItalic = attrs.containsKey(Attribute.italic.key);
        controller.formatSelection(isItalic ? Attribute.clone(Attribute.italic, null) : Attribute.italic);
      },
    );
  }
}

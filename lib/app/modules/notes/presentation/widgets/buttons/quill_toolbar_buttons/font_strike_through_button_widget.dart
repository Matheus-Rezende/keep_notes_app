import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontStrikeThroughButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.strikethrough_s),
      tooltip: 'Sublinhado meio',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isStrike = attrs.containsKey(Attribute.strikeThrough.key);

        controller.formatSelection(
          isStrike ? Attribute.clone(Attribute.strikeThrough, null) : Attribute.strikeThrough,
        );
      },
    );
  }
}

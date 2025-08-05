import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class EnumeratedListButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_list_numbered),
      tooltip: 'Lista enumerada',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isOrderedList = attrs[Attribute.list.key]?.value == 'ordered';

        controller.formatSelection(isOrderedList ? Attribute.clone(Attribute.list, null) : Attribute.ol);
      },
    );
  }
}

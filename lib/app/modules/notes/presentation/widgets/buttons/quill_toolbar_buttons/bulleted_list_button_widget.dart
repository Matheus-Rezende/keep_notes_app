import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class BulletedListButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_list_bulleted),
      tooltip: 'Lista com pontos',
      onPressed: () {
        final controller = noteStore.controller;
        final attrs = controller.getSelectionStyle().attributes;
        final isBulletList = attrs[Attribute.list.key]?.value == 'bullet';

        controller.formatSelection(isBulletList ? Attribute.clone(Attribute.list, null) : Attribute.ul);
      },
    );
  }
}

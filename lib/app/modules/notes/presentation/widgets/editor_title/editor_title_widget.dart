import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class EditorTitleWidget extends StatelessWidget {
  const EditorTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noteStore = Modular.get<NoteStore>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        initialValue: noteStore.title,
        onChanged: (value) {
          noteStore.setTitle(value);
        },
        style: Theme.of(context).textTheme.titleLarge,
        decoration: const InputDecoration(hintText: 'Título', border: InputBorder.none),
      ),
    );
  }
}

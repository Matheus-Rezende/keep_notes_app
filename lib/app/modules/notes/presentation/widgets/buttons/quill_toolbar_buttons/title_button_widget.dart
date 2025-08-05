import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class TitleButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.title),
      tooltip: 'Estilos de Título',
      onPressed: () async {
        final selected = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.8,
                expand: false,
                builder: (_, scrollController) {
                  final items = {'Título 1': 'h1', 'Título 2': 'h2', 'Título 3': 'h3', 'Parágrafo': 'p'};
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final entry = items.entries.elementAt(i);
                      return ListTile(
                        title: Text(entry.key),
                        onTap: () => Navigator.of(context).pop(entry.value),
                      );
                    },
                  );
                },
              ),
            );
          },
        );

        if (selected != null) {
          Attribute? attr;
          switch (selected) {
            case 'h1':
              attr = Attribute.h1;
              break;
            case 'h2':
              attr = Attribute.h2;
              break;
            case 'h3':
              attr = Attribute.h3;
              break;
            case 'p':
            default:
              attr = Attribute(Attribute.header.key, AttributeScope.block, null);
          }
          noteStore.controller.formatSelection(attr);
        }
      },
    );
  }
}

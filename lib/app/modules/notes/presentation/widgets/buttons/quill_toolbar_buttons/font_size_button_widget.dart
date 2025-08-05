import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontSizeButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.format_size),
      tooltip: 'Tamanho da fonte',
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
                builder: (context, scrollController) {
                  final items = {
                    '10 px': '10',
                    '12 px': '12',
                    '14 px': '14',
                    '16 px': '16',
                    '18 px': '18',
                    '20 px': '20',
                    '22 px': '22',
                    '24 px': '24',
                    '26 px': '26',
                    '28 px': '28',
                    '30 px': '30',
                    '32 px': '32',
                    '34 px': '34',
                    '36 px': '36',
                    '38 px': '38',
                    '40 px': '40',
                    'Limpar': '14',
                  };

                  return ListView.builder(
                    controller: scrollController,
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final entry = items.entries.elementAt(i);
                      return ListTile(
                        title: Text(entry.key),
                        onTap: () {
                          Navigator.of(context).pop(entry.value); // retorna o valor selecionado
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        );

        if (selected != null) {
          noteStore.controller.formatSelection(Attribute.fromKeyValue('size', selected));
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class FontColorButtonWidget {
  static QuillToolbarCustomButtonOptions quillOptions(BuildContext context, NoteStore noteStore) {
    return QuillToolbarCustomButtonOptions(
      icon: const Icon(Icons.color_lens),
      tooltip: 'Cor da fonte',
      onPressed: () async {
        final selectedColorHex = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            final items = {
              'Preto': '#000000',
              'Vermelho': '#FF0000',
              'Verde': '#00FF00',
              'Azul': '#0000FF',
              'Roxo': '#800080',
              'Laranja': '#FFA500',
              'Amarelo': '#FFFF00',
              'Cinza': '#808080',
              'Branco': '#FFFFFF',
              'Limpar': 'clear',
            };

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.8,
                expand: false,
                builder: (context, scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final entry = items.entries.elementAt(index);
                      final colorValue = entry.value;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: colorValue == 'clear'
                              ? Colors.transparent
                              : Color(_hexToColor(colorValue)),
                          child: colorValue == 'clear' ? const Icon(Icons.clear) : null,
                        ),
                        title: Text(entry.key),
                        onTap: () {
                          Navigator.of(context).pop(colorValue);
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        );

        if (selectedColorHex != null) {
          if (selectedColorHex == 'clear') {
            noteStore.controller.formatSelection(Attribute.clone(Attribute.color, null));
          } else {
            noteStore.controller.formatSelection(Attribute.fromKeyValue('color', selectedColorHex));
          }
        }
      },
    );
  }

  static int _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex'; // Add alpha if missing
    return int.parse(hex, radix: 16);
  }
}

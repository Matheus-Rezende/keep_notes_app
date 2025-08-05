import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';

class QuillEditorWidget extends StatefulWidget {
  const QuillEditorWidget({super.key});

  @override
  State<QuillEditorWidget> createState() => _QuillEditorWidgetState();
}

class _QuillEditorWidgetState extends State<QuillEditorWidget> {
  final noteStore = Modular.get<NoteStore>();
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    noteStore.controller.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: QuillEditor(
          controller: noteStore.controller,
          focusNode: focusNode,
          scrollController: scrollController,
          config: QuillEditorConfig(
            placeholder: 'Digite algo na nota...',
            customStyles: DefaultStyles(
              paragraph: DefaultTextBlockStyle(
                Theme.of(context).textTheme.bodyMedium!,
                HorizontalSpacing(10, 10),
                VerticalSpacing(10, 10),
                VerticalSpacing(10, 10),
                BoxDecoration(color: null),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

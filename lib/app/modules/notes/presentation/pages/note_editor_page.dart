import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final noteStore = Modular.get<NoteStore>();
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    noteStore.quillController = QuillController.basic();
  }

  @override
  void dispose() {
    noteStore.quillController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBarWidget(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  icon: Icons.chevron_left_rounded,
                  iconSize: 40.0,
                  padding: 0.0,
                  height: 40.0,
                  width: 40.0,
                  borderRadius: 15.0,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  onPressed: () => Modular.to.pop(),
                ),
                Row(
                  spacing: 16.0,
                  children: [
                    CustomButtonWidget(
                      icon: Icons.remove_red_eye_outlined,
                      iconSize: 24.0,
                      padding: 6.0,
                      height: 40.0,
                      width: 40.0,
                      borderRadius: 15.0,
                      backgroundColor: theme.colorScheme.primaryContainer,
                    ),
                    CustomButtonWidget(
                      icon: Icons.save_outlined,
                      iconSize: 24.0,
                      padding: 6.0,
                      height: 40.0,
                      width: 40.0,
                      borderRadius: 15.0,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      onPressed: () {
                        final data = noteStore.toMap();
                        debugPrint("Nota pronta pra salvar: $data");
                        // Futuramente: gravar no Drift..
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                noteStore.setTitle(value);
              },
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(hintText: 'Título', border: InputBorder.none),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: QuillEditor(
                controller: noteStore.quillController,
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
          ),

          // Toolbar avançada
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: QuillSimpleToolbar(
              controller: noteStore.quillController,
              config: QuillSimpleToolbarConfig(
                showBoldButton: true,
                toolbarSectionSpacing: 8,
                showItalicButton: true,
                showUnderLineButton: true,
                showListNumbers: true,

                showListBullets: true,
                showColorButton: true,
                showAlignmentButtons: true,
                showLink: true,
                showUndo: true,
                showRedo: true,
                showClearFormat: true,
                showFontSize: true,
                buttonOptions: QuillSimpleToolbarButtonOptions(
                  fontSize: QuillToolbarFontSizeButtonOptions(
                    items: {
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
                      'Limpar': '0',
                    },
                    initialValue: '14 px',
                  ),
                ),
                multiRowsDisplay: false, // se quiser só uma linha
                toolbarIconAlignment: WrapAlignment.start,
                toolbarRunSpacing: 4,
                toolbarSize: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

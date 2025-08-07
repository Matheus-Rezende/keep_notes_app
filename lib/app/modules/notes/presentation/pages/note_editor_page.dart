import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/routes/app_routes.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';
import 'package:keep_notes_app/app/modules/core/presentation/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/dialogs/custom_modal_dialog.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/editor/quill_editor_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/editor_title/editor_title_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/toolbar/quill_toolbar_widget.dart';

class NoteEditorPage extends StatefulWidget {
  final Map<String, dynamic>? noteJson; // <-- Recebe a nota

  const NoteEditorPage({super.key, this.noteJson});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final noteStore = Modular.get<NoteStore>();

  @override
  void initState() {
    super.initState();
    final args = Modular.args.data;

    if (args != null) {
      final id = args['id'] as int?;
      final title = args['title'] as String;
      final contentJson = args['contentJson'] as String;

      noteStore.setNoteFromJson(id: id, title: title, contentJson: contentJson);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBarWidget(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  onPressed: () async {
                    if (noteStore.hasChanged) {
                      await noteStore.saveCurrentNote();
                    }

                    Modular.to.pushNamed(AppRoutes.notes);
                  },
                ),
                Observer(
                  builder: (context) {
                    return CustomButtonWidget(
                      icon: Icons.save_outlined,
                      iconSize: 24.0,
                      padding: 6.0,
                      height: 40.0,
                      width: 40.0,
                      borderRadius: 15.0,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      onPressed: () async {
                        final success = await noteStore.saveCurrentNote();
                        if (!success && context.mounted) {
                          CustomModalDialog.show(
                            context: context,
                            title: 'Erro ao salvar',
                            subtitle: noteStore.errorMessage ?? 'Erro desconhecido.',
                          );
                        } else {
                          if (context.mounted) {
                            CustomModalDialog.show(
                              context: context,
                              title: 'Nota salva com sucesso!',
                              subtitle: 'Sua nota foi salva localmente.',
                            );
                            print("Nota salva: ${noteStore.originalNote!.content}");
                          }
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: const [EditorTitleWidget(), QuillEditorWidget(), QuillToolbarWidget()]),
      ),
    );
  }
}

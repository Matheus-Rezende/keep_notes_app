import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/routes/app_routes.dart';
import 'package:keep_notes_app/app/modules/core/presentation/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/cards/note_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final noteStore = Modular.get<NoteStore>();
  @override
  void initState() {
    super.initState();
    noteStore.loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final appTheme = Modular.get<AppTheme>();

    return Scaffold(
      appBar: CustomAppBarWidget(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notas', style: Theme.of(context).textTheme.titleLarge),
                Row(
                  spacing: 16.0,
                  children: [
                    CustomButtonWidget(
                      icon: Icons.search,
                      iconSize: 24.0,
                      padding: 6.0,
                      height: 40.0,
                      width: 40.0,
                      borderRadius: 50.0,
                      backgroundColor: theme.colorScheme.primaryContainer,
                    ),
                    CustomButtonWidget(
                      icon: Icons.settings,
                      iconSize: 24.0,
                      padding: 6.0,
                      height: 40.0,
                      width: 40.0,
                      borderRadius: 50.0,
                      backgroundColor: theme.colorScheme.primaryContainer,
                      onPressed: () => Modular.to.pushNamed(AppRoutes.settings),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (noteStore.notes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/animations/gif/writing.gif',
                    filterQuality: FilterQuality.high,
                    height: 260.0,
                  ),
                  Text(
                    'Crie sua primeira nota!',
                    style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            );
          }
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final note = noteStore.notes[index];
                  return Dismissible(
                    key: Key('${note.id}'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: EdgeInsets.all(24.0),
                      margin: EdgeInsets.all(12.0),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: appTheme.colors.solidRedColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(Icons.delete, size: 40.0),
                    ),
                    onDismissed: (direction) {
                      noteStore.deleteNote(note.id!);
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          content: Text('Nota deletada', style: theme.textTheme.bodyMedium),
                        ),
                      );
                    },
                    child: NoteCard(
                      margin: 12.0,
                      padding: 24.0,
                      content: note.title,
                      onPressed: () => Modular.to.pushNamed(
                        AppRoutes.noteEditor,
                        arguments: {'id': note.id, 'title': note.title, 'contentJson': note.contentJson},
                      ),
                    ),
                  );
                }, childCount: noteStore.notes.length),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            ],
          );
        },
      ),
      floatingActionButton: CustomButtonWidget(
        icon: Icons.add,
        iconSize: 42.0,
        padding: 0,
        height: 70.0,
        width: 70.0,
        borderRadius: 50.0,
        hasShadow: true,
        onPressed: () {
          noteStore.clear();
          Modular.to.pushNamed(
            AppRoutes.noteEditor,
            arguments: {'title': '', 'contentJson': '[{"insert":"\\n"}]'},
          );
        },
      ),
    );
  }
}

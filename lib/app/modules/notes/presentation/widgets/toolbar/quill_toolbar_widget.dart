import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:keep_notes_app/app/modules/notes/interactor/stores/note_store.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/bulleted_list_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/checkbox_list_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/enumerated_list_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_bold_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_color_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_italic_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_size_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_strike_through_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/font_underline_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/redo_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/title_button_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/quill_toolbar_buttons/undo_button_widget.dart';

class QuillToolbarWidget extends StatelessWidget {
  const QuillToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noteStore = Modular.get<NoteStore>();

    return SizedBox(
      height: 50.0,
      child: QuillSimpleToolbar(
        controller: noteStore.controller,
        config: QuillSimpleToolbarConfig(
          toolbarIconCrossAlignment: WrapCrossAlignment.start,
          axis: Axis.horizontal,
          toolbarRunSpacing: 4,
          multiRowsDisplay: false,
          showDividers: false,
          showFontFamily: false,
          showFontSize: false,
          showBoldButton: false,
          showItalicButton: false,
          showSmallButton: false,
          showUnderLineButton: false,
          showLineHeightButton: false,
          showStrikeThrough: false,
          showInlineCode: false,
          showColorButton: false,
          showBackgroundColorButton: false,
          showClearFormat: false,
          showAlignmentButtons: false,
          showLeftAlignment: false,
          showCenterAlignment: false,
          showRightAlignment: false,
          showJustifyAlignment: false,
          showHeaderStyle: false,
          showListNumbers: false,
          showListBullets: false,
          showListCheck: false,
          showCodeBlock: false,
          showQuote: false,
          showIndent: false,
          showLink: false,
          showUndo: false,
          showRedo: false,
          showDirection: false,
          showSearchButton: false,
          showSubscript: false,
          showSuperscript: false,
          customButtons: [
            UndoButtonWidget.quillOptions(context, noteStore),
            RedoButtonWidget.quillOptions(context, noteStore),
            FontSizeButtonWidget.quillOptions(context, noteStore),
            TitleButtonWidget.quillOptions(context, noteStore),
            FontColorButtonWidget.quillOptions(context, noteStore),
            FontBoldButtonWidget.quillOptions(context, noteStore),
            FontItalicButtonWidget.quillOptions(context, noteStore),
            FontUnderlineButtonWidget.quillOptions(context, noteStore),
            FontStrikeThroughButtonWidget.quillOptions(context, noteStore),
            EnumeratedListButtonWidget.quillOptions(context, noteStore),
            BulletedListButtonWidget.quillOptions(context, noteStore),
            CheckboxListButtonWidget.quillOptions(context, noteStore),
          ],
        ),
      ),
    );
  }
}

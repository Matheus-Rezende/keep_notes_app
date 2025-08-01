import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/routes/app_routes.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/png/empty_notes.png', filterQuality: FilterQuality.high),
                          Text(
                            'Crie sua primeira nota!',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
        onPressed: () => Modular.to.pushNamed(AppRoutes.createNote),
      ),
    );
  }
}

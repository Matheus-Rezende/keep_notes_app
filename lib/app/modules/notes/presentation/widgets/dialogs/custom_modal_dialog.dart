import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';

class CustomModalDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String subtitle,
    bool barrierDismissible = true,
    double borderRadius = 16,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
  }) {
    final ThemeData theme = Theme.of(context);
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        backgroundColor: theme.cardColor,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              CustomButtonWidget(
                title: 'Entendi',
                titleStyle: Theme.of(context).textTheme.bodySmall,
                padding: 8.0,
                height: 40.0,
                onPressed: () => Modular.to.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final double? padding;
  final double? margin;
  const NoteCard({super.key, required this.content, this.onPressed, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: theme.colorScheme.primaryContainer,
        ),
        padding: EdgeInsets.all(padding ?? 16.0),
        margin: EdgeInsets.all(margin ?? 8.0),
        child: Text(content, style: theme.textTheme.bodyLarge),
      ),
    );
  }
}

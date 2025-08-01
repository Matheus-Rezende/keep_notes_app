import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final double padding;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize;
  final bool hasShadow;
  final Color? borderColor;
  const CustomButtonWidget({
    super.key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.borderRadius = 16.0,
    this.padding = 16.0,
    this.width = 80.0,
    this.height = 32.0,
    this.iconSize = 32.0,
    this.onPressed,
    this.icon,
    this.hasShadow = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: borderColor != null ? Border.all(color: borderColor ?? Colors.white, width: 3.0) : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: theme.colorScheme.shadow,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: icon != null
            ? Center(child: Icon(icon, size: iconSize))
            : Text(title ?? '', style: titleStyle),
      ),
    );
  }
}

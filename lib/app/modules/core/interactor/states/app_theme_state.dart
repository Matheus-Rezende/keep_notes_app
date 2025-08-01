import 'package:flutter/material.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';

sealed class AppThemeState {
  final ThemeData theme;
  AppThemeState({required this.theme});

  AppThemeDarkState darkTheme() => AppThemeDarkState();
  AppThemeLightState lightTheme() => AppThemeLightState();
}

class AppThemeDarkState extends AppThemeState {
  AppThemeDarkState() : super(theme: AppTheme().darkTheme);
}

class AppThemeLightState extends AppThemeState {
  AppThemeLightState() : super(theme: AppTheme().lightTheme);
}

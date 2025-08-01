import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_color_store.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_colors.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_fonts.dart';

class AppTheme {
  final AppColors colors = AppColors();
  final AppFonts typography = AppFonts();

  ThemeData get lightTheme {
    final themeColorStore = Modular.get<AppThemeColorStore>();

    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Nunito',
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColorStore.colorThemeState.colorTheme,
        brightness: Brightness.light,
      ).copyWith(shadow: colors.grey25Color.withValues(alpha: 0.5)),
      textTheme: TextTheme(
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
      ),
    );
  }

  ThemeData get darkTheme {
    final themeColorStore = Modular.get<AppThemeColorStore>();
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Nunito',
      colorScheme: ColorScheme.fromSeed(
        seedColor: themeColorStore.colorThemeState.colorTheme,
        brightness: Brightness.dark,
      ).copyWith(shadow: colors.grey3BColor.withValues(alpha: 0.8)),
      textTheme: TextTheme(
        titleLarge: typography.titleLarge,
        titleMedium: typography.titleMedium,
        titleSmall: typography.titleSmall,
        bodyLarge: typography.bodyLarge,
        bodyMedium: typography.bodyMedium,
        bodySmall: typography.bodySmall,
      ),
    );
  }
}

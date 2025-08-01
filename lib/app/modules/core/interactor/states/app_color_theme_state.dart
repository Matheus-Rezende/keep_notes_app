import 'package:flutter/material.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_colors.dart';

sealed class AppColorThemeState {
  final Color colorTheme;
  AppColorThemeState({required this.colorTheme});

  AppColorThemeDefaultState colorDefaultTheme() => AppColorThemeDefaultState();
  AppColorThemePinkState colorPinkTheme() => AppColorThemePinkState();
  AppColorThemeRedState colorRedTheme() => AppColorThemeRedState();
  AppColorThemeGreenState colorGreenTheme() => AppColorThemeGreenState();
  AppColorThemeYellowState colorYellowTheme() => AppColorThemeYellowState();
  AppColorThemeBlueState colorBlueTheme() => AppColorThemeBlueState();
  AppColorThemeCyanState colorCyanTheme() => AppColorThemeCyanState();
  AppColorThemeOrangeState colorOrangeTheme() => AppColorThemeOrangeState();
  AppColorThemePurpleState colorPurpleTheme() => AppColorThemePurpleState();
}

class AppColorThemeRedState extends AppColorThemeState {
  AppColorThemeRedState() : super(colorTheme: AppColors().solidRedColor);
}

class AppColorThemeGreenState extends AppColorThemeState {
  AppColorThemeGreenState() : super(colorTheme: AppColors().solidGreenColor);
}

class AppColorThemeYellowState extends AppColorThemeState {
  AppColorThemeYellowState() : super(colorTheme: AppColors().solidYellowColor);
}

class AppColorThemeBlueState extends AppColorThemeState {
  AppColorThemeBlueState() : super(colorTheme: AppColors().solidBlueColor);
}

class AppColorThemePinkState extends AppColorThemeState {
  AppColorThemePinkState() : super(colorTheme: AppColors().solidPinkColor);
}

class AppColorThemePurpleState extends AppColorThemeState {
  AppColorThemePurpleState() : super(colorTheme: AppColors().solidPurpleColor);
}

class AppColorThemeCyanState extends AppColorThemeState {
  AppColorThemeCyanState() : super(colorTheme: AppColors().solidCyanColor);
}

class AppColorThemeOrangeState extends AppColorThemeState {
  AppColorThemeOrangeState() : super(colorTheme: AppColors().solidOrangeColor);
}

class AppColorThemeDefaultState extends AppColorThemeState {
  AppColorThemeDefaultState() : super(colorTheme: AppColors().whiteColor);
}

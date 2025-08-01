import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_color_store.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_store.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final themeStore = Modular.get<AppThemeStore>();
  final themeColorStore = Modular.get<AppThemeColorStore>();

  @override
  void initState() {
    super.initState();
    themeStore.loadTheme();
    themeColorStore.loadColorTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp.router(
          title: 'Keep Notes App',
          themeMode: themeStore.isLight ? ThemeMode.light : ThemeMode.dark,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          debugShowCheckedModeBanner: false,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}

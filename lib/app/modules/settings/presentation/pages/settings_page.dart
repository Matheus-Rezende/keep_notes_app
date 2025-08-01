import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/modules/core/interactor/states/app_color_theme_state.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_color_store.dart';
import 'package:keep_notes_app/app/modules/core/interactor/stores/app_theme_store.dart';
import 'package:keep_notes_app/app/modules/core/theme/app_theme.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/app_bar/custom_app_bar_widget.dart';
import 'package:keep_notes_app/app/modules/notes/presentation/widgets/buttons/custom_button_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<AppThemeStore>();
    final themeColorStore = Modular.get<AppThemeColorStore>();
    final appTheme = Modular.get<AppTheme>();

    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBarWidget(
        widget: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 16.0,
              children: [
                CustomButtonWidget(
                  icon: Icons.chevron_left_rounded,
                  iconSize: 32.0,
                  padding: 0.0,
                  height: 32.0,
                  width: 32.0,
                  borderRadius: 50.0,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  onPressed: () => Modular.to.pop(),
                ),
                Text('Configurações', style: theme.textTheme.titleSmall),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Observer(
          builder: (context) {
            return Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temas', style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeStore.isLight ? 'Claro' : 'Escuro', style: theme.textTheme.bodySmall),
                    Switch.adaptive(
                      value: !themeStore.isLight,
                      onChanged: (value) {
                        themeColorStore.colorThemeState = themeColorStore.colorThemeState.colorDefaultTheme();
                        themeStore.changeTheme();
                      },
                    ),
                  ],
                ),
                Row(
                  spacing: 16.0,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: 1, child: Text('Cores', style: theme.textTheme.bodySmall)),
                    Flexible(
                      flex: 2,
                      child: Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        children: [
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidPinkColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemePinkState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changePinkColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidRedColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeRedState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeRedColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidGreenColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeGreenState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeGreenColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidYellowColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeYellowState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeYellowColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidBlueColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeBlueState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeBlueColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidPurpleColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemePurpleState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changePurpleColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidCyanColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeCyanState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeCyanColorTheme();
                            },
                          ),
                          CustomButtonWidget(
                            height: 40.0,
                            width: 40.0,
                            borderRadius: 50.0,
                            backgroundColor: appTheme.colors.solidOrangeColor,
                            borderColor: themeColorStore.colorThemeState is AppColorThemeOrangeState
                                ? (themeStore.isLight
                                      ? appTheme.colors.blackColor
                                      : appTheme.colors.whiteColor)
                                : null,
                            onPressed: () {
                              themeColorStore.changeOrangeColorTheme();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

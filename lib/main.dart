import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:md_pomodoro_timer/stores/pomodoro.store.dart';

import 'package:md_pomodoro_timer/shared/app_theme_dark.dart';
import 'package:md_pomodoro_timer/shared/app_theme_light.dart';

import 'package:md_pomodoro_timer/pages/stopwatch_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildMaterialApp(ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(create: (_) => PomodoroStore()),
      ],
      child: MaterialApp(
        title: 'Pomodoro Timer',
        themeMode: ThemeMode.system,
        theme: AppThemeLight.theme.copyWith(
          colorScheme: lightDynamic ?? AppThemeLight.theme.colorScheme
        ),
        darkTheme: AppThemeDark.theme.copyWith(
          colorScheme: darkDynamic ?? AppThemeDark.theme.colorScheme
        ),
        debugShowCheckedModeBanner: false,
        home: const StopwatchPage(),
      ),
    );
  }

  Widget _buildDynamicColorsApp() {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return _buildMaterialApp(lightDynamic, darkDynamic);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDynamicColorsApp();
  }
}
import 'package:flutter/material.dart';

///
/// inherited_widget_exam
/// File Name: ex_2
/// Created by sujangmac
///
/// Description:
///

class UserSettings {
  bool darkMode;
  UserSettings({this.darkMode = false});
}

class InheritedWidgetExample2 extends StatefulWidget {
  const InheritedWidgetExample2({super.key});

  @override
  State<InheritedWidgetExample2> createState() =>
      _InheritedWidgetExample2State();
}

class _InheritedWidgetExample2State extends State<InheritedWidgetExample2> {
  UserSettings settings = UserSettings(darkMode: false);

  void _toggleDarkMode(bool value) {
    setState(() {
      settings.darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: settings.darkMode ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('User Settings Inherited Widget'),
          ),
          body: UserSettingsInheritedWidget(
            settings: settings,
            toggleDarkMode: _toggleDarkMode,
            child: Center(
              child: SettingsWidget(),
            ),
          ),
        ),
      );
}

class UserSettingsInheritedWidget extends InheritedWidget {
  final UserSettings settings;
  final void Function(bool) toggleDarkMode;

  const UserSettingsInheritedWidget({
    super.key,
    required super.child,
    required this.settings,
    required this.toggleDarkMode,
  });

  static UserSettingsInheritedWidget of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<UserSettingsInheritedWidget>();
    assert(result != null, 'No UserSettingsInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserSettingsInheritedWidget oldWidget) {
    return oldWidget.settings.darkMode != settings.darkMode;
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inheritedWidget = UserSettingsInheritedWidget.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'Dark Mode is ${inheritedWidget.settings.darkMode ? 'ON' : 'OFF'}'),
        Switch(
          value: inheritedWidget.settings.darkMode,
          onChanged: inheritedWidget.toggleDarkMode,
        ),
      ],
    );
  }
}

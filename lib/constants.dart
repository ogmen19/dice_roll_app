import 'package:flutter/material.dart';

class ThemeColors {
  static const mainThemeColor1 = Color.fromARGB(255, 240, 92, 81);
  static const mainThemeColor2 = Colors.white;
}

class ThemeIcons {
  static const appBarLeadingIcon = Icon(Icons.house);
  static const appBarSettingIcon = Icon(Icons.settings);
}

class ThemeDimensions {
  static const double scoreBoardTextSize = 20;
  static const double scoreBoardContainerSize = 70;
}

class ThemeTextField extends InputDecorationTheme {
  ThemeTextField()
      : super(
          prefixIconColor: ThemeColors.mainThemeColor2,
          labelStyle: const TextStyle(color: ThemeColors.mainThemeColor2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ThemeColors.mainThemeColor2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ThemeColors.mainThemeColor2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ThemeColors.mainThemeColor2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: ThemeColors.mainThemeColor2)),
        );
}

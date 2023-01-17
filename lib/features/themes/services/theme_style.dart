import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme
        ? ThemeData(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white),
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.transparent,
            // brightness: Brightness.dark,
            backgroundColor: const Color(0xFF212121),
            dividerColor: Colors.black12,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            colorScheme:
                const ColorScheme.light(primary: Colors.transparent).copyWith(
              secondary: const Color(0xff896277),
            ),
          )
        : ThemeData(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white),
            scaffoldBackgroundColor: Colors.transparent,
            colorScheme: const ColorScheme.light(primary: Colors.transparent),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorScheme {
  static const List<Color> colors = [
    // primary
    Color(0xFF1d3c45),
    Color(0xFFFFFFFF),
    // secondary
    Color(0xFFd2601a),
    Color(0xFFfff1e1),
    // surface
    Color(0xFFfff1e1),
    Color(0xFF230608),
    // error
    Color(0xFFCC0003),
    Color(0xFFFFFFFF),
    // background
    Color(0xFFFFFFFF),
    Color(0xFF230608),
    // variant
    Color(0xFF12252B),
    Color(0xFFB65316),
  ];

  static final Color primary = colors[0];
  static final Color onPrimary = colors[1];

  static final Color secondary = colors[2];
  static final Color onSecondary = colors[3];

  static final Color surface = colors[4];
  static final Color onSurface = colors[5];

  static final Color error = colors[6];
  static final Color onError = colors[7];

  static final Color background = colors[8];
  static final Color onBackground = colors[9];

  static final Color primaryVariant = colors[10];
  static final Color secondaryVariant = colors[11];

  static final ColorScheme colorScheme = ColorScheme(
    background: background,
    onBackground: onBackground,
    error: error,
    onError: onError,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    brightness: Brightness.light,
    primaryVariant: primaryVariant,
    secondaryVariant: secondaryVariant,
  );
}

class AppTextStyles {
  static TextTheme textTheme = GoogleFonts.rosarioTextTheme().apply(
    bodyColor: AppColorScheme.onBackground,
    displayColor: AppColorScheme.onBackground,
  );
}

class Insets {
  static const double sm = 5.0;
  static const double m = 8.0;
  static const double mid = 12.0;
  static const double l = 16.0;
  static const double xl = 24.0;
}

class Sizes {
  static const double sm = 24.0;
  static const double m = 32.0;
  static const double mid = 48.0;
  static const double l = 60.0;
  static const double xl = 80.0;
}

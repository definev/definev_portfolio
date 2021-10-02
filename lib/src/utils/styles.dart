import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class Insets {
  static const double sm = 5.0;
  static const double m = 8.0;
  static const double mid = 12.0;
  static const double l = 16.0;
  static const double xl = 24.0;
}

extension InsetExt on double {
  Widget get horizontal => SizedBox(width: this);
  Widget get vertical => SizedBox(height: this);
}

class Sizes {
  static const double sm = 24.0;
  static const double m = 32.0;
  static const double mid = 48.0;
  static const double l = 60.0;
  static const double xl = 80.0;
}

class Corners {
  static double sm = 5.0;
  static Radius smRadius = Radius.circular(sm);
  static BorderRadius smBRadius = BorderRadius.circular(sm);

  static double m = 10.0;
  static Radius mRadius = Radius.circular(m);
  static BorderRadius mBRadius = BorderRadius.circular(m);

  static double l = 15.0;
  static Radius lRadius = Radius.circular(l);
  static BorderRadius lBRadius = BorderRadius.circular(l);

  static double xl = 20.0;
  static Radius xlRadius = Radius.circular(xl);
  static BorderRadius xlBRadius = BorderRadius.circular(xl);
}

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);

  static const Duration fast = Duration(milliseconds: 250);

  static const Duration medium = Duration(milliseconds: 350);

  static const Duration slow = Duration(milliseconds: 700);
}

final ThemeData kAppTheme = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.54),
        decoration: TextDecoration.none),
    headline2: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.54),
        decoration: TextDecoration.none),
    headline3: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.54),
        decoration: TextDecoration.none),
    headline4: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.54),
        decoration: TextDecoration.none),
    headline5: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    headline6: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    bodyText1: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    bodyText2: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    subtitle1: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    subtitle2: TextStyle(
        fontFamily: 'Circular', inherit: true, color: AppColorScheme.onBackground, decoration: TextDecoration.none),
    caption: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.54),
        decoration: TextDecoration.none),
    button: TextStyle(
        fontFamily: 'Circular',
        inherit: true,
        color: AppColorScheme.onBackground.withOpacity(0.87),
        decoration: TextDecoration.none),
    overline: TextStyle(
        fontFamily: 'Circular', inherit: true, color: AppColorScheme.onBackground, decoration: TextDecoration.none),
  ),
  colorScheme: AppColorScheme.colorScheme,
  scaffoldBackgroundColor: AppColorScheme.background,
  cardTheme: const CardTheme(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(),
  ),
);

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;
}

const double kDesktopTight = 1500.0;

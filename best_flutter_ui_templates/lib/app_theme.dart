import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  // ignore: constant_identifier_names
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}

const lightColorScheme = ColorScheme(
  primary: Color(0xFF1A73E8),
  secondary: Color(0xFF1A73E8),
  surface: AppTheme.white,
  error: Color(0xFFB00020),
  onPrimary: AppTheme.white,
  onSecondary: AppTheme.white,
  onSurface: AppTheme.darkText,
  onError: AppTheme.white,
  brightness: Brightness.light,
);

// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.blue,
  surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
  blendLevel: 9,
  subThemesData: const FlexSubThemesData(
    defaultRadius: 8.0,
    unselectedToggleIsColored: true,
    sliderTrackHeight: 2,
    inputDecoratorRadius: 23.0,
    inputDecoratorUnfocusedHasBorder: false,
    fabUseShape: true,
    fabAlwaysCircular: true,
    chipRadius: 16.0,
    cardRadius: 20.0,
    dialogRadius: 18.0,
    timePickerDialogRadius: 18.0,
    dialogElevation: 6.0,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.blue,
  surfaceMode: FlexSurfaceMode.level,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    defaultRadius: 8.0,
    unselectedToggleIsColored: true,
    sliderTrackHeight: 2,
    inputDecoratorRadius: 23.0,
    inputDecoratorUnfocusedHasBorder: false,
    fabUseShape: true,
    fabAlwaysCircular: true,
    chipRadius: 16.0,
    cardRadius: 20.0,
    dialogRadius: 18.0,
    timePickerDialogRadius: 18.0,
    dialogElevation: 6.0,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  tones: FlexTones.material(Brightness.dark).onMainsUseBW().onSurfacesUseBW(),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffa9c7ff),
  onPrimary: Color(0xff000000),
  primaryContainer: Color(0xff00468c),
  onPrimaryContainer: Color(0xffffffff),
  secondary: Color(0xffb8c8d9),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xff394856),
  onSecondaryContainer: Color(0xffffffff),
  tertiary: Color(0xffafc9e7),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xff304962),
  onTertiaryContainer: Color(0xffffffff),
  error: Color(0xffffb4ab),
  onError: Color(0xff000000),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffffff),
  surface: Color(0xff22252b),
  onSurface: Color(0xffffffff),
  surfaceContainerHighest: Color(0xff494e58),
  onSurfaceVariant: Color(0xffffffff),
  outline: Color(0xff8e9099),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xffdfe0e7),
  onInverseSurface: Color(0xff000000),
  inversePrimary: Color(0xff005db7),
  surfaceTint: Color(0xffa9c7ff),
);

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff005db7),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffd6e3ff),
  onPrimaryContainer: Color(0xff001b3d),
  secondary: Color(0xff526070),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffd5e4f7),
  onSecondaryContainer: Color(0xff0f1d2a),
  tertiary: Color(0xff456179),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffcbe6ff),
  onTertiaryContainer: Color(0xff001e31),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfff0f2fb),
  onSurface: Color(0xff1a1b1e),
  surfaceContainerHighest: Color(0xffd8ddea),
  onSurfaceVariant: Color(0xff44474e),
  outline: Color(0xff74777f),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xff2c3239),
  onInverseSurface: Color(0xfff1f0f4),
  inversePrimary: Color(0xffa9c7ff),
  surfaceTint: Color(0xff005db7),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFFC9224B);
const secondary = Color(0xFF4E4E4E);
const tertiary = Color(0xFF131313);
const background = Color(0xFFF2F2F2);
const backgroundContainer = Color(0xFFFFD9E2);
const r2 = Color(0xFF9C1129);
const r3 = Color(0xFFFA1742);
const grey = Color(0xFFDCDCDC);
const bodyText = Color(0xFF162113);

class CitisColorScheme extends ColorScheme {
  const CitisColorScheme()
      : super(
          primary: primary,
          onPrimary: background,
          primaryContainer: backgroundContainer,
          secondary: secondary,
          onSecondary: background,
          tertiary: tertiary,
          surface: background,
          onSurface: primary,
          error: r3,
          onError: r3,
          brightness: Brightness.light,
        );
}

class CitisTextTheme extends TextTheme {
  CitisTextTheme()
      : super(
          headlineLarge: GoogleFonts.cormorant(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: bodyText,
          ),
          headlineMedium: GoogleFonts.cormorant(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: bodyText,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: bodyText,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: bodyText,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: bodyText,
          ),
        );
}

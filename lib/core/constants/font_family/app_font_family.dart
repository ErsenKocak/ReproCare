import 'package:google_fonts/google_fonts.dart';

enum AppFontFamily { MontSerrat, EuclidCircularB }

extension AppFontFamilyValue on AppFontFamily {
  String get value {
    switch (this) {
      case AppFontFamily.EuclidCircularB:
        return 'Eucclid Circular B';
      case AppFontFamily.MontSerrat:
        return GoogleFonts.montserrat().fontFamily!;

      default:
        return GoogleFonts.montserrat().fontFamily!;
    }
  }
}

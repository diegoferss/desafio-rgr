import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  AppFonts._();

  static TextStyle nunito({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color fontColor = AppColors.black,
  }) {
    return GoogleFonts.nunito(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);
  }
}

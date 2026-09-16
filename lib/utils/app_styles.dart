import 'package:fit_flow/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle whiteBold48 = GoogleFonts.lexend(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 48,
    height: 1,
    letterSpacing: -1.2,
  );

  static TextStyle whiteLight14 = GoogleFonts.lexend(
    color: AppColors.whiteColor.withValues(alpha: 0.6),
    fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 2.8,
  );

  static TextStyle whiteMedium10 = GoogleFonts.lexend(
    color: AppColors.whiteColor.withValues(alpha: 0.4),
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 15 / 10,
    letterSpacing: 1,
  );

  static TextStyle whiteSemiBold12 = GoogleFonts.lexend(
    color: AppColors.whiteColor.withValues(alpha: 0.4),
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 16 / 12,
  );

  static TextStyle whiteSemiBold13 = GoogleFonts.lexend(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 19.5 / 13,
  );

  static TextStyle whiteSemiBold17 = GoogleFonts.lexend(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 25.5 / 17,
  );

  static TextStyle slate900Bold24 = GoogleFonts.lexend(
    color: AppColors.slate900Color,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );

  static TextStyle primaryBlueBold20 = GoogleFonts.lexend(
    color: AppColors.primaryBlueColor,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 28 / 20,
    letterSpacing: -0.5,
  );

  static TextStyle nearBlackExtraBold34 = GoogleFonts.lexend(
    color: AppColors.nearBlackColor,
    fontWeight: FontWeight.w800,
    fontSize: 34,
    height: 42.5 / 34,
    letterSpacing: -0.85,
  );

  static TextStyle nearBlackBold18 = GoogleFonts.lexend(
    color: AppColors.nearBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 28 / 18,
    letterSpacing: -0.45,
  );

  static TextStyle nearBlackBold16 = GoogleFonts.lexend(
    color: AppColors.nearBlackColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 24 / 16,
  );

  static TextStyle grayBlueRegular15 = GoogleFonts.lexend(
    color: AppColors.grayBlueColor,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 22.5 / 15,
  );

  static TextStyle grayBlueRegular13 = GoogleFonts.lexend(
    color: AppColors.grayBlueColor,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 19.5 / 13,
  );

  static TextStyle mutedGraySemiBold13 = GoogleFonts.lexend(
    color: AppColors.mutedGrayColor,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 19.5 / 13,
  );

  static TextStyle mutedGraySemiBold10 = GoogleFonts.lexend(
    color: AppColors.mutedGrayColor,
    fontWeight: FontWeight.w600,
    fontSize: 10,
    height: 15 / 10,
    letterSpacing: 1,
  );

  static TextStyle primaryBlueSemiBold10 = GoogleFonts.lexend(
    color: AppColors.primaryBlueColor,
    fontWeight: FontWeight.w600,
    fontSize: 10,
    height: 15 / 10,
    letterSpacing: 1,
  );

  static TextStyle slateGrayMedium11 = GoogleFonts.lexend(
    color: AppColors.slateGrayColor,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 16.5 / 11,
  );
}

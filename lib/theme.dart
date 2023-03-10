import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color primaryColor = const Color(0xFF1E3ECC);
Color secondaryColor = const Color(0xFFD2D3D3);
Color alertColor = const Color(0xFFB32A2A);
Color infoColor = const Color(0xFF2C96F1);
Color backgroundColorFull = const Color(0xFFFFFFFF);
Color backgroundColorHeaderAndNav = const Color(0xFF0E59FC);
Color backgroundColorCard = const Color(0xFFFFFFFF);
Color backgroundColorButton = const Color(0xFFFFFFFF);
Color backgroundColorInput = const Color(0xFFDFDFDF);
Color primaryTextColor = const Color(0xFF000000);
Color secondaryTextColor = const Color(0xFF4E4E4E);
Color whiteTextColor = const Color(0xFFFFFFFF);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: Colors.white,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

TextStyle infoTextStyle = GoogleFonts.poppins(
  color: infoColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

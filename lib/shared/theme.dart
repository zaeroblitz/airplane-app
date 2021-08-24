import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBackgroundColor = Color(0xFFFAFAFA);
const Color kPrimaryColor = Color(0xFF5C40CC);
const Color kBlackColor = Color(0xFF1F1449);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kGreyColor = Color(0xFF9698A9);
const Color kGreenColor = Color(0xFF0EC3AE);
const Color kPinkColor = Color(0xFFEB70A5);
const Color kUnavailableColor = Color(0xFFEBECF1);
const Color kTransparentColor = Colors.transparent;

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle regularTitleTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
  fontSize: 24,
  fontWeight: semiBold,
);
TextStyle bigTitleTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
  fontSize: 32,
  fontWeight: semiBold,
);
TextStyle regularSubtitleTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
  fontSize: 16,
  fontWeight: light,
);
TextStyle smallSubtitleTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
  fontSize: 14,
  fontWeight: light,
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle purpleTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);
TextStyle pinkTextStyle = GoogleFonts.poppins(
  color: kPinkColor,
);

double defaultMargin = 24;
double defaultRadius = 18;

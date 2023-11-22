import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinterest_video_downloader/constants/app_colors.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  const GradientText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.overflow,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradientColors,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: GoogleFonts.notoSans(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.white,
        ),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  const AppText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.overflow,
    this.maxLines,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

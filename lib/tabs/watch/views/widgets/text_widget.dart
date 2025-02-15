import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int? maxLines; // Optional maxLines
  final TextOverflow? overflow; // Optional overflow handling

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 16, // Default font size
    this.fontWeight = FontWeight.normal, // Default weight
    this.color = Colors.white, // Default color
    this.maxLines, // Nullable, applies only if given
    this.overflow, // Nullable, default to ellipsis if maxLines is set
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines, // Apply only if not null
      overflow: maxLines != null ? (overflow ?? TextOverflow.ellipsis) : null,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_app/utils/theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class CustomOutlineButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;

  const CustomOutlineButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed,
    this.icon,
    this.borderColor = AppColors.blueColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: borderColor),
        ),
        onPressed: onPressed,
        icon: icon != null
            ? Icon(icon, color: iconColor, size: 24)
            : const SizedBox.shrink(), // Hide icon if not provided
        label: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

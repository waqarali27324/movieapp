
// GenreTag Widget
import 'package:flutter/material.dart';
import 'package:sample_app/utils/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';


class GenreTag extends StatelessWidget {
  final String genre;
  const GenreTag(this.genre, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: getGenreColor(genre),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        genre,
        style:  GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,

            ),
      ),
    );
  }

  // Function to get genre color
  Color getGenreColor(String genre) {
    switch (genre.toLowerCase()) {
      case 'action':
        return AppColors.greenColor;
      case 'thriller':
        return AppColors.pinkColor;
      case 'science':
        return AppColors.darkBlueColor;
      case 'fiction':
        return AppColors.mustardColor;
      default:
        return Colors.grey;
    }
  }
}
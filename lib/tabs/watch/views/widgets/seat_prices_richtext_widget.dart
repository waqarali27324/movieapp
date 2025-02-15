
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SeatPricesRichText extends StatelessWidget {
  const SeatPricesRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "From",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500, // Bold
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " \$50",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500, // Regular
                      color: Colors.black, // Lighter text color
                    ),
                  ),
                  TextSpan(
                    text: " or",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500, // Regular
                      color: Colors.grey, // Lighter text color
                    ),
                  ),
                  TextSpan(
                    text: " \$500 bonus",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500, // Regular
                      color: Colors.black, // Lighter text color
                    ),
                  ),
                ],
              ),
            );
  }
}

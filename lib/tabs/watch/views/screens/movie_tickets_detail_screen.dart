import 'package:flutter/material.dart';
import 'package:sample_app/tabs/watch/controller/movie_ticket_detail_controller.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/views/widgets/seat_prices_richtext_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_button_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/ticket_detail_dates_widget.dart';
import 'package:sample_app/utils/asset_paths/assets_icons.dart';
import 'package:sample_app/utils/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';



class MovieTicketDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MovieTicketDetailController());

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 79, 
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CustomTextWidget(
                  text: controller.movie?.originalTitle ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                SizedBox(width: 50,)
          ],
        ),
      ),
   body: Container(
        color: AppColors.greyTextFieldColor,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 94),

            CustomTextWidget(
                  text: "Date",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
            const SizedBox(height: 14),

            // display available dates
            DatesListViewWidget(),

            const SizedBox(height: 39),

            // Time Slots
            Expanded(
              child: GetBuilder<MovieTicketDetailController>(
                builder: (controller) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.times.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => controller.selectTime(index),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: " ${controller.times[index]}  ",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500, // Bold
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${controller.halls[index]}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500, // Regular
                                      color: Colors.grey, // Lighter text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                        
                            // Seat Map Placeholder (Replace with an actual image)
                      Container(
                        width: 249,
                        height: 145,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
                        decoration: BoxDecoration(
                          color: controller.selectedTimeIndex == index
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: controller.selectedTimeIndex == index
                                ? Colors.blue
                                : Colors.grey.shade300,
                          ),
                        ),
                                                
                                                
                            child: GayaSvgAsset('assets/svgs/allSeats.svg', height: 113, width: 144)),
                            
                            const SizedBox(height: 10),

                            SeatPricesRichText(),
                        
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Select Seats Button
            SizedBox(
              width: double.infinity,
              child: 
                CustomElevatedButton(
                  
                                    text: "Select Seats",
                                    height: 50,
                                    width: 243,
                                    onPressed: () {
                                    },
                                  ),
                                  
              
              
            ),
            const SizedBox(height: 16),


          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample_app/tabs/watch/controller/movie_ticket_detail_controller.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/utils/theme/colors.dart';


class DatesListViewWidget extends StatelessWidget {
  const DatesListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieTicketDetailController>(builder: (controller) {
      return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.dates.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.selectDate(index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: controller.selectedDateIndex == index
                      ? AppColors.blueColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child:
                
                CustomTextWidget(
                text: controller.dates[index],
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: controller.selectedDateIndex == index
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
        ),
              ),
            );
          },
        ),
      );
    });
  }
}

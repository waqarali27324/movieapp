import 'package:flutter/material.dart';
import 'package:sample_app/routes/routes.dart';
import 'package:sample_app/tabs/watch/controller/movie_detail_controller.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/views/widgets/cached_image_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/genre_wrap_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_button_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/utils/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';


class MovieDetailScreen extends StatelessWidget {

  const MovieDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieDetailController>(
        builder: (controller) {

          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.movie == null) {
            return Center(child: CustomTextWidget(
              text: 'No Movie Found',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor,
            ),);
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 454 ,
                  child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: 
                        
                         CachedImageWidget(
                            borderRadius: 10,
                            imageUrl: 'https://image.tmdb.org/t/p/w500${controller.movie?.posterPath}',
                            fit: BoxFit.cover,
                            height: 454,
                          ),
                      ),
                  
                      // Gradient Overlay (Optional for better readability)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                  
                      // Back Button
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 10,
                        left: 10,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                // weight: 5,
                                size: 20,
                                Icons.arrow_back_ios_new, color: AppColors.whiteColor),
                              onPressed: () =>  Get.back(),
                            ),
                            const SizedBox(width: 20,),

                            
                            CustomTextWidget(
                                          text: 'Watch',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor,
                                        ),
                          ],
                        ),
                      ),
                  
                      // Content (Title, Buttons)
                      Positioned(
                        bottom: 34,
                        left: 66,
                        right: 66,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                                          text: controller.movie?.originalTitle ?? '',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.mustardColor,
                                        ),
                            CustomTextWidget(
                                          text: "In Theaters ${controller.movie?.releaseDate ?? ''}",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteColor,
                                        ),            
                            const SizedBox(height: 12),
                  
                            SizedBox(
                              width: double.infinity, 
                              child: Column(
                                children: [
                                  CustomElevatedButton(
                                    text: "Get Tickets",
                                    height: 50,
                                    width: 243,
                                    onPressed: () {
                                      Routes.toMovieTicketDetailView(controller.movie);
                                    },
                                  ),
                                  
                                  const SizedBox(height: 10),

                                  // Watch Trailer Button
                                  CustomOutlineButton(
                                    text: "Watch Trailer",
                                    height: 50,
                                    width: 243,
                                    icon: Icons.play_arrow,
                                    borderColor: AppColors.blueColor,
                                    textColor: AppColors.whiteColor,
                                    iconColor: AppColors.whiteColor,
                                    onPressed: () {
                                      Routes.toYoutubeTrailerlView(controller.movie?.id);
                                    },
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Genres Section
                  CustomTextWidget(
                    text: 'Genres',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  
                  ),
                  const SizedBox(height: 16),
                  if(controller.movie?.genres != null)
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: controller.movie!.genres!
                        .map((genre) => GenreTag(genre))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // Grey Divider Line
                  Divider(
                    color:  AppColors.greyColor, // Grey color line
                    thickness: 0.05, // Thickness of the line
                    height: 0.1, // Minimal spacing
                  ),
                  const SizedBox(height: 16),
                  // Overview Section
                  CustomTextWidget(
                    text: 'Overview',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  
                  ),
                  const SizedBox(height: 14),
                  CustomTextWidget(
                    text: controller.movie?.overview ?? "No overview available.",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey2Color,
                  
                  ),
                ],
              )
                )
            
              ],
            ),
          );
        }
      ),
    );
  }
}

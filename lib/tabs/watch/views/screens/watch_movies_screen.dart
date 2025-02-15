import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:sample_app/routes/routes.dart';
import 'package:sample_app/tabs/watch/controller/watch_movies_feed_controller.dart';
import 'package:sample_app/tabs/watch/views/widgets/cached_image_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/utils/theme/colors.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GetBuilder<MoviesController>(
        builder: (controller) {
          
          return controller.isLoading && controller.movies.isEmpty
              ? Center(child: CircularProgressIndicator()) // Show loading indicator when fetching data
              : 
           EasyRefresh(
            controller: controller.refreshController,
            
            onRefresh: () async {
              // Reset the page to 1 and load the movies again when the user pulls to refresh
              controller.currentPage = 1;
              await controller.loadMovies(page: controller.currentPage);
            },
            onLoad: () async {
              // Load more movies when the user reaches the bottom
              if (controller.hasNextPage) {
                await controller.loadNextPage();
              } else {
                controller.refreshController.finishLoad(); // No more data to load
              }
            },
            child: ListView.builder(
             padding: const EdgeInsets.all(20),
             itemCount: controller.movies.length,
             itemBuilder: (context, index) {
               final movie = controller.movies[index];
           
               return GestureDetector(
                 onTap: () {
                   Routes.toMovieDetailView(movieId: movie.id);
                 },
                 child: Container(
                   margin: const EdgeInsets.only(bottom: 20), // Spacing between items
                   height: 180, // Adjust height as needed
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.black, // Background color
                   ),
                   child: Stack(
                     children: [
            // Movie Image
            Positioned.fill(
              child: CachedImageWidget(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                borderRadius: 10,
                fit: BoxFit.cover,
              ),
            ),
           
            // Gradient Overlay (Optional for better text visibility)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
           
            // Movie Title at Bottom Left
            Positioned(
              left: 20,
              bottom: 20,
              child: 
              CustomTextWidget(
              text: movie.originalTitle ?? 'No Title',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            ),
              
            ),
                     ],
                   ),
                 ),
               );
             },
           )
           
                     );
        },
      ),
    );
  }
}

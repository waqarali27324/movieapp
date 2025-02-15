import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/routes/routes.dart';
import 'package:sample_app/tabs/search/controller/search_movies_controller.dart';
import 'package:sample_app/tabs/search/views/widgets/search_textfield_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/cached_image_widget.dart';
import 'package:sample_app/tabs/watch/views/widgets/text_widget.dart';
import 'package:sample_app/utils/theme/colors.dart';

class SearchMoviesScreen extends StatelessWidget {
  final SearchMoviesController controller = Get.put(SearchMoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 88, // Adjusted height
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.greyTextFieldColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SearchTextField(),
        ),
      ),
      body: Container(
        color: AppColors.greyTextFieldColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GetBuilder<SearchMoviesController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.movies.isEmpty) {
              return const Center(child: Text("No movies found."));
            }

            return ListView.builder(
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];
                return GestureDetector(
                  onTap: () {
                    Routes.toMovieDetailView(movieId: movie.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Movie Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: movie.posterPath != null
                              ? CachedImageWidget(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                  borderRadius: 10,
                                  height: 100,
                                  width: 130,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.movie, size: 100),
                        ),
                        const SizedBox(width: 21),
                        // Movie Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              CustomTextWidget(
                                text: movie.originalTitle ?? 'No title',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                                maxLines: 1,


                              ),
                              const SizedBox(height: 8),
                              CustomTextWidget(
                                text: movie.releaseDate ?? 'No release date',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.lightGreyColor,


                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        // More Options Icon
                        const Icon(Icons.more_horiz, color: AppColors.blueColor),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

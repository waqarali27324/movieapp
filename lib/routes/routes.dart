import 'package:get/get.dart';
import 'package:sample_app/routes/route_helper.dart';

class Routes {
  static void toSearchView() {
    Get.toNamed(RouteHelper.searchView);
  }

  static void toMovieDetailView({int movieId = 0}) {
    Get.toNamed(RouteHelper.movieDetailView, arguments: {"movieId": movieId});
  }


  static void toMovieTicketDetailView(movieModel) {
    Get.toNamed(RouteHelper.movieTicketDetailView, arguments: {"movie": movieModel});
  }

static void toYoutubeTrailerlView(movieId) {
    Get.toNamed(RouteHelper.youtubeTrailerView, arguments: {"movieId": movieId});
  }
  

}
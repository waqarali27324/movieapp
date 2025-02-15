

import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/services/youtube_trailer_services.dart';
import '../models/youtube_trailer_model.dart';

class YoutubeTrailerBindings extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments;
    final movieId = params?["movieId"] ?? 0;
    Get.lazyPut<YouTubeTrailerController>(() => YouTubeTrailerController(movieId));
  }
  
}


class YouTubeTrailerController extends GetxController {
  final int movieId;
  YouTubeTrailerModel? trailer;

  YouTubeTrailerController(this.movieId);

  @override
  void onInit() {
    super.onInit();
    fetchTrailer();
  }

  Future<void> fetchTrailer() async {
    trailer = await YouTubeTrailerService.fetchTrailer(movieId);
    update(); 
  }
}




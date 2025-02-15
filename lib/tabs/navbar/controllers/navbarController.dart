import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/controller/watch_movies_feed_controller.dart';

class NavBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(() => MoviesController());
  }
}
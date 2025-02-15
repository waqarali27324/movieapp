


import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/models/movie_model.dart';
import 'package:sample_app/tabs/watch/services/movies_services.dart';


class MoviesDetailBindings extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments;
    final movieId = params?["movieId"] ?? 0;
    Get.lazyPut<MovieDetailController>(() => MovieDetailController(movieId: movieId));
  }
  
}


class MovieDetailController extends GetxController {
  int movieId = 0;

  MovieDetailController({
    required this.movieId,
  });
  final MoviesServices _moviesServices = MoviesServices();
  MovieModel? movie;
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMovieDetails(movieId);
  }

  Future<void> loadMovieDetails(int movieId) async {
    isLoading = true;
    update();

    try {
      final response = await _moviesServices.getMovieDetails(movieId);
      movie = MovieModel.fromJson(response.data);
      print(movie?.toJson());
    } catch (e) {
      print("Error fetching movie details: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}

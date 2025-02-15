import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/search/services/search_movies_services.dart';
import 'package:sample_app/tabs/watch/models/movie_model.dart';


class SearchMoviesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchMoviesController>(() => SearchMoviesController());
  }
}

class SearchMoviesController extends GetxController {
  List<MovieModel> movies = [];
  bool isLoading = false;
  bool hasNextPage = true; // No pagination, just page 1.

  TextEditingController textController = TextEditingController();

  final SearchMoviesService _moviesService = SearchMoviesService();

  

  // Search movies for a specific query
  Future<void> searchMovies({required String query, int page = 1}) async {
    if (isLoading || query.isEmpty) return;

    isLoading = true;
    update();

    try {
      final response = await _moviesService.getSearchMovies(query: query);
      final List<dynamic> data = response.data['results'] ?? [];

      if (page == 1) {
        movies = data.map((item) => MovieModel.fromJson(item)).toList();
      } else {
        movies.addAll(data.map((item) => MovieModel.fromJson(item)).toList());
      }

      hasNextPage = response.data['page'] < response.data['total_pages'];
    } catch (e) {
      print("Error searching movies: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void clearSearch() {
    movies.clear();
    textController.clear();
    update();
  }
}

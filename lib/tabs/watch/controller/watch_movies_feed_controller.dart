import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:sample_app/tabs/watch/models/movie_model.dart';
import 'package:sample_app/tabs/watch/services/movies_services.dart';

class MoviesController extends GetxController {
  final MoviesServices _moviesServices = MoviesServices();

  List<MovieModel> movies = [];
  bool isLoading = false;
  bool hasNextPage = true;
  int currentPage = 1;
  ScrollController scrollController = ScrollController();
  
  // Don't put EasyRefreshController in MoviesController directly
  EasyRefreshController refreshController = EasyRefreshController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMovies(page: 1);
  }

  // Load movies for a specific page
  Future<void> loadMovies({int page = 1}) async {
    if (isLoading || !hasNextPage) return;

    isLoading = true;
    update();

    try {
      final response = await _moviesServices.getUpcomingMovies(page: page);
      final List<dynamic> data = response.data['results'];

      if (page == 1) {
        movies = data.map((item) => MovieModel.fromJson(item)).toList();
      } else {
        movies.addAll(data.map((item) => MovieModel.fromJson(item)).toList());
      }

      hasNextPage = response.data['page'] < response.data['total_pages'];
    } catch (e) {
      print("Error fetching upcoming movies: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  // Load next page of movies (pagination)
  Future<void> loadNextPage() async {
    if (hasNextPage) {
      currentPage++;
      await loadMovies(page: currentPage);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    refreshController.dispose(); // Dispose of the EasyRefresh controller
    super.onClose();
  }
}

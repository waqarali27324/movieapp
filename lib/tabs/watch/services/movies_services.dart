import 'package:dio/dio.dart';
import 'package:sample_app/utils/constants/api_constants.dart';

class MoviesServices {
  final Dio _dio = Dio();

  // Base URL for the API
  final String _baseUrl = "https://api.themoviedb.org/3/movie/upcoming";

  // The Authorization token (Bearer token)
  final String _authToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjhkZWQyYWYyMWM3MDgyNWRmYjBiYjNmNmNhNjZmZSIsIm5iZiI6MTczOTUyOTQxNS4xNzgsInN1YiI6IjY3YWYxY2M3ODBmNzZkNjFlYjhlNjhkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EcWLpf7OEvRPhNmhj5oPUjY1EGrCJEhJDrl5r0ykzzo";

  // Method to fetch upcoming movies
  Future<Response> getUpcomingMovies({int page = 1}) async {
    try {
      // Perform GET request
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/upcoming', // _baseUrl,
        queryParameters: {
          "language": "en-US",
          "page": page,
        },
        options: Options(
          headers: {
            "Authorization": ApiConstants.authToken, //, // Bearer token for authorization
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching upcoming movies: $e");
      rethrow;
    }
  }

  // ✅ **Method to fetch a single movie's details**
  Future<Response> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        "${ApiConstants.baseUrl}/$movieId",
        queryParameters: {
          "language": "en-US",
        },
        options: Options(
          headers: {
            "Authorization": ApiConstants.authToken,
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching movie details: $e");
      rethrow;
    }
  }
}
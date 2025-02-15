import 'package:dio/dio.dart';
import 'package:sample_app/utils/constants/api_constants.dart';

class SearchMoviesService {
  final Dio _dio = Dio();

  Future<Response> getSearchMovies({required String query, int page = 1}) async {
    return await _dio.get(
      'https://api.themoviedb.org/3/search/movie',
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'query': query,
        'page': page, // Always 1
      },
    );
  }
}

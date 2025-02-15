import 'package:dio/dio.dart';
import 'package:sample_app/utils/constants/api_constants.dart';
import '../models/youtube_trailer_model.dart';

class YouTubeTrailerService {

  static Future<YouTubeTrailerModel?> fetchTrailer(int movieId) async {
    try {
      final response = await Dio().get(
        "${ApiConstants.baseUrl}/$movieId/videos?api_key=${ApiConstants.apiKey}",
      );

      final results = response.data["results"] as List;

      if (results.isNotEmpty) {
        final trailer = results.firstWhere(
          (video) => video["site"] == "YouTube" && video["type"] == "Trailer",
          orElse: () => null,
        );

        if (trailer != null) {
          return YouTubeTrailerModel(
            id: trailer["id"],
            key: trailer["key"],
            name: trailer["name"],
          );
        }
      }
    } catch (e) {
      print("Error fetching trailer: $e");
    }
    return null;
  }
}

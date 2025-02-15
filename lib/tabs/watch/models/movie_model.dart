class MovieModel {
  final int id;
  final String originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? genres;
  final String? backdropPath;
  
  // Constructor
  MovieModel({
    required this.id,
    required this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genres,
    this.backdropPath
  });

  // Factory method to create a MovieModel from JSON
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    
    return MovieModel(
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      
      backdropPath: json['backdrop_path'] ?? '',
      genres: json['genres'] != null ? (json['genres'] as List)
          .map((genre) => genre['name'].toString())
          .toList() :  null,
    );
  }

  // Method to convert the MovieModel back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  // CopyWith method to create a new instance with updated values
  MovieModel copyWith({
    int? id,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? releaseDate,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModel(
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}

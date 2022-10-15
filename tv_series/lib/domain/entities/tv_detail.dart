import 'package:core/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TVDetail extends Equatable {
  const TVDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.episodes,
    required this.seasons,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.episodeRuntime,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalName;
  final int episodes;
  final int seasons;
  final String overview;
  final String posterPath;
  final String firstAirDate;
  final List<int> episodeRuntime;
  final String name;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalName,
        episodes,
        seasons,
        overview,
        posterPath,
        firstAirDate,
        episodeRuntime,
        name,
        voteAverage,
        voteCount,
      ];
}

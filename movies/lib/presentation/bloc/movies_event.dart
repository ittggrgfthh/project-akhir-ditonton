part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class OnNowPlayingMovies extends MoviesEvent {}

class OnPopularMovies extends MoviesEvent {}

class OnTopRatedMovies extends MoviesEvent {}

class OnMovieDetail extends MoviesEvent {
  final int id;
  const OnMovieDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnMovieRecommendations extends MoviesEvent {
  final int id;
  const OnMovieRecommendations(this.id);

  @override
  List<Object> get props => [id];
}

class OnWatchlistMovies extends MoviesEvent {}

class OnWatchlistMovieStatus extends MoviesEvent {
  final int id;
  const OnWatchlistMovieStatus(this.id);

  @override
  List<Object> get props => [id];
}

class OnSaveWatchlistMovie extends MoviesEvent {
  final MovieDetail movieDetail;
  const OnSaveWatchlistMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnRemoveWatchlistMovie extends MoviesEvent {
  final MovieDetail movieDetail;
  const OnRemoveWatchlistMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

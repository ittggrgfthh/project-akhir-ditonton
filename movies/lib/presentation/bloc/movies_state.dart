part of 'movies_bloc.dart';

@immutable
abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesEmpty extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviesHasData extends MoviesState {
  final List<Movie> result;

  const MoviesHasData(this.result);

  @override
  List<Object> get props => [result];
}

class MovieDetailHasData extends MoviesState {
  final MovieDetail result;
  const MovieDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class MovieWatchlistMessage extends MoviesState {
  final String message;
  const MovieWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchlistStatus extends MoviesState {
  final bool status;
  const MovieWatchlistStatus(this.status);

  @override
  List<Object> get props => [status];
}

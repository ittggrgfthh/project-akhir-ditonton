import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class GetNowPlayingMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  GetNowPlayingMoviesBloc(this._getNowPlayingMovies) : super(MoviesLoading()) {
    on<OnNowPlayingMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetPopularMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMovies _getPopularMovies;

  GetPopularMoviesBloc(this._getPopularMovies) : super(MoviesLoading()) {
    on<OnPopularMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getPopularMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetTopRatedMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;

  GetTopRatedMoviesBloc(this._getTopRatedMovies) : super(MoviesLoading()) {
    on<OnTopRatedMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetMovieDetailBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieDetail _getMovieDetail;

  GetMovieDetailBloc(this._getMovieDetail) : super(MoviesLoading()) {
    on<OnMovieDetail>((event, emit) async {
      final id = event.id;

      emit(MoviesLoading());
      final result = await _getMovieDetail.execute(id);

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieDetailHasData(data)),
      );
    });
  }
}

class GetMovieRecommendationsBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieRecommendations _getMovieRecommendations;

  GetMovieRecommendationsBloc(this._getMovieRecommendations)
      : super(MoviesLoading()) {
    on<OnMovieRecommendations>((event, emit) async {
      final id = event.id;

      emit(MoviesLoading());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetWatchlistMoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  GetWatchlistMoviesBloc(
    this._getWatchlistMovies,
    this._getWatchListStatus,
    this._saveWatchlist,
    this._removeWatchlist,
  ) : super(MoviesLoading()) {
    on<OnWatchlistMovies>((event, emit) async {
      emit(MoviesLoading());

      final result = await _getWatchlistMovies.execute();
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
    on<OnWatchlistMovieStatus>((event, emit) async {
      final id = event.id;
      emit(MoviesLoading());

      final result = await _getWatchListStatus.execute(id);
      emit(MovieWatchlistStatus(result));
    });
    on<OnSaveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(MoviesLoading());

      final result = await _saveWatchlist.execute(movie);
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieWatchlistMessage(data)),
      );
    });
    on<OnRemoveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(MoviesLoading());

      final result = await _removeWatchlist.execute(movie);
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieWatchlistMessage(data)),
      );
    });
  }
}

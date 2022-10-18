import 'package:core/security/ssl.dart';
import 'package:movies/data/datasources/db/database_helper.dart';
import 'package:movies/presentation/bloc/movies_bloc.dart';
import 'package:tv_series/data/datasources/db/database_helper_tv.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import 'package:movies/data/datasources/movie_remote_data_source.dart';
import 'package:tv_series/data/datasources/tv_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';
import 'package:tv_series/data/repositories/tv_repository_impl.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';
import 'package:tv_series/domain/usecases/get_tv_airing_today.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist_status.dart';
import 'package:tv_series/domain/usecases/remove_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/save_tv_watchlist.dart';
import 'package:search/domain/usecases/search_tv.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  IOClient ioClient = await SSLPinning.ioClient;
  // bloc
  locator.registerFactory(() => GetNowPlayingMoviesBloc(locator()));
  locator.registerFactory(() => GetPopularMoviesBloc(locator()));
  locator.registerFactory(() => GetTopRatedMoviesBloc(locator()));
  locator.registerFactory(() => GetMovieDetailBloc(locator()));
  locator.registerFactory(() => GetMovieRecommendationsBloc(locator()));
  locator.registerFactory(() => GetWatchlistMoviesBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => SearchBloc(locator()));

  // TV Series
  locator.registerFactory(() => GetTVAiringTodayBloc(locator()));
  locator.registerFactory(() => GetPopularTVBloc(locator()));
  locator.registerFactory(() => GetTopRatedTVBloc(locator()));
  locator.registerFactory(() => GetTVDetailBloc(locator()));
  locator.registerFactory(() => GetTVRecommendationsBloc(locator()));
  locator.registerFactory(() => GetWatchlistTVBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => TVSearchBloc(locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  // tv series
  locator.registerLazySingleton(() => GetTVAiringToday(locator()));
  locator.registerLazySingleton(() => GetPopularTV(locator()));
  locator.registerLazySingleton(() => GetTopRatedTV(locator()));
  locator.registerLazySingleton(() => GetTVDetail(locator()));
  locator.registerLazySingleton(() => GetTVRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTV(locator()));
  locator.registerLazySingleton(() => GetTVWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTVWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTVWatchlist(locator()));
  locator.registerLazySingleton(() => GetTVWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  // tv series
  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  // tv series
  locator.registerLazySingleton<TVSeriesRemoteDataSource>(
      () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVLocalDataSource>(
      () => TVLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTV>(() => DatabaseHelperTV());

  // external
  locator.registerLazySingleton<IOClient>(() => ioClient);
}

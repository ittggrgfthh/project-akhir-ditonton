import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/presentation/bloc/movies_bloc.dart';

import 'movies_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchlistMovies,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late GetNowPlayingMoviesBloc getNowPlayingMoviesBloc;
  late GetPopularMoviesBloc getPopularMoviesBloc;
  late GetTopRatedMoviesBloc getTopRatedMoviesBloc;
  late GetMovieDetailBloc getMovieDetailBloc;
  late GetMovieRecommendationsBloc getMovieRecommendationsBloc;
  late GetWatchlistMoviesBloc getWatchlistMoviesBloc;

  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();

    getNowPlayingMoviesBloc = GetNowPlayingMoviesBloc(mockGetNowPlayingMovies);
    getPopularMoviesBloc = GetPopularMoviesBloc(mockGetPopularMovies);
    getTopRatedMoviesBloc = GetTopRatedMoviesBloc(mockGetTopRatedMovies);
    getMovieDetailBloc = GetMovieDetailBloc(mockGetMovieDetail);
    getMovieRecommendationsBloc =
        GetMovieRecommendationsBloc(mockGetMovieRecommendations);
    getWatchlistMoviesBloc = GetWatchlistMoviesBloc(
      mockGetWatchlistMovies,
      mockGetWatchListStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    );
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  const tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'name')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 1,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieList = <Movie>[tMovie];
  const tId = 1;
  const tSaveMessage = GetWatchlistMoviesBloc.watchlistAddSuccessMessage;
  const tRemoveMessage = GetWatchlistMoviesBloc.watchlistRemoveSuccessMessage;

  group('now playing movies', () {
    test('initial state should be loading', () {
      expect(getNowPlayingMoviesBloc.state, MoviesLoading());
    });

    blocTest<GetNowPlayingMoviesBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return getNowPlayingMoviesBloc;
      },
      act: (bloc) => bloc.add(OnNowPlayingMovies()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        MoviesHasData(tMovieList),
      ],
      verify: (bloc) {
        verify(mockGetNowPlayingMovies.execute());
      },
    );
  });

  group('popular movies', () {
    test('initial state should be loading', () {
      expect(getPopularMoviesBloc.state, MoviesLoading());
    });

    blocTest<GetPopularMoviesBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return getPopularMoviesBloc;
      },
      act: (bloc) => bloc.add(OnPopularMovies()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        MoviesHasData(tMovieList),
      ],
      verify: (bloc) {
        verify(mockGetPopularMovies.execute());
      },
    );
  });

  group('top rated movies', () {
    test('initial state should be loading', () {
      expect(getTopRatedMoviesBloc.state, MoviesLoading());
    });

    blocTest<GetTopRatedMoviesBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(tMovieList));
        return getTopRatedMoviesBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedMovies()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        MoviesHasData(tMovieList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedMovies.execute());
      },
    );
  });

  group('movie detail', () {
    test('initial state should be loading', () {
      expect(getTopRatedMoviesBloc.state, MoviesLoading());
    });

    blocTest<GetMovieDetailBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => const Right(tMovieDetail));
        return getMovieDetailBloc;
      },
      act: (bloc) => bloc.add(const OnMovieDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        const MovieDetailHasData(tMovieDetail),
      ],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(tId));
      },
    );
  });

  group('movie recommendations', () {
    test('initial state should be loading', () {
      expect(getMovieRecommendationsBloc.state, MoviesLoading());
    });

    blocTest<GetMovieRecommendationsBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovieList));
        return getMovieRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnMovieRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        MoviesHasData(tMovieList),
      ],
      verify: (bloc) {
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );
  });

  group('watchlist movies', () {
    group('get watchlist movies list', () {
      test('initial state should be loading', () {
        expect(getWatchlistMoviesBloc.state, MoviesLoading());
      });

      blocTest<GetWatchlistMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchlistMovies.execute())
              .thenAnswer((_) async => Right(tMovieList));
          return getWatchlistMoviesBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistMovies()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          MoviesLoading(),
          MoviesHasData(tMovieList),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistMovies.execute());
        },
      );
    });

    group('get watchlist movies status', () {
      test('initial state should be loading', () {
        expect(getWatchlistMoviesBloc.state, MoviesLoading());
      });

      blocTest<GetWatchlistMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchListStatus.execute(tId))
              .thenAnswer((_) async => true);
          return getWatchlistMoviesBloc;
        },
        act: (bloc) => bloc.add(const OnWatchlistMovieStatus(tId)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          MoviesLoading(),
          const MovieWatchlistStatus(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchListStatus.execute(tId));
        },
      );
    });

    group('save watchlist movie', () {
      test('initial state should be loading', () {
        expect(getWatchlistMoviesBloc.state, MoviesLoading());
      });

      blocTest<GetWatchlistMoviesBloc, MoviesState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveWatchlist.execute(tMovieDetail))
              .thenAnswer((_) async => const Right(tSaveMessage));
          return getWatchlistMoviesBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistMovie(tMovieDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          MoviesLoading(),
          const MovieWatchlistMessage(tSaveMessage),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlist.execute(tMovieDetail));
        },
      );
    });
  });

  group('remove watchlist movie', () {
    test('initial state should be loading', () {
      expect(getWatchlistMoviesBloc.state, MoviesLoading());
    });

    blocTest<GetWatchlistMoviesBloc, MoviesState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => const Right(tRemoveMessage));
        return getWatchlistMoviesBloc;
      },
      act: (bloc) => bloc.add(const OnRemoveWatchlistMovie(tMovieDetail)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        MoviesLoading(),
        const MovieWatchlistMessage(tRemoveMessage),
      ],
      verify: (bloc) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
      },
    );
  });
}

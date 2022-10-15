import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';
import 'package:tv_series/domain/usecases/get_tv_airing_today.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist_status.dart';
import 'package:tv_series/domain/usecases/remove_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/save_tv_watchlist.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';

import 'tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetTVAiringToday,
  GetPopularTV,
  GetTopRatedTV,
  GetTVDetail,
  GetTVRecommendations,
  GetTVWatchlist,
  GetTVWatchListStatus,
  SaveTVWatchlist,
  RemoveTVWatchlist,
])
void main() {
  late GetTVAiringTodayBloc getTVAiringTodayBloc;
  late GetPopularTVBloc getPopularTVBloc;
  late GetTopRatedTVBloc getTopRatedTVBloc;
  late GetTVDetailBloc getTVDetailBloc;
  late GetTVRecommendationsBloc getTVRecommendationsBloc;
  late GetWatchlistTVBloc getWatchlistTVBloc;

  late MockGetTVAiringToday mockGetTVAiringToday;
  late MockGetPopularTV mockGetPopularTV;
  late MockGetTopRatedTV mockGetTopRatedTV;
  late MockGetTVDetail mockGetTVDetail;
  late MockGetTVRecommendations mockGetTVRecommendations;
  late MockGetTVWatchlist mockGetTVWatchlist;
  late MockGetTVWatchListStatus mockGetTVWatchListStatus;
  late MockSaveTVWatchlist mockSaveTVWatchlist;
  late MockRemoveTVWatchlist mockRemoveTVWatchlist;

  setUp(() {
    mockGetTVAiringToday = MockGetTVAiringToday();
    mockGetPopularTV = MockGetPopularTV();
    mockGetTopRatedTV = MockGetTopRatedTV();
    mockGetTVDetail = MockGetTVDetail();
    mockGetTVRecommendations = MockGetTVRecommendations();
    mockGetTVWatchlist = MockGetTVWatchlist();
    mockGetTVWatchListStatus = MockGetTVWatchListStatus();
    mockSaveTVWatchlist = MockSaveTVWatchlist();
    mockRemoveTVWatchlist = MockRemoveTVWatchlist();

    getTVAiringTodayBloc = GetTVAiringTodayBloc(mockGetTVAiringToday);
    getPopularTVBloc = GetPopularTVBloc(mockGetPopularTV);
    getTopRatedTVBloc = GetTopRatedTVBloc(mockGetTopRatedTV);
    getTVDetailBloc = GetTVDetailBloc(mockGetTVDetail);
    getTVRecommendationsBloc =
        GetTVRecommendationsBloc(mockGetTVRecommendations);
    getWatchlistTVBloc = GetWatchlistTVBloc(
      mockGetTVWatchlist,
      mockGetTVWatchListStatus,
      mockSaveTVWatchlist,
      mockRemoveTVWatchlist,
    );
  });

  final tTV = TV(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  const tTVDetail = TVDetail(
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'name')],
    id: 1,
    originalName: 'originalName',
    episodes: 1,
    seasons: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    episodeRuntime: [],
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  final tTVList = <TV>[tTV];
  const tId = 1;
  const tSaveMessage = GetWatchlistTVBloc.watchlistAddSuccessMessage;
  const tRemoveMessage = GetWatchlistTVBloc.watchlistRemoveSuccessMessage;

  group('tv airing today', () {
    test('initial state should be loading', () {
      expect(getTVAiringTodayBloc.state, TVLoading());
    });

    blocTest<GetTVAiringTodayBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVAiringToday.execute())
            .thenAnswer((_) async => Right(tTVList));
        return getTVAiringTodayBloc;
      },
      act: (bloc) => bloc.add(OnTVAiringToday()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(tTVList),
      ],
      verify: (bloc) {
        verify(mockGetTVAiringToday.execute());
      },
    );
  });

  group('popular tv', () {
    test('initial state should be loading', () {
      expect(getPopularTVBloc.state, TVLoading());
    });

    blocTest<GetPopularTVBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTV.execute())
            .thenAnswer((_) async => Right(tTVList));
        return getPopularTVBloc;
      },
      act: (bloc) => bloc.add(OnPopularTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(tTVList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTV.execute());
      },
    );
  });

  group('top rated tv', () {
    test('initial state should be loading', () {
      expect(getTopRatedTVBloc.state, TVLoading());
    });

    blocTest<GetTopRatedTVBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTV.execute())
            .thenAnswer((_) async => Right(tTVList));
        return getTopRatedTVBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(tTVList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTV.execute());
      },
    );
  });

  group('tv detail', () {
    test('initial state should be loading', () {
      expect(getTopRatedTVBloc.state, TVLoading());
    });

    blocTest<GetTVDetailBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVDetail.execute(tId))
            .thenAnswer((_) async => const Right(tTVDetail));
        return getTVDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTVDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVDetailHasData(tTVDetail),
      ],
      verify: (bloc) {
        verify(mockGetTVDetail.execute(tId));
      },
    );
  });

  group('tv recommendations', () {
    test('initial state should be loading', () {
      expect(getTVRecommendationsBloc.state, TVLoading());
    });

    blocTest<GetTVRecommendationsBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTVList));
        return getTVRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnTVRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(tTVList),
      ],
      verify: (bloc) {
        verify(mockGetTVRecommendations.execute(tId));
      },
    );
  });

  group('watchlist tv', () {
    group('get watchlist tv list', () {
      test('initial state should be loading', () {
        expect(getWatchlistTVBloc.state, TVLoading());
      });

      blocTest<GetWatchlistTVBloc, TvState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTVWatchlist.execute())
              .thenAnswer((_) async => Right(tTVList));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistTV()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          TVHasData(tTVList),
        ],
        verify: (bloc) {
          verify(mockGetTVWatchlist.execute());
        },
      );
    });

    group('get watchlist tv status', () {
      test('initial state should be loading', () {
        expect(getWatchlistTVBloc.state, TVLoading());
      });

      blocTest<GetWatchlistTVBloc, TvState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetTVWatchListStatus.execute(tId))
              .thenAnswer((_) async => true);
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnWatchlistTVStatus(tId)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVWatchlistStatus(true),
        ],
        verify: (bloc) {
          verify(mockGetTVWatchListStatus.execute(tId));
        },
      );
    });

    group('save watchlist tv', () {
      test('initial state should be loading', () {
        expect(getWatchlistTVBloc.state, TVLoading());
      });

      blocTest<GetWatchlistTVBloc, TvState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveTVWatchlist.execute(tTVDetail))
              .thenAnswer((_) async => const Right(tSaveMessage));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistTV(tTVDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVWatchlistMessage(tSaveMessage),
        ],
        verify: (bloc) {
          verify(mockSaveTVWatchlist.execute(tTVDetail));
        },
      );
    });
  });

  group('remove watchlist tv', () {
    test('initial state should be loading', () {
      expect(getWatchlistTVBloc.state, TVLoading());
    });

    blocTest<GetWatchlistTVBloc, TvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockRemoveTVWatchlist.execute(tTVDetail))
            .thenAnswer((_) async => const Right(tRemoveMessage));
        return getWatchlistTVBloc;
      },
      act: (bloc) => bloc.add(const OnRemoveWatchlistTV(tTVDetail)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVWatchlistMessage(tRemoveMessage),
      ],
      verify: (bloc) {
        verify(mockRemoveTVWatchlist.execute(tTVDetail));
      },
    );
  });
}

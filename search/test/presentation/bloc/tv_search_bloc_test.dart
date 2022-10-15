import 'package:bloc_test/bloc_test.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:search/domain/usecases/search_tv.dart';
import 'package:search/presentation/bloc/search_bloc.dart';

import 'tv_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTV])
void main() {
  late TVSearchBloc searchBloc;
  late MockSearchTV mockSearchTV;

  setUp(() {
    mockSearchTV = MockSearchTV();
    searchBloc = TVSearchBloc(mockSearchTV);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchEmpty());
  });

  final tTVModel = TV(
    backdropPath: '/ecSiRdNc3mO2Ejsr2mEHjqr82I1.jpg',
    genreIds: const [18, 10766],
    id: 158415,
    originalName: 'Pantanal',
    overview:
        'After the mysterious disappearance of his father, Joventino, the cowboy José Leôncio becomes a wealthy farm owner in Pantanal. Over twenty years have passed and, bitter-hearted because of his father vanishing and the escape of his wife to Rio de Janeiro with his baby, José Leôncio has the chance to make amends with the boy, now a young man raised in the big city with very different values and habits than his own.',
    popularity: 960.845,
    posterPath: '/4Ru1BwcAKWtpM345dWe8YgHf35V.jpg',
    firstAirDate: '2022-03-28',
    name: 'Pantanal',
    voteAverage: 6,
    voteCount: 53,
  );

  final tTVList = <TV>[tTVModel];
  const tQuery = 'spiderman';

  blocTest<TVSearchBloc, SearchState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTV.execute(tQuery))
          .thenAnswer((_) async => Right(tTVList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchLoading(),
      TVSearchHasData(tTVList),
    ],
    verify: (bloc) {
      verify(mockSearchTV.execute(tQuery));
    },
  );
}

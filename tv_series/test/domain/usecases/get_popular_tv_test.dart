import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTV usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetPopularTV(mockTVRepository);
  });

  final tTV = <TV>[];

  group('Get Popular TV Series Tests', () {
    group('execute', () {
      test(
          'should get list of TV Series from the repository when execute function is called',
          () async {
        // arrange
        when(mockTVRepository.getPopularTVSeries())
            .thenAnswer((_) async => Right(tTV));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTV));
      });
    });
  });
}

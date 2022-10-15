import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

abstract class TVRepository {
  Future<Either<Failure, List<TV>>> getTVAiringToday();
  Future<Either<Failure, List<TV>>> getPopularTVSeries();
  Future<Either<Failure, List<TV>>> getTopRatedTVSeries();
  Future<Either<Failure, TVDetail>> getTVSeriesDetail(int id);
  Future<Either<Failure, List<TV>>> getTVSeriesRecommendations(int id);
  Future<Either<Failure, List<TV>>> searchTVSeries(String query);
  Future<Either<Failure, String>> saveTVWatchlist(TVDetail tv);
  Future<Either<Failure, String>> removeTVWatchlist(TVDetail tv);
  Future<bool> isTVAddedToWatchlist(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTV();
}

import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTVWatchlist {
  final TVRepository _repository;

  GetTVWatchlist(this._repository);

  Future<Either<Failure, List<TV>>> execute() {
    return _repository.getWatchlistTV();
  }
}

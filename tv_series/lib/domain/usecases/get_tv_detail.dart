import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTVDetail {
  final TVRepository repository;

  GetTVDetail(this.repository);

  Future<Either<Failure, TVDetail>> execute(int id) {
    return repository.getTVSeriesDetail(id);
  }
}

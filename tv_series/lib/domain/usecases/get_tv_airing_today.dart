import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTVAiringToday {
  final TVRepository repository;

  GetTVAiringToday(this.repository);

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getTVAiringToday();
  }
}

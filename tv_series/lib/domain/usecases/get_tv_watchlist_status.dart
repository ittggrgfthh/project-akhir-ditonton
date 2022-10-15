import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTVWatchListStatus {
  final TVRepository repository;

  GetTVWatchListStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isTVAddedToWatchlist(id);
  }
}

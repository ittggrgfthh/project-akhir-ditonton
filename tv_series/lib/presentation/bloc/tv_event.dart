part of 'tv_bloc.dart';

@immutable
abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class OnTVAiringToday extends TvEvent {}

class OnPopularTV extends TvEvent {}

class OnTopRatedTV extends TvEvent {}

class OnTVDetail extends TvEvent {
  final int id;
  const OnTVDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnTVRecommendations extends TvEvent {
  final int id;
  const OnTVRecommendations(this.id);

  @override
  List<Object> get props => [id];
}

class OnWatchlistTV extends TvEvent {}

class OnWatchlistTVStatus extends TvEvent {
  final int id;
  const OnWatchlistTVStatus(this.id);

  @override
  List<Object> get props => [id];
}

class OnSaveWatchlistTV extends TvEvent {
  final TVDetail movieDetail;
  const OnSaveWatchlistTV(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnRemoveWatchlistTV extends TvEvent {
  final TVDetail movieDetail;
  const OnRemoveWatchlistTV(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

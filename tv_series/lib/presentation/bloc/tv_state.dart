part of 'tv_bloc.dart';

@immutable
abstract class TvState extends Equatable {
  const TvState();

  @override
  List<Object> get props => [];
}

class TVEmpty extends TvState {}

class TVLoading extends TvState {}

class TVError extends TvState {
  final String message;

  const TVError(this.message);

  @override
  List<Object> get props => [message];
}

class TVHasData extends TvState {
  final List<TV> result;

  const TVHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TVDetailHasData extends TvState {
  final TVDetail result;
  const TVDetailHasData(this.result);

  @override
  List<Object> get props => [result];
}

class TVWatchlistMessage extends TvState {
  final String message;
  const TVWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}

class TVWatchlistStatus extends TvState {
  final bool status;
  const TVWatchlistStatus(this.status);

  @override
  List<Object> get props => [status];
}

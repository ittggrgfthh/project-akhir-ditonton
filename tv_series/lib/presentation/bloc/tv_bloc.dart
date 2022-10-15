import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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

part 'tv_event.dart';
part 'tv_state.dart';

class GetTVAiringTodayBloc extends Bloc<TvEvent, TvState> {
  final GetTVAiringToday _getTVAiringToday;

  GetTVAiringTodayBloc(this._getTVAiringToday) : super(TVLoading()) {
    on<OnTVAiringToday>((event, emit) async {
      emit(TVLoading());
      final result = await _getTVAiringToday.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetPopularTVBloc extends Bloc<TvEvent, TvState> {
  final GetPopularTV _getPopularTV;

  GetPopularTVBloc(this._getPopularTV) : super(TVLoading()) {
    on<OnPopularTV>((event, emit) async {
      emit(TVLoading());
      final result = await _getPopularTV.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTopRatedTVBloc extends Bloc<TvEvent, TvState> {
  final GetTopRatedTV _getTopRatedTV;

  GetTopRatedTVBloc(this._getTopRatedTV) : super(TVLoading()) {
    on<OnTopRatedTV>((event, emit) async {
      emit(TVLoading());
      final result = await _getTopRatedTV.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTVDetailBloc extends Bloc<TvEvent, TvState> {
  final GetTVDetail _getTVDetail;

  GetTVDetailBloc(this._getTVDetail) : super(TVLoading()) {
    on<OnTVDetail>((event, emit) async {
      final id = event.id;

      emit(TVLoading());
      final result = await _getTVDetail.execute(id);

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVDetailHasData(data)),
      );
    });
  }
}

class GetTVRecommendationsBloc extends Bloc<TvEvent, TvState> {
  final GetTVRecommendations _getTVRecommendations;

  GetTVRecommendationsBloc(this._getTVRecommendations) : super(TVLoading()) {
    on<OnTVRecommendations>((event, emit) async {
      final id = event.id;

      emit(TVLoading());
      final result = await _getTVRecommendations.execute(id);

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetWatchlistTVBloc extends Bloc<TvEvent, TvState> {
  final GetTVWatchlist _getTVWatchlist;
  final GetTVWatchListStatus _getTVWatchListStatus;
  final SaveTVWatchlist _saveTVWatchlist;
  final RemoveTVWatchlist _removeTVWatchlist;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  GetWatchlistTVBloc(
    this._getTVWatchlist,
    this._getTVWatchListStatus,
    this._saveTVWatchlist,
    this._removeTVWatchlist,
  ) : super(TVLoading()) {
    on<OnWatchlistTV>((event, emit) async {
      emit(TVLoading());

      final result = await _getTVWatchlist.execute();
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
    on<OnWatchlistTVStatus>((event, emit) async {
      final id = event.id;
      emit(TVLoading());

      final result = await _getTVWatchListStatus.execute(id);
      emit(TVWatchlistStatus(result));
    });
    on<OnSaveWatchlistTV>((event, emit) async {
      final movie = event.movieDetail;
      emit(TVLoading());

      final result = await _saveTVWatchlist.execute(movie);
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVWatchlistMessage(data)),
      );
    });
    on<OnRemoveWatchlistTV>((event, emit) async {
      final movie = event.movieDetail;
      emit(TVLoading());

      final result = await _removeTVWatchlist.execute(movie);
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVWatchlistMessage(data)),
      );
    });
  }
}

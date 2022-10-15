import 'package:bloc/bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchMovies.execute(query);

      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (data) => emit(SearchHasData(data)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

class TVSearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTV _searchTV;

  TVSearchBloc(this._searchTV) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchTV.execute(query);

      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (data) => emit(TVSearchHasData(data)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

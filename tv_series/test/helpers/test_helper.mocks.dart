// Mocks generated by Mockito 5.3.2 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i16;
import 'dart:typed_data' as _i17;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i15;
import 'package:tv_series/data/datasources/db/database_helper_tv.dart' as _i14;
import 'package:tv_series/data/datasources/tv_local_data_source.dart' as _i12;
import 'package:tv_series/data/datasources/tv_remote_data_source.dart' as _i10;
import 'package:tv_series/data/model/tv_detail_model.dart' as _i3;
import 'package:tv_series/data/model/tv_model.dart' as _i11;
import 'package:tv_series/data/model/tv_table.dart' as _i13;
import 'package:tv_series/domain/entities/tv.dart' as _i8;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i9;
import 'package:tv_series/domain/repositories/tv_repository.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTVDetailResponse_1 extends _i1.SmartFake
    implements _i3.TVDetailResponse {
  _FakeTVDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TVRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVRepository extends _i1.Mock implements _i5.TVRepository {
  MockTVRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTVAiringToday() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVAiringToday,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTVAiringToday,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getPopularTVSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTVSeries,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getPopularTVSeries,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTopRatedTVSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTVSeries,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTopRatedTVSeries,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>> getTVSeriesDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.TVDetail>(
          this,
          Invocation.method(
            #getTVSeriesDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TVDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getTVSeriesRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getTVSeriesRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVSeries,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #searchTVSeries,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveTVWatchlist(
          _i9.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTVWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveTVWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeTVWatchlist(
          _i9.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTVWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeTVWatchlist,
            [tv],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isTVAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isTVAddedToWatchlist,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>> getWatchlistTV() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTV,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.TV>>(
          this,
          Invocation.method(
            #getWatchlistTV,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.TV>>>);
}

/// A class which mocks [TVSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRemoteDataSource extends _i1.Mock
    implements _i10.TVSeriesRemoteDataSource {
  MockTVSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TVModel>> getTVAiringToday() => (super.noSuchMethod(
        Invocation.method(
          #getTVAiringToday,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TVModel>>.value(<_i11.TVModel>[]),
      ) as _i6.Future<List<_i11.TVModel>>);
  @override
  _i6.Future<List<_i11.TVModel>> getPopularTVSeries() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTVSeries,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TVModel>>.value(<_i11.TVModel>[]),
      ) as _i6.Future<List<_i11.TVModel>>);
  @override
  _i6.Future<List<_i11.TVModel>> getTopRatedTVSeries() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTVSeries,
          [],
        ),
        returnValue: _i6.Future<List<_i11.TVModel>>.value(<_i11.TVModel>[]),
      ) as _i6.Future<List<_i11.TVModel>>);
  @override
  _i6.Future<_i3.TVDetailResponse> getTVSeriesDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesDetail,
          [id],
        ),
        returnValue:
            _i6.Future<_i3.TVDetailResponse>.value(_FakeTVDetailResponse_1(
          this,
          Invocation.method(
            #getTVSeriesDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TVDetailResponse>);
  @override
  _i6.Future<List<_i11.TVModel>> getTVSeriesRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesRecommendations,
          [id],
        ),
        returnValue: _i6.Future<List<_i11.TVModel>>.value(<_i11.TVModel>[]),
      ) as _i6.Future<List<_i11.TVModel>>);
  @override
  _i6.Future<List<_i11.TVModel>> searchTVSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVSeries,
          [query],
        ),
        returnValue: _i6.Future<List<_i11.TVModel>>.value(<_i11.TVModel>[]),
      ) as _i6.Future<List<_i11.TVModel>>);
}

/// A class which mocks [TVLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVLocalDataSource extends _i1.Mock implements _i12.TVLocalDataSource {
  MockTVLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertTVWatchlist(_i13.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertTVWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeTVWatchlist(_i13.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeTVWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TVTable?> getTVById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTVById,
          [id],
        ),
        returnValue: _i6.Future<_i13.TVTable?>.value(),
      ) as _i6.Future<_i13.TVTable?>);
  @override
  _i6.Future<List<_i13.TVTable>> getWatchlistTV() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTV,
          [],
        ),
        returnValue: _i6.Future<List<_i13.TVTable>>.value(<_i13.TVTable>[]),
      ) as _i6.Future<List<_i13.TVTable>>);
}

/// A class which mocks [DatabaseHelperTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTV extends _i1.Mock implements _i14.DatabaseHelperTV {
  MockDatabaseHelperTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i15.Database?>.value(),
      ) as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<int> insertTVWatchlist(_i13.TVTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertTVWatchlist,
          [tv],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeTVWatchlist(_i13.TVTable? tvTable) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeTVWatchlist,
          [tvTable],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTVById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTVById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTV() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTV,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i17.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i17.Uint8List>.value(_i17.Uint8List(0)),
      ) as _i6.Future<_i17.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

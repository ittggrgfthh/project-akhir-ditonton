import 'dart:convert';

import 'package:tv_series/data/model/tv_model.dart';
import 'package:tv_series/data/model/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/test/helpers/json_reader.dart';

void main() {
  const tTVModel = TVModel(
    backdropPath: '/o8zk3QmHYMSC7UiJgFk81OFF1sc.jpg',
    genreIds: [10766, 18],
    id: 204095,
    originalName: 'Mar do Sertão',
    overview: '',
    popularity: 1397.874,
    posterPath: '/ixgnqO8xhFMb1zr8RRFsyeZ9CdD.jpg',
    firstAirDate: '2022-08-22',
    name: 'Mar do Sertão',
    voteAverage: 4.5,
    voteCount: 11,
  );
  const tTVResponseModel = TVResponse(tvList: <TVModel>[tTVModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/airing_today.json'));
      // act
      final result = TVResponse.fromJson(jsonMap);
      // assert
      expect(result, tTVResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTVResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            'backdrop_path': '/o8zk3QmHYMSC7UiJgFk81OFF1sc.jpg',
            'genre_ids': [10766, 18],
            'id': 204095,
            'original_name': 'Mar do Sertão',
            'overview': '',
            'popularity': 1397.874,
            'poster_path': '/ixgnqO8xhFMb1zr8RRFsyeZ9CdD.jpg',
            'release_date': '2022-08-22',
            'name': 'Mar do Sertão',
            'vote_average': 4.5,
            'vote_count': 11
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}

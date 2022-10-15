import 'package:tv_series/data/model/tv_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

// TV Series
final testTV = TV(
  backdropPath: "/Aa9TLpNpBMyRkD8sPJ7ACKLjt0l.jpg",
  genreIds: const [10765, 18, 10759],
  id: 94997,
  originalName: "House of the Dragon",
  overview:
      "The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.",
  popularity: 4187.745,
  posterPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
  firstAirDate: "2022-08-21",
  name: "House of the Dragon",
  voteAverage: 8.6,
  voteCount: 1491,
);

final testTVList = [testTV];

const testTVDetail = TVDetail(
  backdropPath: "backdropPath",
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalName: "originalName",
  episodes: 1,
  seasons: 1,
  overview: 'overview',
  posterPath: "posterPath",
  firstAirDate: "firstAirDate",
  episodeRuntime: [],
  name: "name",
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistTV = TV.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: "posterPath",
  name: "name",
);

const testTVTable = TVTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTVMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};

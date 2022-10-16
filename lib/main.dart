import 'package:core/core.dart';
import 'package:about/about.dart';
import 'package:core/security/ssl.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies/presentation/bloc/movies_bloc.dart';
import 'package:movies/presentation/pages/movie_detail_page.dart';
import 'package:movies/presentation/pages/home_movie_page.dart';
import 'package:movies/presentation/pages/now_playing_page.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:tv_series/presentation/pages/popular_tv_page.dart';
import 'package:search/presentation/pages/search_tv_page.dart';
import 'package:tv_series/presentation/pages/top_rated_tv_page.dart';
import 'package:tv_series/presentation/pages/tv_airing_today_page.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';
import 'package:tv_series/presentation/pages/tv_series_page.dart';
import 'package:movies/presentation/pages/watchlist_page.dart';
import 'package:core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<GetMovieDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetNowPlayingMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetMovieRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<SearchBloc>()),
        // tv series
        BlocProvider(create: (_) => di.locator<GetTVDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVAiringTodayBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularTVBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedTVBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistTVBloc>()),
        BlocProvider(create: (_) => di.locator<TVSearchBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case NowPlayingPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TVSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TVSeriesPage());
            case TVAiringTodayPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TVAiringTodayPage());
            case TVDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVDetailPage(id: id),
                settings: settings,
              );
            case PopularTVPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTVPage());
            case TopRatedTVPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTVPage());
            case SearchTVPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchTVPage());
            case WatchlistPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

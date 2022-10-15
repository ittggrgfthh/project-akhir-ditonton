import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_bloc.dart';
import 'package:flutter/material.dart';

import '../widgets/tv_card_list.dart';

class TVAiringTodayPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv-airing-today';

  const TVAiringTodayPage({super.key});

  @override
  _TVAiringTodayPageState createState() => _TVAiringTodayPageState();
}

class _TVAiringTodayPageState extends State<TVAiringTodayPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<GetTVAiringTodayBloc>().add(OnTVAiringToday()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airing Today'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetTVAiringTodayBloc, TvState>(
          builder: (context, state) {
            if (state is TVLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TVHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.result[index];
                  return TVCard(tvSeries);
                },
                itemCount: state.result.length,
              );
            } else {
              return const Center(
                key: Key('error_message'),
                child: Text('Failed'),
              );
            }
          },
        ),
      ),
    );
  }
}

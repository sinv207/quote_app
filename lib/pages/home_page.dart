import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../configs/configs.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import '../utils/console_log.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // List<Quote> quotes = [
  //   const Quote(
  //       text:
  //           "The greatest glory in living lies not in never falling, but in rising every time we fall.",
  //       author: "Nelson Mandela"),
  //   const Quote(
  //       text: "The way to get started is to quit talking and begin doing.",
  //       author: "Walt Disney"),
  //   const Quote(
  //       text:
  //           "Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma - which is living with the results of other people's thinking.",
  //       author: "Steve Jobs"),
  //   const Quote(
  //       text:
  //           "If life were predictable it would cease to be life, and be without flavor.",
  //       author: "Eleanor Roosevelt"),
  //   const Quote(
  //       text:
  //           "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough.",
  //       author: "Oprah Winfrey "),
  // ];

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    console.log('🚀 ~ _MyHomePageState ~ Widgetbuild ~ context', context);

    return BlocProvider(
      create: (context) => QuotesBloc(
          quotesRepository: FirebaseQuotesRepository(
              user: const User(id: 'Dd5bq5V1pfxzgHtfzecX', name: '')))
        ..add(QuotesFetched()),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: BlocBuilder<QuotesBloc, QuotesState>(
            builder: (context, state) {
              // console.log(
              //     '🚀 ~ _MyHomePageState ~ Widgetbuild ~ quotes', state.quotes);
              console.log('🚀 ~ _MyHomePageState ~ Widgetbuild ~ favorites',
                  state.favorites);

              if (state.status == BlocStatus.success) {
                return QuotesPageView(
                  quotes: state.quotes,
                  favorites: state.favorites,
                );
              }
              return const Text('Something went wrong');
            },
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/pages/new_quote_page.dart';
import 'package:quote_app/repositories/firebase_themes_repository.dart';

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuotesBloc(
              quotesRepository: FirebaseQuotesRepository(
                  // TODO: replace by real user
                  user: const User(
            id: 'Dd5bq5V1pfxzgHtfzecX',
            name: '',
            userName: '',
          )))
            ..add(QuotesFetched()),
        ),
        BlocProvider(
          create: (context) => ThemesBloc(
            themesRepository: FirebaseThemesRepository(),
          )
            ..add(
              const QuoteThemesFetched([]),
            )
            ..add(QuoteThemeLoaded()),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: const HomeAppBar(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const HomeFloatButtons(),

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

class HomeFloatButtons extends StatelessWidget {
  const HomeFloatButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () async {
              final result = await showModalBottomSheet(
                context: context,
                // Remove default color to show border radius
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  height: 360,
                  child: NewQuotePage(),
                ),
              );
              if (result != null) {
                // Do something...
                print((result as Quote).toString());
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(Icons.create_rounded),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(Icons.person_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(widget.title),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.workspace_premium_rounded),
                ),
                Text('Try for free'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/blocs/quotes/quotes_bloc.dart';

import '../../models/models.dart';
import 'quote_view.dart';

class QuotesPageView extends StatelessWidget {
  final List<Quote> quotes;
  final Map<String, bool> favorites;

  final PageController _controller = PageController();

  QuotesPageView({
    Key? key,
    required this.quotes,
    required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: quotes.length,
      controller: _controller,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => QuoteView(
        quote: quotes[index].copyWith(isFavorite: favorites[quotes[index].id]),
        // updateFavorite
      ),
    );
  }
}

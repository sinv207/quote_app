import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/blocs/blocs.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/models.dart';

typedef FavoriteActionCallback = void Function(bool);
typedef ShareActionCallback = void Function();

class QuoteView extends StatefulWidget {
  const QuoteView({
    Key? key,
    required this.quote,
    // required this.updateFavorite,
    // required this.shareQuote,
  }) : super(key: key);

  final Quote quote;

  // final FavoriteActionCallback updateFavorite;
  // final ShareActionCallback shareQuote;

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  void _shareQuote(Quote quote) {
    // Share.share(
    //   quote.text,
    //   subject: "Motivation Quote",
    // );
    Share.shareFiles(
      ['assets/images/image_01.png'],
      text: quote.text,
      subject: "Motivation Quote",
    );
  }

  bool _isFavorite = false;

  @override
  void initState() {
    _isFavorite = widget.quote.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quotesBloc = BlocProvider.of<QuotesBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.quote.text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '--${widget.quote.author}--',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(
            height: 88,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  // Call a callback function to manage quote on server side
                  // widget.shareQuote();

                  _shareQuote(widget.quote);
                },
                // onPressed: () => {},
                icon: const Icon(Icons.share),
                iconSize: 34,
              ),
              const SizedBox(
                width: 44,
              ),
              IconButton(
                onPressed: () {
                  // widget.updateFavorite(!_isFavorite);
                  quotesBloc.add(FavoriteQuoteUpdated(
                    quoteId: widget.quote.id,
                    flag: !_isFavorite,
                  ));
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  // TODO: correct icon's color depend on theme.
                  color: (_isFavorite || widget.quote.isFavorite)
                      ? Colors.red
                      : Colors.white,
                ),
                iconSize: 34,
              )
            ],
          ),
        ],
      ),
    );
  }
}

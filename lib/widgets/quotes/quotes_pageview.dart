import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/blocs/blocs.dart';
import 'package:quote_app/utils/utils.dart';

import '../../models/models.dart';
import 'quote_view.dart';

class QuotesPageView extends StatefulWidget {
  final List<Quote> quotes;
  final Map<String, bool> favorites;

  QuotesPageView({
    Key? key,
    required this.quotes,
    required this.favorites,
  }) : super(key: key);

  @override
  State<QuotesPageView> createState() => _QuotesPageViewState();
}

class _QuotesPageViewState extends State<QuotesPageView> {
  final PageController _controller = PageController();

  String _imageUrl = '';

  void _onImageChanged(String url) {
    console.log('🚀 ~ _QuoteViewState ~ void_onImageChanged ~ url', url);
    setState(() {
      _imageUrl = url;
    });
  }

  void _setImage(String name) {
    // final storageRef = FirebaseStorage.instance.ref();
    // TODO: reduce image size to increase performance
    try {
      FirebaseStorage.instance
          .ref()
          .child(name)
          .getDownloadURL()
          .then(_onImageChanged);
    } catch (err) {
      _imageUrl = '';
      console.log('🚀 ~ _QuoteViewState ~ void_setImage ~ err', err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        if (state.quoteTheme.image.isNotEmpty) {
          console.log(state.quoteTheme.image);
          console.log(_imageUrl.split('/').last.split('?').first);
          if (_imageUrl.isEmpty ||
              state.quoteTheme.image !=
                  _imageUrl.split('/').last.split('?').first) {
            _setImage(state.quoteTheme.image);
          }
        }
        return Container(
          decoration: BoxDecoration(
            image: _imageUrl.isNotEmpty
                ? DecorationImage(
                    // image: NetworkImage(_imageUrl),
                    image: CachedNetworkImageProvider(
                      _imageUrl,
                      cacheKey: _imageUrl,
                    ),
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8),
                      BlendMode.modulate,
                    ),
                    // image: AssetImage(state.quoteTheme.image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )
                : null,
          ),
          child: PageView.builder(
            itemCount: widget.quotes.length,
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => QuoteView(
              quote: widget.quotes[index].copyWith(
                  isFavorite: widget.favorites[widget.quotes[index].id]),
              quoteTheme: state.quoteTheme,
              // updateFavorite
            ),
          ),
        );
      },
    );
  }
}

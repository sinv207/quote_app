import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quote_app/repositories/quotes_repository.dart';

import '../../configs/enums.dart';
import '../../models/quote.dart';
import '../../utils/console_log.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc({required QuotesRepository quotesRepository})
      : _quotesRepository = quotesRepository,
        super(const QuotesState.initial()) {
    on<QuotesFetched>(_quotesFetched);
    on<QuotesUpdated>(_quotesUpdated);
    on<QuotesAdded>(_quotesAdded);
    on<FavoriteQuoteUpdated>(_favoritesUpdated);

    // _quotesSubscription.cancel();
    // StreamSubscription<List<Quote>> _quotesSubscription =

    _quotesRepository.quotes().listen((quotes) {
      console.log(
          '🚀 ~ QuotesBloc ~ _quotesSubscription=_quotesRepository.quotes ~ quotes',
          quotes);

      add(QuotesUpdated(quotes));
    });
  }

  final QuotesRepository _quotesRepository;

  Future<void> _quotesFetched(
      QuotesFetched event, Emitter<QuotesState> emit) async {
    // _quotesRepository.quotes()
  }

  FutureOr<void> _quotesUpdated(
      QuotesUpdated event, Emitter<QuotesState> emit) async {
    final favorites = await _quotesRepository.fetchFavorites();

    Map<String, bool> favoriteQuotes = <String, bool>{};

    for (var fav in favorites) {
      favoriteQuotes[fav.quoteId] = fav.isFavorite;
    }
    emit(
      state.copyWith(
          status: BlocStatus.success,
          quotes: event.quotes,
          favorites: favoriteQuotes),
    );
  }

  FutureOr<void> _favoritesUpdated(
      FavoriteQuoteUpdated event, Emitter<QuotesState> emit) async {
    emit(state.copyWith(
      status: BlocStatus.loading,
    ));

    console.log('🚀 ~ QuotesBloc ~ event', event);
    _quotesRepository.updateFavorite(event.quoteId, event.flag);

    if (!state.favorites.containsKey(event.quoteId)) {
      state.favorites.addAll(<String, bool>{event.quoteId: event.flag});
    } else {
      state.favorites.update(event.quoteId, (value) => event.flag);
    }

    console.log('🚀 ~ QuotesBloc ~ favorites', state.favorites);

    emit(state.copyWith(
      status: BlocStatus.success,
      favorites: Map.of(state.favorites),
    ));
  }

  FutureOr<void> _quotesAdded(QuotesAdded event, Emitter<QuotesState> emit) {
    _quotesRepository.addNewQuote(event.quote);
  }
}

part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class QuotesFetched extends QuotesEvent {
  @override
  List<Object> get props => [];
}

class QuotesUpdated extends QuotesEvent {
  final List<Quote> quotes;

  const QuotesUpdated(this.quotes);
  @override
  List<Object> get props => [quotes];
}

class FavoriteQuoteUpdated extends QuotesEvent {
  final String quoteId;
  final bool flag;

  const FavoriteQuoteUpdated({required this.quoteId, required this.flag});

  @override
  List<Object> get props => [quoteId, flag];
}

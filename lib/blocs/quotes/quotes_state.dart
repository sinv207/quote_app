part of 'quotes_bloc.dart';

class QuotesState extends Equatable {
  const QuotesState._({
    required this.quotes,
    required this.status,
    required this.favorites,
  });

  final BlocStatus status;

  final List<Quote> quotes;
  final Map<String, bool> favorites; // <quoteId, isFavorite>

  const QuotesState.initial()
      : this._(
          quotes: const <Quote>[],
          status: BlocStatus.initial,
          favorites: const {},
        );

  QuotesState copyWith({
    List<Quote>? quotes,
    BlocStatus? status,
    Map<String, bool>? favorites,
  }) {
    return QuotesState._(
      quotes: quotes ?? this.quotes,
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object> get props => [quotes, status, favorites];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'themes_bloc.dart';

class ThemesState extends Equatable {
  const ThemesState._(
      {required this.themes, required this.status, required this.quoteTheme});

  /// List of themes from server
  final List<QuoteTheme> themes;

  /// Selected theme for all pages
  final QuoteTheme quoteTheme;

  final BlocStatus status;

  ThemesState.initial()
      : this._(
          themes: [],
          quoteTheme: QuoteTheme.initial,
          status: BlocStatus.initial,
        );

  ThemesState copyWith({
    List<QuoteTheme>? themes,
    QuoteTheme? quoteTheme,
    BlocStatus? status,
  }) {
    return ThemesState._(
      themes: themes ?? this.themes,
      quoteTheme: quoteTheme ?? this.quoteTheme,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [themes, quoteTheme, status];
}

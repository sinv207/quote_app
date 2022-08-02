part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  const ThemesEvent();

  @override
  List<Object> get props => [];
}

class QuoteThemesFetched extends ThemesEvent {
  final List<QuoteTheme> themes;

  const QuoteThemesFetched(this.themes);

  @override
  List<Object> get props => [themes];
}

class QuoteThemeChanged extends ThemesEvent {
  final QuoteTheme theme;

  const QuoteThemeChanged(this.theme);

  @override
  List<Object> get props => [theme];
}

class QuoteThemeLoaded extends ThemesEvent {
  @override
  List<Object> get props => [];
}

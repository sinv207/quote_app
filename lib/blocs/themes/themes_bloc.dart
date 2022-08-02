import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quote_app/repositories/themes_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/configs.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc({required ThemesRepository themesRepository})
      : _themesRepository = themesRepository,
        super(ThemesState.initial()) {
    on<QuoteThemesFetched>(_quoteThemesFetched);
    on<QuoteThemeChanged>(_quoteThemeChanged);
    on<QuoteThemeLoaded>(_quoteThemeLoaded);
  }

  final ThemesRepository _themesRepository;

  Future<FutureOr<void>> _quoteThemesFetched(
      QuoteThemesFetched event, Emitter<ThemesState> emit) async {
    final themes = await _themesRepository.fetchThemes();
    emit(state.copyWith(
      themes: themes,
      status: BlocStatus.success,
    ));
  }

  Future<FutureOr<void>> _quoteThemeChanged(
      QuoteThemeChanged event, Emitter<ThemesState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('quote_theme_select1', event.theme.toJson());
    } catch (_) {}
    // [always]
    emit(state.copyWith(quoteTheme: event.theme));
  }

  Future<FutureOr<void>> _quoteThemeLoaded(
      QuoteThemeLoaded event, Emitter<ThemesState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? themeString = prefs.getString('quote_theme_select1');
      if (themeString != null && themeString.isNotEmpty) {
        final theme = QuoteTheme.fromJson(themeString);
        emit(
          state.copyWith(
            quoteTheme: theme,
          ),
        );
      }
    } catch (_) {}
  }
}

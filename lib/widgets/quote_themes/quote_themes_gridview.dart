import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/blocs/blocs.dart';

import 'theme_view.dart';

class QuoteThemesGridView extends StatelessWidget {
  const QuoteThemesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesBloc, ThemesState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return ThemeViewOption(quoteTheme: state.themes[index % 10]);
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class ThemeViewOption extends StatelessWidget {
  const ThemeViewOption({
    Key? key,
    required this.quoteTheme,
  }) : super(key: key);

  final QuoteTheme quoteTheme;
  final String baseUrl = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        console.log('🚀 ~ ThemeOption ~ Widgetbuild ~ quoteTheme',
            quoteTheme.toString());

        if (Navigator.canPop(context)) {
          Navigator.pop(context, quoteTheme);
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                // 'assets/images/image_01.png',
                '$baseUrl${quoteTheme.image}',
                height: 200, // full parent
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
                child: Text(
              'Abcd',
              style: quoteTheme.getStyle(Theme.of(context).textTheme.headline4),
            )),
          )
        ],
      ),
    );
  }
}

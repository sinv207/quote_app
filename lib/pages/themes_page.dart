import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Themes')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: QuoteThemesGridView(),
        ),
      ),
    );
  }
}

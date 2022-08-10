import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quote_app/models/quote.dart';

class NewQuotePage extends StatefulWidget {
  NewQuotePage({Key? key}) : super(key: key);

  @override
  State<NewQuotePage> createState() => _NewQuotePageState();
}

class _NewQuotePageState extends State<NewQuotePage> {
  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  String get quote => _quoteController.text;
  String get author => _authorController.text;

  final FocusNode _quoteFocusNode = FocusNode();
  final FocusNode _authorFocusNode = FocusNode();

  @override
  void initState() {
    _quoteFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.create_outlined),
            const SizedBox(height: 16),
            const Text('Add a new quote'),
            const SizedBox(height: 16),
            // Text(
            //   'Write and share your own quotes. These will only be visible to you.',
            //   textAlign: TextAlign.center,
            // ),
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your quote here',
              ),
              controller: _quoteController,
              focusNode: _quoteFocusNode,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Author (optional)',
              ),
              controller: _authorController,
              focusNode: _authorFocusNode,
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 44)),
                      onPressed: () {
                        if (quote.isNotEmpty) {
                          final newQuote =
                              Quote(id: '', text: quote, author: author);
                          Navigator.of(context).pop(newQuote);
                        }
                      },
                      icon: const Icon(Icons.create_outlined),
                      label: const Text('Save')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

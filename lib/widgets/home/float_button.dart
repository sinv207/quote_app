import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../pages/new_quote_page.dart';

class HomeFloatButtons extends StatelessWidget {
  const HomeFloatButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuotesBloc bloc = BlocProvider.of<QuotesBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () async {
              final result = await showModalBottomSheet(
                context: context,
                // Avoid keyboard
                isScrollControlled: true,
                // Remove default color to show border radius
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => Padding(
                  // Avoid keyboard
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    // height: 300,
                    // Wrap for dynamic height
                    child: Wrap(
                      children: [
                        NewQuotePage(),
                      ],
                    ),
                  ),
                ),
              );

              if (result != null) {
                // Do something...
                print((result as Quote).toString());
                bloc.add(QuotesAdded((result as Quote)));
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(Icons.create_rounded),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Icon(Icons.person_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

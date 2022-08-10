import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text(widget.title),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.workspace_premium_rounded),
                ),
                Text('Try for free'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

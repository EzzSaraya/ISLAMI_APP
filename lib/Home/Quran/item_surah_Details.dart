import 'package:flutter/material.dart';

class item_surah extends StatelessWidget {
  item_surah({required this.content, required this.index});

  String content;

  int index;

  @override
  Widget build(BuildContext context) {
    return Text('$content (${index + 1})',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.titleLarge);
  }
}

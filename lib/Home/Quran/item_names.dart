import 'package:flutter/material.dart';
import 'package:islami_app/Home/Quran/surah_details.dart';

class ItemNames extends StatelessWidget {
  String name;
  int index;

  ItemNames({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SurahDetails.routename,
              arguments: Surahdetailsargs(name: name, index: index));
        },
        child: Text(name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall));
  }
}

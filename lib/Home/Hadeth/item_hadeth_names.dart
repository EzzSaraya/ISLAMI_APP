import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/Hadeth_details_Screen.dart';

import 'hadeth_tab.dart';

class ItemHadethNames extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethNames({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(HadethDetails.routename, arguments: hadeth);
        },
        child: Text(hadeth.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall));
  }
}

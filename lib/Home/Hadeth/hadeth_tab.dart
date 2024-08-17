import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Hadeth/item_hadeth_names.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';

class hadethtab extends StatefulWidget {
  @override
  State<hadethtab> createState() => _hadethtabState();
}

class _hadethtabState extends State<hadethtab> {
  List<Hadeth> ahadethlist = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    if (ahadethlist.isEmpty) {
      loadhadethfile();
    }
    return Container(
      child: Column(children: [
        SizedBox(
          height: 75,
        ),
        Image.asset("assets/images/hadeth_logo.png"),
        Divider(
          thickness: 4,
          color: provider.isdark()
              ? AppColors.YellowColor
              : AppColors.PrimaryLightColor,
          height: 5,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          thickness: 4,
          color: provider.isdark()
              ? AppColors.YellowColor
              : AppColors.PrimaryLightColor,
          height: 5,
        ),
        Expanded(
          flex: 2,
          child: ahadethlist.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: provider.isdark()
                        ? AppColors.YellowColor
                        : AppColors.PrimaryLightColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: ItemHadethNames(hadeth: ahadethlist[index]));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      color: provider.isdark()
                          ? AppColors.YellowColor
                          : AppColors.PrimaryLightColor,
                      height: 18,
                    );
                  },
                  itemCount: ahadethlist.length),
        )
      ]),
    );
  }

  void loadhadethfile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/hadeth.txt");
    List<String> hadethlist = hadethContent.split('#\r\n');

    for (int i = 0; i < hadethlist.length; i++) {
      List<String> hadethlines = hadethlist[i].split('\n');
      String title = hadethlines[0];
      hadethlines.removeAt(0);

      Hadeth hadeth = Hadeth(title: title, content: hadethlines);
      ahadethlist.add(hadeth);

      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}

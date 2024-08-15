import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

class item_hadeth extends StatelessWidget {
  item_hadeth({required this.content});

  String content;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Text(content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: provider.isdark()
                ? AppColors.YellowColor
                : AppColors.BlackColor));
  }
}

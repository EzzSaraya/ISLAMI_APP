import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

class radiotab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 2, child: Image.asset("assets/images/radio_image.png")),
        Center(
            child: Text(
          "اذاعة القرأن الكريم",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: provider.isdark()
                  ? AppColors.WhiteColor
                  : AppColors.BlackColor),
        )),
        provider.isdark()
            ? Expanded(
                flex: 1, child: Image.asset("assets/images/radio_bar_dark.png"))
            : Expanded(
                flex: 1, child: Image.asset("assets/images/radio_bar.png")),
      ],
    );
  }
}
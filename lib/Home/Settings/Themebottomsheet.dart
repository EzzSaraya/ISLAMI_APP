import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/config_app_provider.dart';

class themebottomsheet extends StatefulWidget {
  @override
  State<themebottomsheet> createState() => _themebottomsheetState();
}

class _themebottomsheetState extends State<themebottomsheet> {
  late Appconfigprovider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Appconfigprovider>(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(
                  context); // Close the modal immediately after changing the theme
            },
            child: provider.isdark()
                ? selectedlang(AppLocalizations.of(context)!.dark)
                : unselectedlang(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(
                  context); // Close the modal immediately after changing the theme
            },
            child: !provider.isdark()
                ? selectedlang(AppLocalizations.of(context)!.light)
                : unselectedlang(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget selectedlang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: provider.isdark()
                  ? AppColors.YellowColor
                  : AppColors.PrimaryLightColor),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: provider.isdark()
              ? AppColors.YellowColor
              : AppColors.PrimaryLightColor,
        )
      ],
    );
  }

  Widget unselectedlang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodySmall),
        Icon(
          Icons.check,
          size: 35,
        )
      ],
    );
  }
}

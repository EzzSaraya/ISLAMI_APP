import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Settings/languagabottomsheet.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/config_app_provider.dart';

class settingstab extends StatefulWidget {
  @override
  State<settingstab> createState() => _settingstabState();
}

class _settingstabState extends State<settingstab> {
  late Appconfigprovider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Appconfigprovider>(context);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottom();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: provider.isdark()
                      ? AppColors.YellowColor
                      : AppColors.PrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLang == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium),
                  provider.appLang == 'en'
                      ? CountryFlag.fromLanguageCode(
                          'en',
                          width: 30,
                          height: 20,
                        )
                      : CountryFlag.fromLanguageCode(
                          'ar-EG',
                          width: 30,
                          height: 20,
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              ShowThemeBottom();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: provider.isdark()
                      ? AppColors.YellowColor
                      : AppColors.PrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isdark()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          )
        ]));
  }

  void ShowLanguageBottom() {
    showModalBottomSheet(
        backgroundColor: provider.isdark()
            ? AppColors.PrimaryDarkColor
            : AppColors.WhiteColor,
        context: context, builder: (context) => languagebottomsheet());
  }

  void ShowThemeBottom() {
    showModalBottomSheet(
        backgroundColor: provider.isdark()
            ? AppColors.PrimaryDarkColor
            : AppColors.WhiteColor,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        provider.changeTheme(ThemeMode.dark);
                        setModalState(() {}); // Update modal state
                        Navigator.pop(context); // Close the modal
                      },
                      child: provider.isdark()
                          ? selectedlang(AppLocalizations.of(context)!.dark)
                          : unselectedlang(AppLocalizations.of(context)!.dark),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        provider.changeTheme(ThemeMode.light);
                        setModalState(() {}); // Update modal state
                        Navigator.pop(context); // Close the modal
                      },
                      child: !provider.isdark()
                          ? selectedlang(AppLocalizations.of(context)!.light)
                          : unselectedlang(AppLocalizations.of(context)!.light),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Widget selectedlang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.isdark()
                    ? AppColors.YellowColor
                    : AppColors.PrimaryLightColor)),
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

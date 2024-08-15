import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart'; // Ensure this is imported

import '../../providers/config_app_provider.dart';

class languagebottomsheet extends StatefulWidget {
  @override
  State<languagebottomsheet> createState() => _languagebottomsheetState();
}

class _languagebottomsheetState extends State<languagebottomsheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLang == 'en'
                  ? selectedlang(AppLocalizations.of(context)!.english)
                  : unselectedlang(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLang == 'ar'
                  ? selectedlang(AppLocalizations.of(context)!.arabic)
                  : unselectedlang(AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget selectedlang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.PrimaryLightColor)),
        CountryFlag.fromLanguageCode(
          'en',
          width: 30,
          height: 20,
        )
      ],
    );
  }

  Widget unselectedlang(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodySmall),
        CountryFlag.fromLanguageCode(
          'ar-Eg',
          width: 30,
          height: 20,
        )
      ],
    );
  }
}

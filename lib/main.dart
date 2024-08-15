import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Hadeth/Hadeth_details_Screen.dart';
import 'package:islami_app/Home/Quran/surah_details.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

import 'Home/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Appconfigprovider(), child: islami()));
}

class islami extends StatelessWidget {
  const islami({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      theme: MyThemeData.LightTheme,
        themeMode: provider.appTheme,
        darkTheme: MyThemeData.darkTheme,
        routes: {
          HomeScreen.routename: (context) => HomeScreen(),
          SurahDetails.routename: (context) => SurahDetails(),
          HadethDetails.routename: (context) => HadethDetails()
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.appLang));
  }
}

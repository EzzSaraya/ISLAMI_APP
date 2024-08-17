import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Hadeth/hadeth_tab.dart';
import 'package:islami_app/Home/Quran/quran_Tab.dart';
import 'package:islami_app/Home/Radio/radio_tab.dart';
import 'package:islami_app/Home/Sebha/sebha_tab.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

import 'Settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: MyThemeData.LightTheme.textTheme.bodyLarge!.copyWith(
              color: provider.isdark()
                  ? AppColors.WhiteColor
                  : AppColors.BlackColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          provider.isdark()
              ? Image.asset(
                  "assets/images/Background_dark.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "assets/images/main_background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          tabs[selectedindex],
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/Quran_icon.png"),
                ),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/hadeth_icon.png"),
                ),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_icon.png"),
                ),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/radio_icon.png"),
                ),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings)
          ],
          backgroundColor: AppColors.PrimaryLightColor,
        ),
      ),
    );
  }

  List<Widget> tabs = [
    qurantab(),
    hadethtab(),
    sebhatab(),
    radiotab(),
    settingstab()
  ];
}
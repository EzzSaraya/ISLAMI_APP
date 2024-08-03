import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/hadeth_tab.dart';
import 'package:islami_app/Home/Quran/quran_Tab.dart';
import 'package:islami_app/Home/Radio/radio_tab.dart';
import 'package:islami_app/Home/Sebha/sebha_tab.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/my_theme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Islami',
          style: MyThemeData.LightTheme.textTheme.bodyLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
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
                label: "Quran"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/hadeth_icon.png"),
                ),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/sebha_icon.png"),
                ),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/radio_icon.png"),
                ),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ],
          backgroundColor: AppColors.PrimaryLightColor,
        ),
      ),
    );
  }

  List<Widget> tabs = [qurantab(), hadethtab(), sebhatab(), radiotab()];
}
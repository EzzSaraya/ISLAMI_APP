import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for rootBundle
import 'package:islami_app/Home/Quran/item_surah_Details.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart'; // Corrected import statement
import '../../my_theme_data.dart';

class SurahDetails extends StatefulWidget {
  static const String routename = "surah_details";

  @override
  _SurahDetailsState createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Surahdetailsargs;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.name,
          style: MyThemeData.LightTheme.textTheme.bodyLarge,
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
          verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: provider.isdark()
                        ? AppColors.YellowColor
                        : AppColors.PrimaryLightColor,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  decoration: BoxDecoration(
                      color: provider.isdark()
                          ? AppColors.PrimaryDarkColor
                          : AppColors.WhiteColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                        color: provider.isdark()
                            ? AppColors.YellowColor
                            : AppColors.PrimaryLightColor,
                        height: 18,
                      );
                    },
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: item_surah(
                          content: verses[index],
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {
      verses = lines;
    });
  }
}

class Surahdetailsargs {
  final String name;
  final int index;

  Surahdetailsargs({
    required this.name,
    required this.index,
  });
}

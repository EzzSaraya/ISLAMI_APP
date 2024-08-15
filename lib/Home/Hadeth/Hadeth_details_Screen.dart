import 'package:flutter/material.dart';
import 'package:islami_app/Home/Hadeth/item_Hadeth_Details.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../my_theme_data.dart';
import 'hadeth_tab.dart'; // Corrected import statement

class HadethDetails extends StatefulWidget {
  static const String routename = "Hadeth_details";

  @override
  _HadethDetailsState createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.title,
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
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.06),
            decoration: BoxDecoration(
                color: provider.isdark()
                    ? AppColors.PrimaryDarkColor
                    : AppColors.WhiteColor,
                borderRadius: BorderRadius.circular(24)),
            child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return item_hadeth(content: args.content[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

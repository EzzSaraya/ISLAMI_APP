import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/config_app_provider.dart';

class sebhatab extends StatefulWidget {
  @override
  State<sebhatab> createState() => _sebhatabState();
}

class _sebhatabState extends State<sebhatab> {
  int counter = 0;

  double angle = 0;

  int index = 0;

  String content = 'سبحان الله';

  List<String> tasbehat = ['سبحان الله', 'الحمدلله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.09,
                    child: provider.isdark()
                        ? Image.asset("assets/images/head_sebha_dark.png")
                        : Image.asset("assets/images/head_sebha_light.png")),
                provider.isdark()
                    ? GestureDetector(
                        onTap: onTap,
                        child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                                "assets/images/body_sebha_dark.png")))
                    : GestureDetector(
                        onTap: onTap,
                        child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                                "assets/images/body_sebha_light.png")),
                      )
              ],
            ),
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: provider.isdark()
                    ? AppColors.YellowColor
                    : AppColors.PrimaryLightColor,
                borderRadius: BorderRadius.circular(24)),
            child: Text(
              "$counter",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: provider.isdark()
                      ? AppColors.BlackColor
                      : AppColors.WhiteColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: provider.isdark()
                      ? AppColors.YellowColor
                      : AppColors.PrimaryLightColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Text(
                tasbehat[index],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: provider.isdark()
                        ? AppColors.BlackColor
                        : AppColors.WhiteColor),
              ))
        ],
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbehat.length) {
      index = 0;
    }
    angle += 30;
    setState(() {});
  }
}

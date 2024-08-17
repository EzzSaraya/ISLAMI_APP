import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Home/Quran/item_names.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/config_app_provider.dart';
import 'package:provider/provider.dart';

class qurantab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);
    return Container(
      child: Column(children: [
        SizedBox(
          height: 75,
        ),
        Image.asset("assets/images/quran_logo_image.png"),
        Divider(
          thickness: 4,
          color: provider.isdark()
              ? AppColors.YellowColor
              : AppColors.PrimaryLightColor,
          height: 5,
        ),
        Text(AppLocalizations.of(context)!.surah_name,
            style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          thickness: 4,
          color: provider.isdark()
              ? AppColors.YellowColor
              : AppColors.PrimaryLightColor,
          height: 5,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ItemNames(
                  name: surah_names[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  color: provider.isdark()
                      ? AppColors.YellowColor
                      : AppColors.PrimaryLightColor,
                  height: 18,
                );
              },
              itemCount: surah_names.length),
        )
      ]),
    );
  }

  List<String> surah_names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
}

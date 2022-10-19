import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  const LeaderboardItem({Key? key, required this.name, required this.hours, required this.level, required this. ratio, required this.category, required this.itemNum}) : super(key: key);
  final name;
  final hours;
  final level;
  final ratio;
  final category;
  final itemNum;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 100,
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE5E5E5)),
            borderRadius: BorderRadius.circular(12),
            color: Color(0xffFAFAFA)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${itemNum}. ${name}',style: const TextStyle( fontWeight: FontWeight.w600, fontSize: 18)),
                  Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffFFCC33),
                        Color(0xffE233FF),
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: Container(
                      constraints:
                      const BoxConstraints(minWidth: 97.0, minHeight: 35.0),
                      // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: Text(
                        'Level ${level}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style:  TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0D0D0D),
                      ),
                      children: <TextSpan>[
                        TextSpan(text: '${hours} hours \n',style: const TextStyle( fontWeight: FontWeight.w500,)),
                        TextSpan(text: '(Spent on ${category})',style: const TextStyle( color: Color(0xff959595),)),
                      ],
                    ),
                  ),
                  Text('Ratio : ${ratio}%',style: const TextStyle( color: Color(0xffE547E3),fontWeight: FontWeight.w700, fontSize: 20), textAlign: TextAlign.center,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_e_ratio/Components/timeline_tile.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../Components/gradient_switch.dart';
import '../Components/gradient_text.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int index = 0;
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Container(
            height: 54,
            width: 400,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE5E5E5)),
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffFAFAFA)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            colors: index == 0
                                ? [Color(0xffFFCC33), Color(0xffE233FF)]
                                : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Center(
                          child: Text(
                        '1 Day',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: index == 0
                                ? Color(0xffffffff)
                                : Color(0xff1A1A1A)),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            colors: index == 1
                                ? [Color(0xffFFCC33), Color(0xffE233FF)]
                                : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Center(
                          child: Text(
                        '7 Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: index == 1
                                ? Color(0xffffffff)
                                : Color(0xff1A1A1A)),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                            colors: index == 2
                                ? [Color(0xffFFCC33), Color(0xffE233FF)]
                                : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Center(
                          child: Text(
                        '30 Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: index == 2
                                ? Color(0xffffffff)
                                : Color(0xff1A1A1A)),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Education: \nEntertainment',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),
                Center(
                  child: CustomSwitch(
                    activeColor: Color(0xffFFCC33),
                    value: _switchValue,
                    onChanged: (value) {
                      print("VALUE : $value");
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
                Text(
                  'Instant/Delayed\nGratification',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1A1A1A).withOpacity(0.5)),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Activity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          // CustomTimeLineTile(title: 'Read a Book', subTitle: 'Education', time: '1 hr', isFirst: true),
          // CustomTimeLineTile(title: 'Practice Coding', subTitle: 'Education', time: '2 hr'),
          // CustomTimeLineTile(title: 'Work On E-Commerce Website', subTitle: 'Education', time: '2 hr'),
          // CustomTimeLineTile(title: 'Play Video Game', subTitle: 'Entertainment', time: '1 hr'),
          // CustomTimeLineTile(title: 'Watch TV', subTitle: 'Entertainment', time: '2 hr 30 mins', isLast: true,),
          SizedBox(
            height: 15,
          ),
          Divider(thickness: 2, color: Color(0xffE5E5E5),),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff7CEAAB)
                        ),
                      ),
                      SizedBox(width: 10,),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color(0xff1A1A1A),
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Total : ',style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                            TextSpan(text: '4hr', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),

                          ],
                        ),
                      ),
                    ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFF3939)
                    ),
                  ),
                  SizedBox(width: 10,),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color(0xff1A1A1A),
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Total : ',style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                        TextSpan(text: '3.5hr', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Color(0xff28BA67),
              Color(0xff28BA67),

              Color(0xff7CEAAB),
              Color(0xff7CEAAB),
              Color(0xffFFB2B2),
              Color(0xffFF3939),
            ]).createShader(
              Rect.fromLTWH(0, 0, bounds.width*0.9, bounds.height),
            ),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: 0.65,
              barRadius: Radius.circular(10),
              backgroundColor: Color(0xffFF3939).withOpacity(0.5),
              progressColor: Color(0xff7CEAAB),
            ),
          ),
          // LinearPercentIndicator(
          //   animation: true,
          //   lineHeight: 20.0,
          //   animationDuration: 2500,
          //   percent: 0.8,
          //   barRadius: Radius.circular(10),
          //   backgroundColor: Color(0xffFF3939).withOpacity(0.5),
          //   progressColor: Color(0xff7CEAAB),
          // ),
          SizedBox(
            height: 25,
          ),
          Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffFFCC33),
                Color(0xffE233FF),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Container(
              constraints:
                  const BoxConstraints(minWidth: 88.0, minHeight: 47.0),
              // min sizes for Material buttons
              alignment: Alignment.center,
              child: const Text(
                'Add Activity',
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
    ));
  }
}

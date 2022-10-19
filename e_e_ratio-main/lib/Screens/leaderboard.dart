import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/gradient_text.dart';
import '../Components/leaderboard_item.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  int index = 0;
  bool _switchValue=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Container(
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Leaderboard', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: const Color(0xff1A1A1A)),),
                        Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFFF5D4),
                          ),
                          child: Center(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/crown.png'
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1A1A1A),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Placement'),
                              TextSpan(text: '5', style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.w700,color: Color(0xffE547E3))),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1A1A1A),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Weekly Level'),
                              TextSpan(text: '39', style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.w700,color: Color(0xffE547E3))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 19,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A),
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Week Ratio'),
                            TextSpan(text: '71%', style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.w700,color: Color(0xffE547E3))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 19,),
                    Container(
                      height: 54,
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE5E5E5)),
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffE5E5E5).withOpacity(0.3)
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: (){
                                setState((){
                                  index = 0;
                                });
                              },
                              child: Container(
                                height: 42,
                                width: 161,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                      colors: index == 0 ? [Color(0xffFFCC33), Color(0xffE233FF)] : [Color(0xffE5E5E5).withOpacity(0.3), Color(0xffE5E5E5).withOpacity(0.3)],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp
                                  ),
                                ),
                                child: Center(child: Text('Weekly Challenge',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color:  index == 0 ? Color(0xffffffff) : Color(0xff1A1A1A)),)),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState((){
                                  index = 1;
                                });
                              },
                              child: Container(
                                height: 42,
                                width: 161,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                      colors: index == 1 ? [Color(0xffFFCC33), Color(0xffE233FF)] : [Color(0xffE5E5E5).withOpacity(0.3), Color(0xffE5E5E5).withOpacity(0.3)],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp
                                  ),
                                ),
                                child: Center(child: Text('All - Time',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12,color:  index == 1 ? Color(0xffffffff) : Color(0xff1A1A1A)),)),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientText(
                          'E',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                          gradient: LinearGradient(colors: [
                            Color(0xff7CEAAB),
                            Color(0xff28BA67),
                          ]),
                        ),
                        GradientText(
                          ':',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                          gradient: LinearGradient(colors: [
                            Color(0xff1A1A1A),
                            Color(0xff1A1A1A),
                          ]),
                        ),
                        GradientText(
                          'E',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                          gradient: LinearGradient(colors: [
                            Color(0xffFFB2B2),
                            Color(0xffFF3939),
                          ]),
                        ),
                      ],
                    ),

                    SizedBox(height: 11,),
                    Container(
                      height: 61,
                      width: 410,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffE5E5E5)),
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFAFAFA)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Container(

                                child: SvgPicture.asset(
                                    'assets/images/leaderboard.svg',
                                    semanticsLabel: 'leaderboard'
                                ),
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1A1A1A),
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Top the leaderboard and get a free : '),
                                TextSpan(text: 'XXXX’s \n', style: const TextStyle( fontWeight: FontWeight.w600,)),
                                TextSpan(text: 'Barbell bar + 50 KG in weight plates!', style: const TextStyle( fontWeight: FontWeight.w600,)),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4 ,
                      child: ListView(
                        children: [
                          LeaderboardItem(name: 'John Doe', level: 12, ratio: 85, itemNum: 1, hours: 9, category: 'education',),
                          LeaderboardItem(name: 'John Doe', level: 12, ratio: 85, itemNum: 2, hours: 9, category: 'education',),
                          LeaderboardItem(name: 'John Doe', level: 12, ratio: 85, itemNum: 3, hours: 9, category: 'education',),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              Image.asset('assets/images/ads.png')
            ],
          ),
        ));
  }
}

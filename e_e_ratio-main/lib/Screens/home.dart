
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_e_ratio/Components/gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Components/gradient_switch.dart';
import '../Components/timeline_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  bool _switchValue=true;
  final user =FirebaseAuth.instance.currentUser;
  List<String> docIDs = [];
  Future getData() async{
   await FirebaseFirestore.instance
        .collection('activities')
        .where("email", isEqualTo: user!.email)
        .snapshots()
        .listen((data) =>
        data.docs.forEach((doc) => {
          print(doc["name"]),
          docIDs.add(doc.reference.id)
        }
        ));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
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
          TextSpan(text: 'Weekly Level'),
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
                      TextSpan(text: 'All-Time Level'),
                      TextSpan(text: '39', style: const TextStyle(fontSize: 26.0,fontWeight: FontWeight.w700,color: Color(0xffE547E3))),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 21,),
            Container(
              height: 54,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffE5E5E5)
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
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              colors: index == 0 ? [Color(0xffFFCC33), Color(0xffE233FF)] : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp
                          ),
                        ),
                        child: Center(child: Text('1 Day',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color:  index == 0 ? Color(0xffffffff) : Color(0xff1A1A1A)),)),
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
                        width: 89,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              colors: index == 1 ? [Color(0xffFFCC33), Color(0xffE233FF)] : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp
                          ),
                        ),
                        child: Center(child: Text('7 Days',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12,color:  index == 1 ? Color(0xffffffff) : Color(0xff1A1A1A)),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState((){
                          index = 2;
                        });
                      },
                      child: Container(
                        height: 42,
                        width: 89,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              colors: index == 2 ? [Color(0xffFFCC33), Color(0xffE233FF)] : [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp
                          ),
                        ),
                        child: Center(child: Text('30 Days',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12,color:  index == 2 ? Color(0xffffffff) : Color(0xff1A1A1A)),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff7CEAAB),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'E'),
                    TextSpan(text: ':', style: const TextStyle(color:Color(0xff1A1A1A))),
                    TextSpan(text: 'E', style: const TextStyle(color:Color(0xffff7070))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Education: \nEntertainment',
                  style: const TextStyle(fontSize: 15,  fontWeight: FontWeight.w700,),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),
                Center(
                  child:  CustomSwitch(
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
                Text('Instant/Delayed\nGratification', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Color(0xff1A1A1A).withOpacity(0.5)),textAlign: TextAlign.center,)
              ],
            ),
            SizedBox(height: 31,),
            CircularPercentIndicator(
              radius: 120.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 35.0,
              percent: 0.8,
              center: Container(
                width: 134,
                height: 134,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60)
                ),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Color(0xff1A1A1A),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '85',style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 33)),
                          TextSpan(text: '%', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                          TextSpan(text: '\nThere’s a way\nto go', style:  TextStyle(color:Color(0xff444444).withOpacity(0.8),fontWeight: FontWeight.w500, fontSize: 8)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Color(0xffFF3939).withOpacity(0.3),
              progressColor:  Color(0xff7CEAAB),
            ),
            SizedBox(height: 31,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: Image(
                            image: AssetImage(
                                'assets/images/book.png'
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(child: Text('Education', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: Image(
                            image: AssetImage(
                                'assets/images/music.png'
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(child: Text('Entertainment', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 35,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Your Activity', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)),
            SizedBox(
              height: 35,
            ),
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
            // StreamBuilder<QuerySnapshot>(
            //   stream: FirebaseFirestore.instance.collection('activities').snapshots(),
            //   builder: (context, dataSnapshot){
            //     return !dataSnapshot.hasData ? SliverToBoxAdapter(child: Center(
            //       child: CircularProgressIndicator(),
            //     ),) : ListView.builder(itemBuilder: (context, index){
            //
            //       print(dataSnapshot.data?.docs);
            //       return CustomTimeLineTile(title: 'Read a Book', subTitle: 'Education', time: '1 hr', isFirst: true);
            //     });
            //   },
            // ),
            SizedBox(
              height: 200,
              child: Expanded(
                  child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot){
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index){
                      return CustomTimeLineTile(docId: docIDs[index], isFirst: index == 0 ? true : false, isLast: index == docIDs.length - 1 ? true : false);
                    });
              },)),
            ),

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
            GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .pushReplacementNamed('/addActivity');
              },
              child: Ink(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

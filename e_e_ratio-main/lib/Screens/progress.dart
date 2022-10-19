import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../Components/gradient_switch.dart';
import '../Components/gradient_text.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({Key? key}) : super(key: key);

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  int index = 0;
  bool _switchValue=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
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
          SizedBox(height: 35,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Your Progress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)),
          SizedBox(height: 19,),
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
          SizedBox(height: 19,),
          Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE5E5E5),width: 2),
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Column(
                    children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff7CEAAB)
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Entertainment', )
                                ],
                              ),
                              SizedBox(width: 15,),
                              Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffFF3939)
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Entertainment', )
                                ],
                              ),
                            ],
                          ),
                        ),

                      SfCartesianChart(
                        // Initialize category axis
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of y-axis
                              axisLine: AxisLine(width: 0),
                              minimum: 0,
                              maximum: 11,
                              interval: 1,
                              labelStyle: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 10,
                          )),
                          primaryYAxis: NumericAxis(
                            //Hide the gridlines of x-axis
                              majorGridLines: MajorGridLines(width: 0),
                              //Hide the axis line of x-axis
                              axisLine: AxisLine(width: 0),
                              minimum: 0, maximum: 100, interval: 20,
                          labelFormat: '{value}%',
                          labelStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 10,
                          )),

                          series: <ChartSeries>[

                            SplineSeries<ProgressData, String>(
                              color: Color(0xffBDBDBD),
                              markerSettings: MarkerSettings(
                              isVisible: true,
                              shape: DataMarkerType.circle,
                              color:  Color(0xffFF3939)
                              ),
                              // Bind data source
                                dataSource:  <ProgressData>[
                                  ProgressData('Jan', 50, 'Edu'),
                                  ProgressData('Feb', 25, 'Edu'),
                                  ProgressData('Mar', 90, 'Edu'),
                                  ProgressData('Apr', 0, 'Edu'),
                                  ProgressData('May', 95, 'Edu'),
                                  ProgressData('Jun', 10, 'Edu'),
                                  ProgressData('Jul', 55, 'Edu'),
                                  ProgressData('Aug', 30, 'Edu'),
                                  ProgressData('Sep', 70, 'Edu'),
                                  ProgressData('Oct', 40, 'Edu'),
                                  ProgressData('Nov', 30, 'Edu'),
                                  ProgressData('Dec', 20, 'Edu'),
                                ],
                                xValueMapper: (ProgressData progress, _) => progress.month,
                                yValueMapper: (ProgressData progress, _) => progress.percent
                            )
                          ]
                      ),
                    ],
                  )
              )
          )
        ],
      ),
    ));
  }
}
class ProgressData {
  ProgressData(this.month, this.percent,  this.cat);
  final String month;
  final String cat;
  final double percent;
}
import 'package:flutter/material.dart';

import '../Components/gradient_switch.dart';
import '../Components/gradient_text.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({Key? key}) : super(key: key);

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  int index = 0;
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add Activity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff1A1A1A)),
                )),
            SizedBox(height: 18,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Activities',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Color(0xff1A1A1A)),
                )),
            SizedBox(
              height: 23,
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
              height: 42,
            ),
            ListTile(
              onTap: (){
                Navigator.of(context)
                    .pushReplacementNamed('/addSingleActivity');
              },
              leading: Image.asset('assets/images/book1.png'),
              title: Text('Read a Book', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            ListTile(
              onTap: (){

              },
              leading: Image.asset('assets/images/coding.png'),
              title: Text('Practice Coding', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            ListTile(
              onTap: (){

              },
              leading: Image.asset('assets/images/ecommerce.png'),
              title: Text('Work on Ecommerce Website', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            ListTile(
              onTap: (){

              },
              leading: Image.asset('assets/images/game.png'),
              title: Text('Play Video Games', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            ListTile(
              onTap: (){

              },
              leading: Image.asset('assets/images/watch.png'),
              title: Text('Watch TV', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            ListTile(
              onTap: (){

              },
              leading: Image.asset('assets/images/study.png'),
              title: Text('Study Chinese', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1,),
            ),
            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.info_outline, color: Color(0xff1A1A1A).withOpacity(0.3),),
                ),
                Text('Is a listed activity categorized wrongfully ?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),textAlign: TextAlign.center)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('OR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xffF9AD5B)),textAlign: TextAlign.center),
            ),
            Text('Your activity is not listed?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
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
                  'Edit or add an activity in settings',
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
      ),
    );
  }
}

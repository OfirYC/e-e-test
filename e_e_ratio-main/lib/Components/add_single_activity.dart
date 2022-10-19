import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_e_ratio/Components/gradient_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddSingleActivity extends StatefulWidget {
  const AddSingleActivity({Key? key}) : super(key: key);

  @override
  State<AddSingleActivity> createState() => _AddSingleActivityState();
}

class _AddSingleActivityState extends State<AddSingleActivity> {
  final user =FirebaseAuth.instance.currentUser;
  final name = TextEditingController();
  final type = TextEditingController();
  final icon = TextEditingController();
  final time = TextEditingController();
  Future addActivity() async {
    try{
      await FirebaseFirestore.instance.collection('activities').add({
        'name': name.text,
        'type': type.text,
        'email': user!.email,
        'icon': icon.text,
        'time': time.text,
      });
      await EasyLoading.showSuccess(
          "Activity Added Sucessfullly");
      Navigator.of(context).pushReplacementNamed('/home');
    }
    catch (e){

    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .pushReplacementNamed('/addActivity');
                  },
                    child: Icon(Icons.arrow_back_ios)),
                SizedBox(width: 100,),
                GradientText(
                  'Add Activity',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 50),
            GradientText(
              'Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              gradient: LinearGradient(colors: [
                Color(0xffFFCC33),
                Color(0xffE233FF),
              ]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54,),
                    borderRadius: BorderRadius.circular(12)),
                child:  Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: ''),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GradientText(
              'Icon',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              gradient: LinearGradient(colors: [
                Color(0xffFFCC33),
                Color(0xffE233FF),
              ]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)),
                child:  Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: icon,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: ''),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GradientText(
              'Type',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              gradient: LinearGradient(colors: [
                Color(0xffFFCC33),
                Color(0xffE233FF),
              ]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)),
                child:  Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: type,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: ''),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GradientText(
              'Time',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              gradient: LinearGradient(colors: [
                Color(0xffFFCC33),
                Color(0xffE233FF),
              ]),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)),
                child:  Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: time,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: ''),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: (){
                addActivity();
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

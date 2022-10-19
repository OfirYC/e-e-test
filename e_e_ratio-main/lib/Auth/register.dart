import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/app_colors.dart';
import '../Components/gradient_text.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  Future signUp() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
      await FirebaseFirestore.instance.collection('users').add({
        'email': email.text,
        'fullName': fullName.text
      });
      await EasyLoading.showSuccess(
          "Signup Succeeded");
      Navigator.of(context).pushReplacementNamed('/home_page');
    } on FirebaseAuthException catch(e){
      _handleSignupError(e);
    }

  }
  void _handleSignupError(FirebaseAuthException e) async{
    String message;
    switch (e.code){
      case 'email-already-in-use':
        message = 'This email is already in use';
        break;
      case 'invalid-email':
        message = 'This email is invalid';
        break;
      case 'operation-not-allowed':
        message = 'This operation is not allowed';
        break;
      case 'weak-password':
        message = 'This password is weak, try another password';
        break;
      default:
      message = 'An unknown error occured';
      break;
    }
    await EasyLoading.showError(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Lottie.network(
                        'https://assets10.lottiefiles.com/private_files/lf30_iraugwwv.json')),
                const SizedBox(height: 10),
                GradientText(
                  'Register Now!',
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),

                const SizedBox(height: 10),

                GradientText(
                  'Start with your free account today!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: textFieldColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child:  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: email,
                        cursorColor: btnColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: textFieldColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child:  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: password,
                        cursorColor: btnColor,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: textFieldColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(12)),
                    child:  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: fullName,
                        cursorColor: btnColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Full Name'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: ()=>  signUp(),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
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
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GradientText(
                      'Already have an account?',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      gradient: LinearGradient(colors: [
                        Color(0xffFFCC33),
                        Color(0xffE233FF),
                      ]),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child: GradientText(
                          ' SignIn Now',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          gradient: LinearGradient(colors: [

                            Color(0xffE233FF),
                            Color(0xffE233FF),
                          ]),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

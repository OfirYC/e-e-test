import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/app_colors.dart';
import '../Components/gradient_text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future signIn() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
      await EasyLoading.showSuccess(
          "Signin Succeeded");
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch(e){
      _handleSigninError(e);
    }
  }
  void _handleSigninError(FirebaseAuthException e) async{
    String message;
    switch (e.code){
      case 'invalid-email':
        message = 'This email is invalid';
        break;
      case 'user-disabled':
        message = 'This user account is disabled';
        break;
      case 'user-not-found':
        message = 'Account not found';
        break;
      case 'wrong-password':
        message = 'Wrong password';
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
                  'Hello Again!',
                  style: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xffFFCC33),
                    Color(0xffE233FF),
                  ]),
                ),
                const SizedBox(height: 10),
                // const Text(
                //   'Welcome back, you\'ve been missed!',
                //   style: TextStyle(fontSize: 20),
                //   textAlign: TextAlign.center,
                // ),
                GradientText(
                  'Welcome back, you\'ve been missed!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
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
                GestureDetector(
                  onTap: ()=> signIn(),
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
                          'Sign In',
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
                // Padding(

                const SizedBox(height: 15),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child:  Padding(
                //     padding: const EdgeInsets.only(right: 30),
                //     child: GestureDetector(
                //         onTap: () {
                //           Navigator.of(context).pushReplacementNamed('/forgot_password');
                //         },
                //         child: const Text(
                //           'Forgot Password?',
                //           style: TextStyle(
                //               color: forgotPassword, fontWeight: FontWeight.bold),
                //           textAlign: TextAlign.center,
                //         )),
                //   ),
                // ),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'Not a member?',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: LinearGradient(colors: [
                        Color(0xffFFCC33),
                        Color(0xffE233FF),
                      ]),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/register');
                        },
                        child:    GradientText(
                          ' Register Now',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          gradient: LinearGradient(colors: [
                            // Color(0xffFFCC33),
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

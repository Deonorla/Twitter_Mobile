import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/constants/ui_constants.dart';
import 'package:twitter_mobile_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_mobile_clone/common/rounded_small_button.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:twitter_mobile_clone/features/auth/view/signup_view.dart';

class LoginView extends StatefulWidget{
  const LoginView ({Key ? key}) : super(key : key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
   final appbar = UiConstants.appbar();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   @override
   void dispose(){
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
   }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20 ),
            child: Column(
              children: [
                //  textField 1
                AuthField(controller: emailController, inputText: "Email Address",),
                const SizedBox(height: 40),
                //  textField 2
                AuthField(controller: passwordController, inputText: "Password"),
                const SizedBox(height: 40),
                //  button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: () =>{},
                    label: 'Done',
                    backgroundColor: Styles.whiteColor ,
                    textColor:  Styles.backgroundColor
                  ),
                ),
                const SizedBox(height: 40),
                //  textSpan
                RichText(
                  text: TextSpan(
                     text: "Don't have an account?",
                      style: const TextStyle(
                          fontSize: 16
                      ),
                         children:[
                           TextSpan(
                             text: " Sign Up",
                             style: const TextStyle(
                               color: Styles.blueColor,
                                 fontSize: 16
                             ),
                             recognizer: TapGestureRecognizer()..onTap = () =>{
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()))
                             }

                  )]
                  ),)
              ],
            ),
          ),
        ),
      )
    );
  }
}





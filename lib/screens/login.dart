// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_share_admin/config/styles.dart';
import 'package:skill_share_admin/screens/homescreen.dart';
import 'package:skill_share_admin/widgets/button.dart';
import 'package:skill_share_admin/widgets/textbox.dart';






class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcotroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign in",
                  style: Styles.title(context),
                ),
              ),
              Text(
                "Welcome back.Please sign in to",
                style: Styles.subtitlegrey(context),
              ),
              Text(
                "continue",
                style: Styles.subtitlegrey(context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Textbox(
                hideText: false,
                tcontroller: emailcotroller,
                type: TextInputType.emailAddress,
                hinttext: 'Email',
                icon: Icon(Icons.email,color:Theme.of(context). colorScheme.onPrimary,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              Textbox(
                hideText: true,
                tcontroller: passwordcotroller,
                type: TextInputType.visiblePassword,
                hinttext: 'Password',
                icon:Icon(Icons.lock,color:Theme.of(context). colorScheme.onPrimary,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
               SizedBox(height: MediaQuery.of(context).size.height * 0.013),
             
             
              CustomLoginButton(
                  text: "Sign in",
                  onPress: () async{
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email:  emailcotroller.text.trim(), password:  passwordcotroller.text.trim());
                    Navigator.pushReplacement(
             
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>const HomeScreen(),
                      ),
                    );
                  }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            ],
          ),
        ),
      ),
    );
  }
}

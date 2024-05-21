// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_share_admin/config/styles.dart';
import 'package:skill_share_admin/screens/login.dart';
import 'package:skill_share_admin/screens/mentees.dart';
import 'package:skill_share_admin/screens/mentors.dart';
import 'package:skill_share_admin/screens/requests.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),
      actions:  [
        IconButton(onPressed: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.popUntil(context, (route) => route.isFirst);
           Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ),
                      );
        }, icon: const Icon(Icons.logout,color: Colors.black,))
      ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  17.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                       onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Mentorss(),
                        ),
                      );
                    },
                    leading: Image.asset("assets/graduation.png"),
                    title: Text("Mentors",style: Styles.subtitle(context),),
                   
                  ),
                ),
              ),
               
           
                SizedBox(height: MediaQuery.of(context).size.height * 0.013),
               Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                       onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Mentees(),
                        ),
                      );
                    },
                    leading: Image.asset("assets/graduation.png"),
                    title: Text("Mentees",style: Styles.subtitle(context),),
                   
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
                Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                  onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Requests(),
                        ),
                      );
                    },
                    leading: Image.asset("assets/email.png"),
                    title: Text("Requests",style: Styles.subtitle(context),
                    ),
                      
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
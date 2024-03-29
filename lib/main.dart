import 'package:brewfitx/view/login/what_your_goal_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Import Firebase core package
import 'package:flutter/material.dart';
import 'package:brewfitx/view/login/complete_profile_view.dart';
import 'package:brewfitx/view/login/login_view.dart';
import 'package:brewfitx/view/login/signup_view.dart';
import 'package:brewfitx/view/main_tab/main_tab_view.dart';
import 'package:brewfitx/view/on_boarding/started_view.dart';
import 'package:brewfitx/common/colo_extension.dart';

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrewFitX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: TColor.primaryColor1,
          fontFamily: "Poppins"),
      home: const LoginView(),
    );
  }
}

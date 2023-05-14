import 'package:flutter/material.dart';
import 'package:g_project/classification_screen.dart';
import 'package:g_project/prediction_screen.dart';
import 'package:g_project/registerScreen.dart';
import 'package:g_project/search_screen.dart';
import 'package:g_project/splash_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'Prediction_Screen1.dart';
import 'dashboard.dart';
import 'doctor_profile.dart';
import 'doctor_screen.dart';
import 'f_Page.dart';
import 'c_Full_result.dart';
import 'onboarder.dart';
import 'p_fullResult.dart';
import 'home_screen.dart';

//import 'homePage.dart';
import 'login+_screen.dart';
import 'onboarding_screen.dart';
import 'p_Record.dart';
import 'profileScreen.dart';

late SharedPreferences shared;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shared = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:splashScreen());
  }
}

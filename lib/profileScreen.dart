import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_project/profileMenuWidget.dart';
import 'package:g_project/updateProfileScreen.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key, this.isAppar=false})
      : super(key: key);
  final bool isAppar;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: isAppar ? AppBar(
        backgroundColor: Colors.purple[300],
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text('Profile', style: Theme
            .of(context)
            .textTheme
            .headline4),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ) : null,
      body:FutureBuilder(
        future:getProfileInfo(shared.getString("token")??''),
        builder:(context,snapshot){
          if(snapshot.hasData){
            Map profileData= snapshot.data as Map;
            return  SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [

                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: const Image(
                                  image: AssetImage('assets/images/doctor2.jpg'))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.purple[300]),
                            child: const Icon(
                              LineAwesomeIcons.alternate_pencil,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(profileData['name'], style: Theme
                        .of(context)
                        .textTheme
                        .headline4),
                    Text('asmaa@gmail.com', style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                    const SizedBox(height: 10),

                    /// -- BUTTON
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateProfileScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[300],
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                            'UpdateProfile', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    /// -- MENU
                    ProfileMenuWidget(
                        title: "Settings",
                        icon: LineAwesomeIcons.cog,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: " patients",
                        icon: LineAwesomeIcons.wallet,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "User Management",
                        icon: LineAwesomeIcons.user_check,
                        onPress: () {}),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "Information",
                        icon: LineAwesomeIcons.info,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Logout",
                        icon: LineAwesomeIcons.alternate_sign_out,
                        textColor: Colors.black,
                        endIcon: false,
                        onPress: () {
                          Get.defaultDialog(
                            title: "LOGOUT",
                            titleStyle: const TextStyle(fontSize: 20),
                            content: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text("Are you sure, you want to Logout?"),
                            ),
                            confirm: Expanded(
                              child: ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    side: BorderSide.none),
                                child: const Text("Yes"),
                              ),
                            ),
                            cancel: OutlinedButton(
                                onPressed: () => Get.back(), child: const Text("No")),
                          );
                        }),
                  ],
                ),
              ),
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );

  }
  Future<Map<String, dynamic>> getProfileInfo(String token) async {
    final url = 'http://ec2-16-16-128-143.eu-north-1.compute.amazonaws.com/auth/users/me/';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {

      Map<String, dynamic> profileInfo = json.decode(response.body);
      return profileInfo;
    } else {

      throw Exception('Failed to load profile information');
    }
  }

}


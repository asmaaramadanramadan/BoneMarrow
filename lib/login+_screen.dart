import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:g_project/widget/fields.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:day12_login/Animation/FadeAnimation.dart';
import 'Animation/FadeAnimation.dart';

import 'package:g_project/registerScreen.dart';
import 'home_screen.dart';
import 'main.dart';
import 'nav_drawer.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  String bText = "Sign Up";
  bool lSwitch = false;
  String? Email;

  var password;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();
  var _namecontroller = TextEditingController();
  var passwordcontroler = TextEditingController();

  //var phonecontroller = TextEditingController();
  //var emailcontroler = TextEditingController();

  bool passvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background1.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Welcome Doctor",
                          style: TextStyle(
                              color: Colors.purple.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        lSwitch ? const DoctorRegist() : signIn(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don\'t  have an account ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorRegist()),
                                  );
                                  setState(() {
                                    // lSwitch = !lSwitch;
                                  });
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.purple.shade200),
                                ),
                              ),
                            ]),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Image.asset("assets/images/google.png"),
                        //     const SizedBox(
                        //       width: 20,
                        //     ),
                        //     Image.asset("assets/images/facebook.png"),
                        //   ],
                        // )
                      ],
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

  Form signIn() {
    return Form(
      key: _key1,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            defultTextFied(
              hint: "Enter your username",
              label: "UserName",
              type: TextInputType.emailAddress,
              pIcon: const Icon(Icons.perm_identity_outlined),
              onSave: () => (String? val) {
                setState(() {
                  // Email = _namecontroller.text;
                });
              },
              validate: () => (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: false,
              mycontroler: _namecontroller,
            ),
            const SizedBox(
              height: 15,
            ),
            defultTextFied(
              hint: "Enter Password",
              label: "Password",
              type: TextInputType.visiblePassword,
              pIcon: Icon(Icons.lock, color: Colors.purple.shade100),
              sIcon: IconButton(
                icon: Icon(
                  passvisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    passvisible = !passvisible;
                  });
                },
              ),
              onSave: () => (String? val) {
                setState(() {
                  //  password = passwordcontroler.text;
                });
              },
              validate: () => (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: passvisible,
              mycontroler: passwordcontroler,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(color: Colors.purple),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
                minWidth: 30.0,
                color: Colors.purple.shade300,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade300),
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: (){
                  Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => HomePage()));

                },
                // onPressed: () {
                //   postlogin(_namecontroller.text, passwordcontroler.text)
                //       .then((value)  {
                //     shared.setString("token", value['token']);
                //     Navigator.pushReplacement(
                //         context, MaterialPageRoute(builder: (_) => HomePage()));
                //   });
                // },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future postlogin(String username, String password) async {
    var url = Uri.parse(
        'http://ec2-16-16-128-143.eu-north-1.compute.amazonaws.com/auth/jwt/create/');
    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
      //asmam
    }
  }
}

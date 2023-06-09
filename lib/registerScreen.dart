import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';
import 'login+_screen.dart';

class DoctorRegist extends StatefulWidget {
  const DoctorRegist({Key? key}) : super(key: key);

  @override
  State<DoctorRegist> createState() => _DoctorRegistState();
}

class _DoctorRegistState extends State<DoctorRegist> {

  String bText = "Sign Up";
  bool lSwitch = true;
  GlobalKey<FormState>_key = GlobalKey<FormState>();
  final _key1 = GlobalKey<FormState>();
  var _namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();
  var comfirmPasscontroler = TextEditingController();
  bool passvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.purple,
                Colors.white
              ],
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rimage.png'),
                        fit: BoxFit.fill)),

              ),
              Text(
                "Hello!", style: TextStyle(color: Colors.white, fontSize: 25),),
              SizedBox(height: 10,), Register(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Have an account ?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Login_Screen()));
                    setState(() {
                      lSwitch = !lSwitch;
                    });
                  },
                  child: Text("Login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Form Register() {
    return Form(
      key: _key,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [

            defultTextFied(
              hint: "enter your name",
              type: TextInputType.text,
              pIcon: Icon(Icons.person),
              onSave: () =>
                  (String? val) {
                setState(() {});
              },
              validate: () =>
                  (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: false,
              mycontroler: _namecontroller,
            ),
            SizedBox(
              height: 10,
            ),
            defultTextFied(
              hint: "enter your Email",
              // label: "Email",
              type: TextInputType.emailAddress,
              pIcon: Icon(Icons.email),
              onSave: () =>
                  (String? val) {
                setState(() {});
              },
              validate: () =>
                  (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: false,
              mycontroler: emailcontroler,
            ),
            SizedBox(height: 8.0,),
            defultTextFied(
              hint: "Enter Password",
              //  label: "Password",
              type: TextInputType.text,
              pIcon: Icon(Icons.lock),
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
              onSave: () =>
                  (String? val) {
                setState(() {});
              },
              validate: () =>
                  (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: false,
              mycontroler: passwordcontroler,
            ),
            SizedBox(height: 8.0,),
            defultTextFied(
              hint: "Comfirm password",
              label: "Comfirm password",
              type: TextInputType.text,
              pIcon: Icon(Icons.lock),
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
              onSave: () =>
                  (String? val) {
                setState(() {});
              },
              validate: () =>
                  (String? val) {
                if (val!.isEmpty) {
                  return "this field can't be empty";
                }
              },
              vall: false,
              mycontroler: comfirmPasscontroler,
            ),
            SizedBox(height: 8.0,),
            MaterialButton(
                minWidth: 30.0,
                color: Colors.purple.shade300,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple.shade300),
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: () {
                  if(_key.currentState!.validate()){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => HomePage()));}
                },

                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Register ",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }

}



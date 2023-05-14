import 'dart:io';

import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';
import 'package:file_picker/file_picker.dart';

import 'p_fullResult.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  var namecontroler = TextEditingController();
  var phonecontroler = TextEditingController();
  var gendercontroler = TextEditingController();
  var agecontroler = TextEditingController();
  var addresscontroler = TextEditingController();

  String? gender;
  String? _radioVal;
  PlatformFile? file;

  void loadP_File() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        file = result.files.first;
      });

      // File file = File(result.files.single.path);
      print(file?.name);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon: Icon(Icons.arrow_back,),onPressed: (){},),
        backgroundColor: Colors.purple.shade200,
        title: const Text(
          "Hello! Doctor",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Text("Check"),
                onPressed: (){},
              ),
              const SizedBox(
                height: 15,
              ),
              defultTextFied(
                hint: "Enter Patient name",
                label: " Name",
                type: TextInputType.text,
                pIcon: const Icon(Icons.person),
                onSave: () => (String? val) {
                  setState(() {});
                },
                validate: () => (String? val) {
                  if (val!.isEmpty) {
                    return "this field can't be empty";
                  }
                },
                vall: false,
                mycontroler: namecontroler,
              ),
              const SizedBox(
                height: 10,
              ),

              defultTextFied(
                hint: "Patient phone",
                label: "Phone",
                type: TextInputType.number,
                pIcon: Icon(Icons.phone_android),
                onSave: () => (String? val) {
                  setState(() {});
                },
                validate: () => (String? val) {
                  if (val!.isEmpty) {
                    return "this field can't be empty";
                  }
                },
                vall: false,
                mycontroler:  phonecontroler,
              ),
              SizedBox(
                height: 10,
              ),
              defultTextFied(
                hint: "Patient Age",
                label: "Age",
                type: TextInputType.number,
                pIcon: const Icon(Icons.edit),
                onSave: () => (String? val) {
                  setState(() {});
                },
                validate: () => (String? val) {
                  if (val!.isEmpty) {
                    return "this field can't be empty";
                  }
                },
                vall: false,
                mycontroler: agecontroler,
              ),
              const SizedBox(
                height: 10,
              ),

              defultTextFied(
                hint: "Patient Address",
                label: "Address",
                type: TextInputType.number,
                pIcon: Icon(Icons.home_outlined),
                onSave: () => (String? val) {
                  setState(() {});
                },
                validate: () {},
                vall: false,
                mycontroler: addresscontroler,
              ),
              Row(
                children: [
                  const Text(
                    "Gender ?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Expanded(
                    child: RadioListTile(
                      title: const Text("Male"),
                      value: "male",
                      groupValue: gender,
                      activeColor: Colors.purple,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Female"),
                      value: "female",
                      groupValue: gender,
                      activeColor: Colors.purple,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              file != null
                  ? Row(
                      children: [
                        Text(file!.name.toString() ?? ''),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                file = null;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ))
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  loadP_File();
                },
                child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.purple,
                    child: const Center(
                        child: Text(
                      "load files",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                  minWidth: 30.0,
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple.shade300),
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                       return FullResult(
            result: "Nigative",
            PName: "${namecontroler.text}",
            age: agecontroler.text,
            Gender: gendercontroler.text,
          );

                    }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Start processing",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

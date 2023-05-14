//import 'dart:html';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'c_Full_result.dart';
import 'p_fullResult.dart';
import 'nav_drawer.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  State<Classification> createState() => _ClassificationState();
}

//final ImagePicker _picker = ImagePicker();

class _ClassificationState extends State<Classification> {
  var namecontroler = TextEditingController();
  var phonecontroler = TextEditingController();
  var gendercontroler = TextEditingController();
  var agecontroler = TextEditingController();
  var addresscontroler = TextEditingController();

  var gender;
  String? _radioVal;

  final ImagePicker _picker = ImagePicker();
  File? pickedImage;

  fitchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(
        image.path,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text(
          "Hello! Doctor",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: defultTextFied(
                     // hint: "Enter National ID",
                      label: " NID",
                      type: TextInputType.number,
                      pIcon: Icon(Icons.edit),
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
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // TextButton(
                  //   child: Text("Check"),
                  //   onPressed: (){},
                  // )
                  FloatingActionButton.small(
                    onPressed: () {},
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.check),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              defultTextFied(
               // hint: "Enter Patient name",
                label: " Name",
                type: TextInputType.text,
                pIcon: Icon(Icons.person),
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
              SizedBox(
                height: 15,
              ),
              defultTextFied(
               // hint: "Patient Age",
                label: "Age",
                type: TextInputType.number,
                pIcon: Icon(Icons.edit),
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
              SizedBox(
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
                mycontroler: phonecontroler,
              ),
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Gender ?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text("Male"),
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
                      title: Text("Female"),
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
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  minWidth: 30.0,
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: fitchImage,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Center(
                    child: pickedImage == null
                        ? CircularProgressIndicator(
                            color: Colors.purple.shade200,
                          )
                        : Image.file(
                            pickedImage!,
                            width: 400,
                            height: 400,
                          )),
                decoration: BoxDecoration(
                    //color: Colors.yellow[100],
                    border: Border.all(
                  color: Colors.purple.shade100,
                  width: 3,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                  minWidth: 30.0,
                  color: Colors.purple.shade300,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple.shade300),
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: myDialog,
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

  myDialog() {
    Widget saveButton = TextButton(
      child: Text(
        "Save",
        style: TextStyle(color: Colors.purple),
      ),
      onPressed: () {},
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: TextStyle(color: Colors.purple)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget datailsButton = TextButton(
      child: Text("Show in details", style: TextStyle(color: Colors.purple)),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          /* return FullResult(
            result: "Nigative",
            PName: "${namecontroler.text}",
            image: pickedImage,
            id: idcontroler.text,
            age: agecontroler.text,
            Gender: gendercontroler.text,
          );*/
          return C_FullResult();
        }));
      },
    );
    var ad = AlertDialog(
      title: Center(child: Text("Result")),
      content: Text("Status:"),
      actions: [
        saveButton,
        cancelButton,
        datailsButton,
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ad;
        });
  }

  Future updateProfileWithImage(Map<String, String> data, String file) async {
    var request = MultipartRequest('POST',
        Uri.parse("http://radwa34.pythonanywhere.com/doctor/api/patients/"));

    request.fields.addAll(data);
    request.headers['Authorization'] = "";
    //  request.files.add(http.MultipartFile.fromBytes('file', File(file.path).readAsBytesSync(),filename: file.path));
    //  var res = await request.send();

    var picture = MultipartFile.fromBytes(
        'medicalphoto', File(file).readAsBytesSync(),
        filename: file);

    request.files.add(picture);
    var response = await request.send();
    var responsseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responsseData);

    print(result);
    // print(res.headers);
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';

import 'p_fullResult.dart';
//import 'package:managment/data/model/add_date.dart';
//import 'package:hive_flutter/hive_flutter.dart';

class Prediction_Screen extends StatefulWidget {
  //const Prediction_Screen({super.key});

  @override
  State<Prediction_Screen> createState() => _Prediction_ScreenState();
}

class _Prediction_ScreenState extends State<Prediction_Screen> {
  //final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now();
 // String? selctedItem;
  String? selctedItemi;

  var namecontroler = TextEditingController();
  var phonecontroler = TextEditingController();
  var gendercontroler = TextEditingController();
  var agecontroler = TextEditingController();
  var addresscontroler = TextEditingController();
  var n_idcontroler = TextEditingController();

  final List<String> _itemei = [
    'Male',
    "Femal",
  ];
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      height: 600,
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 30),
          name(),
          const SizedBox(height: 10),
          Age(),
          const SizedBox(height: 10),
          n_id(),
          const SizedBox(height: 10),
          phone(),
          const SizedBox(height: 10),
          gender(),
          const SizedBox(height: 10),
          address(),
          const SizedBox(height: 10),
          // load(),



          InkWell(
            onTap: () {
              loadP_File();
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: m_color!,
                ),
                height: 40,
                width: 100,

                child: const Center(
                    child: Text(
                      "upload files",
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
          const SizedBox(height: 20),
          //Spacer(),
          StartProcess(),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
  GestureDetector StartProcess() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return FullResult(
            result: "Nigative",
            PName: "adjdf",
            age: 22,
            Gender: "$selctedItemi",
          );

        }));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple[300],
        ),
        width: 130,
        height: 40,
        child: const Text(
          'Start Process',
          style: TextStyle(
            //fontFamily: 'f',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: namecontroler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Name',
          labelStyle: TextStyle(fontSize: 20, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983))),
        ),
          keyboardType: TextInputType.text,
      ),
    );
  }
  Padding Age() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: agecontroler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Age',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983))),
        ),
        keyboardType: TextInputType.number,
        validator:  (String? val) {
          if (val!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
  Padding n_id() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: n_idcontroler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'National ID',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
        keyboardType: TextInputType.number,
        validator:  (String? val) {
          if (val!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
  Padding phone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller:phonecontroler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Phone',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983))),
        ),
        validator:  (String? val) {
          if (val!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
  Padding gender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItemi,
          onChanged: ((value) {
            setState(() {
              selctedItemi = value!;
            });
          }),
          items: _itemei
              .map((e) => DropdownMenuItem(
            value: e,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemei
              .map((e) => Row(
            children: [Text(e)],
          ))
              .toList(),
          hint: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Gender',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
  Padding address() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: addresscontroler,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'address',
          labelStyle: TextStyle(fontSize: 17,
              color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xff368983))),
        ),
        keyboardType: TextInputType.text,
        validator:  (String? val) {
          if (val!.isEmpty) {
            return "this field can't be empty";
          }
        },
      ),
    );
  }
  // Padding load() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: TextFormField(
  //       controller: addresscontroler,
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //         labelText: 'upload Filee',
  //         labelStyle: TextStyle(fontSize: 17,
  //             color: Colors.grey.shade500),
  //         enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(width: 2, color: Color(0xff368983))),
  //       ),
  //       keyboardType: TextInputType.text,
  //     ),
  //   );
  // }
  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'Patient Information',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

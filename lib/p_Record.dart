import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';

class PatientRecord extends StatefulWidget {
  const PatientRecord({Key? key}) : super(key: key);

  @override
  State<PatientRecord> createState() => _PatientRecordState();
}

class _PatientRecordState extends State<PatientRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text("Patient Record", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Container(
          height: 200.0,
          width: 400.0,
          child: Row(
            children: [
              Image.asset(
                "assets/images/doctor4.jpg",
                height: 160,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 160,
                width: 160,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Name :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Age    :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Gender :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Date     :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Phone :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Adreess :",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("About History Diseases",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(12),
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Process Type :"),
                      Text("Classification :"),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Result"),
                      Text("Positive"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Date"),
                      Text("12/2/2020"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            itemCount: 10,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("What Do You Want:"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(m_color!),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(1);
                      },
                      child: Text("Add Process"),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(m_color!),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(2);
                      },
                      child: Text("Delete Process"),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(m_color!),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(3);
                      },
                      child: Text("Update Process"),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(m_color!),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(3);
                      },
                      child: Text("Delete Record"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      // floatingActionButton:FloatingActionButton(
      //   onPressed: () =>FlatDesign(context),
      //   backgroundColor: Colors.purple,
      //   child: const Icon(Icons.add),
      // )
    );
  }

  // void FlatDesign(BuildContext context) async {
  //   await showMenu(
  //     context: context,
  //     position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
  //     items: [
  //       PopupMenuItem(
  //         child: Text("Button 1"),
  //         value: 1,
  //       ),
  //       PopupMenuItem(
  //         child: Text("Button 2"),
  //         value: 2,
  //       ),
  //       PopupMenuItem(
  //         child: Text("Button 3"),
  //         value: 3,
  //       ),
  //     ],
  //     elevation: 8.0,
  //   ).then((value) {
  //     switch (value) {
  //       case 1:
  //         print("Button 1 clicked");
  //         break;
  //       case 2:
  //         print("Button 2 clicked");
  //         break;
  //       case 3:
  //         print("Button 3 clicked");
  //         break;
  //     }
  //   });
  // }
}

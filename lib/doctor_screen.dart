import 'package:flutter/material.dart';

import 'nav_drawer.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple.shade100,
      child: Container(
       //   width: MediaQuery.of(context).size.width,
       //   height: MediaQuery.of(context).size.height / 2.1,
       // decoration: const BoxDecoration(
       //     image: DecorationImage(
       //         image: AssetImage("assets/images/doctor1.jpg"),
       //          fit: BoxFit.cover),
       //     borderRadius: BorderRadius.only(
       //   bottomLeft: Radius.circular(20),
       //       bottomRight: Radius.circular(20),
       //     )),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.6),
            Colors.blue.withOpacity(0),
            Colors.blue.withOpacity(0),
            Colors.transparent,
          ])),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/doctor1.jpg',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF2F8FF),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.purpleAccent,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: const Center(
                              child: Icon(
                                Icons.notification_add,
                                color: Colors.purpleAccent,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Patients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "234",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Classification",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "234",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Prediction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "234",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purpleAccent),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Dr:asmaa"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          ' search',
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

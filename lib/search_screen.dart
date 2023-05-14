import 'package:flutter/material.dart';
import 'package:g_project/widget/fields.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

import 'nav_drawer.dart';
import 'p_Record.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? searchValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: comm,
                    showCursor: true,
                   autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'search...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.purple, width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.purple, width: 1.2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.purple, width: 1.2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
              itemBuilder: (context, i) {
                return Card(
                  // color: Colors.blue,
                  elevation: 10,
                  child: ListTile(
                    title: Text("Patient Name"),
                    subtitle: Text("ID:"),
                    trailing: MaterialButton(
                        minWidth: 20.0,
                        color: Colors.purple.shade200,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PatientRecord()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "PRecord",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

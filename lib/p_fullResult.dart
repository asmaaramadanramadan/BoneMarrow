import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'p_Record.dart';
class FullResult extends StatefulWidget {
  final String PName;
  final String result;
   var Gender;
   var age;
   var image;
   FullResult({
     required this.PName,
     required this.result,
      this.image,
      this.Gender,
      this.age
}
);

  @override
  State<FullResult> createState() => _FullResultState();
}

class _FullResultState extends State<FullResult> {
   var id;
  bool SwitchColor = false;
   bool lSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Final Rasult of Process")),
        backgroundColor: Colors.purple.withOpacity(0.7),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFffffff),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Result : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                //SizedBox(height:10,),
                Text("Patient Name : ${widget.PName} "),
                //SizedBox(height: 3,),
                Text("Patient Age :${widget.age} "),
               // SizedBox(height: 3,),
                Text("Gender :${widget.Gender}"),
               // SizedBox(height: 3,),
                Text("phone :${widget.Gender}"),
               // SizedBox(height: 3,),
                Text("Address :${widget.Gender}"),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            //mainAxisAlignment:MainAxisAlignment.center ,
            //crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 200,
                    color:SwitchColor? Colors.purple.shade300:Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.purple.shade300),
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed:(){
                      setState(() {
                        SwitchColor =! SwitchColor;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
              ),
              SizedBox(width: 10,),
              Expanded(child: MaterialButton(
                  minWidth: 200.0,
                  color: SwitchColor? Colors.purple.shade300:Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple.shade300),
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed:(){
                    setState(() {
                      SwitchColor =! SwitchColor;
                    });
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>HomePage()

                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Don't save",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),),
              SizedBox(width: 10,),
              Expanded(child: MaterialButton(
                  minWidth: 200,
                  color:SwitchColor? Colors.purple.shade300:Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple.shade300),
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed:(){
                    setState(() {
                      SwitchColor =! SwitchColor;
                    });
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                       PatientRecord()
                      ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),)
          ],),
        ],
      ) ,
    );
  }
}

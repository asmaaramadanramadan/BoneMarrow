import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_project/profileScreen.dart';
import 'package:g_project/splash_Screen.dart';
import 'Prediction_Screen1.dart';
import 'classification_screen.dart';
import 'package:g_project/registerScreen.dart';
import 'f_Page.dart';
import 'login+_screen.dart';
import 'prediction_screen.dart';

class NavDrawer extends StatefulWidget {
  // const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildDrawerHeader(context),
          SingleChildScrollView(
            child: buildDrawerItems(context),
          )
        ],
      ),
    );
  }

  buildDrawerHeader(BuildContext context) {
    return Container(
      color: Colors.purple.shade200,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          CircleAvatar(
              radius: 52,
              backgroundImage:
                  AssetImage('assets/images/Bone_marrow_biopsy.jpg')
              //backgroundImage: NetworkImage("https://static.sciencelearn.org.nz/images/images/000/004/324/embed/Bone_marrow_biopsy.jpg?1674173795"),
              ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Bone_marrow",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "(Prediction & classification)",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 0.0,
        children: [
          ListTile(
            leading: Icon(
              Icons.screen_lock_landscape_rounded,
              size: _drawerIconSize,
              color: Colors.purple.shade200,
            ),
            title: Text(
              'Classification',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Classification()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.screen_lock_landscape_rounded,
              size: _drawerIconSize,
              color: Colors.purple.shade200,
            ),
            title: Text(
              'Prediction',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Prediction_Screen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.screen_lock_landscape_rounded,
              size: _drawerIconSize,
              color: Colors.purple.shade200,
            ),
            title: Text(
              'Search for Patient',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => splashScreen()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.login_rounded,
          //       size: _drawerIconSize, color:Colors.purple.shade200),
          //   title: Text(
          //     'Login Page',
          //     style: TextStyle(
          //       fontSize: _drawerFontSize,
          //         color:Colors.black
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Login_Screen()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.person_add_alt_1,
          //       size: _drawerIconSize, color:Colors.purple.shade200),
          //   title: Text(
          //     'Registration Page',
          //     style: TextStyle(
          //         fontSize: _drawerFontSize,
          //         color:Colors.black),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => DoctorRegist()),
          //     );
          //   }
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.password_rounded,
          //     size: _drawerIconSize,
          //     color: Colors.purple.shade200,
          //   ),
          //   title: Text(
          //     'Forgot Password Page',
          //     style: TextStyle(
          //         fontSize: _drawerFontSize,
          //         color: Colors.black),
          //   ),
          //   /* onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
          //     );
          //   },*/
          // ),
          // /*ListTile(
          //   leading: Icon(
          //     Icons.verified_user_sharp,
          //     size: _drawerIconSize,
          //     color: Theme.of(context).accentColor,
          //   ),
          //   title: Text(
          //     'Verification Page',
          //     style: TextStyle(
          //         fontSize: _drawerFontSize,
          //         color: Theme.of(context).accentColor),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => ForgotPasswordVerificationPage()),
          //     );
          //   },
          // ),*/
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ProfileScreen(isAppar: true,)));
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FirstPage()));
            },
          ),
        ],
      ),
    );
  }
}

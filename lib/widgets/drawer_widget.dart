import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/data/sharedprefs/shared_preference_helper.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/utils/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:onevote/utils/navigator.dart';
// import 'package:onevote/screens/home_screen.dart';

class DrawerWidgt extends StatefulWidget {
  const DrawerWidgt({super.key});

  @override
  State<DrawerWidgt> createState() => _DrawerWidgtState();
}

class _DrawerWidgtState extends State<DrawerWidgt> {
  var userValue;

  var userName;

  var userEmail;

  var userImage;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenWidth(context) * 0.65,
      backgroundColor: kPrimarycolor,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Gap(screenHeight(context) * 0.12),
          ListTile(
              leading: userImage == null
                  ? Container(
                      alignment: Alignment.topLeft,
                      width: 50.0,
                      height: 50.0,
                      child: Icon(Icons.person),
                    )
                  : Container(
                      alignment: Alignment.topLeft,
                      width: 50.0,
                      height: 50.0,
                      child: Image.network(userImage!),
                    )),
          ListTile(
            title: Text(
              userName,
              style: TextStyle(
                color: kSecondarycolor,
                fontSize: 16,
                fontWeight: fnt600,
              ),
            ),
            subtitle: Text(
              userEmail,
              style: TextStyle(
                color: kSecondarycolor,
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          Gap(screenHeight(context) * 0.12),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(
                color: kSecondarycolor,
                fontSize: 16,
                fontWeight: fnt600,
              ),
            ),
            onTap: () {
              SharedPreferenceHelper().removeUser();
              goToReplace(context, const LoginScreen());
            },
          ),
        ],
      ),
    );
  }

  void getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    userValue = pref.getString("user");
    var userGrup = [];

    if (userValue != null) {
      // decode json string if found
      var userDecoded = json.decode(userValue);

      setState(() {
        userGrup.add(userDecoded[0]);
        userName = userDecoded['name'];
        userEmail = userDecoded['email'];
        userImage = userDecoded['image'];
      });
    }
    //Map userValue = jsonDecode(await SharedPreferenceHelper().getUserData());
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/data/sharedprefs/user_prefrence.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/utils/navigator.dart';
// import 'package:onevote/utils/navigator.dart';
// import 'package:onevote/screens/home_screen.dart';

class DrawerWidgt extends StatelessWidget {
  const DrawerWidgt({super.key});

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
            leading: Container(
              alignment: Alignment.topLeft,
              width: 50.0,
              height: 50.0,
              child: Image.asset("assets/images/avatar.png"),
            ),
          ),
          ListTile(
            title: Text(
              'Jeff Akpabiyo',
              style: TextStyle(
                color: kSecondarycolor,
                fontSize: 16,
                fontWeight: fnt600,
              ),
            ),
            subtitle: Text(
              'jeffakpabiyo@gmail.com',
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
               UserPreference().removeUser();
              goToReplace(context, const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}

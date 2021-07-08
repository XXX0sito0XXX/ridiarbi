import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futller_civil/pages/page_home_tabs/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatefulWidget {
  MoreTab({Key key}) : super(key: key);

  @override
  _MoreTabState createState() => _MoreTabState();
}



class _MoreTabState extends State<MoreTab> {

  _logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushNamedAndRemoveUntil(
    context, 
    LoginPage.routeName, 
    (_) => false);
}

  @override
  Widget build(BuildContext context) {
    print("Mas");
    return Center(
      child: CupertinoButton(
        child: Text("Cerrar Sesión"),
        onPressed: _logOut,
      )
    );
  }
}
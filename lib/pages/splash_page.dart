import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:futller_civil/pages/home_page.dart';
import 'package:futller_civil/pages/page_home_tabs/login_page.dart';
import 'package:futller_civil/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {

  @override
  void initState() {    
    super.initState();   
  }

  @override
  void afterFirstLayout(BuildContext context) {
     Future.delayed(Duration(seconds: 2)).then((_){          
      // Navigator.pushReplacementNamed(context, LoginPage.routeName);
      this._checkLogin();
    });
  }

  _checkLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool wasLogin = prefs.getBool("wasLogin");
    print("wasLogin $wasLogin");
    if(wasLogin == null || wasLogin == false){
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }else{
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
       body: Center(
        //  child: CupertinoActivityIndicator(
        //    radius: 15,
        //  ),
        //  child: SpinKitRotatingCircle(
        //     color: Colors.black,
        //     size: 50.0,
        //   ),
        child: Center(
          child:ColorLoader3(
            radius:30.0,
            dotRadius: 5.0,
          )
        )
        
       ),
    );
  }
}
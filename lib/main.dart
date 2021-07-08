import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futller_civil/pages/images_page.dart';
import 'package:futller_civil/pages/page_home_tabs/login_page.dart';
import 'package:futller_civil/pages/post_page.dart';
import 'package:futller_civil/pages/splash_page.dart';
import 'pages/home_page.dart';

void main() => runApp(RIDIARBI());


class RIDIARBI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);

        if(!focus.hasPrimaryFocus && focus.hasFocus){
            FocusManager.instance.primaryFocus.unfocus();
        }

      },
      child: MaterialApp(   
        home: SplashPage(),
        routes: {
          ImagesPage.routeName : (BuildContext context)=> ImagesPage(),      
          HomePage.routeName : (_)=>HomePage(),      
          PostsPage.routeName:  (_)=>PostsPage(),
          LoginPage.routeName:  (_)=>LoginPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );   
  }  
}
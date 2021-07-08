import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:futller_civil/pages/chat_page.dart';
// import 'package:futller_civil/pages/images_page.dart';
// import 'package:futller_civil/pages/post_page.dart';
import 'package:futller_civil/widgets/avatar.dart';
// import 'package:futller_civil/widgets/cronometer.dart';
// import 'package:futller_civil/widgets/my_appbar.dart';
// import 'package:futller_civil/widgets/my_btn.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _isEnabled = false;
  double _fontSize = 20;
  
  @override
  Widget build(BuildContext context) {
    print("Inicio");
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context,contraints){
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[            
                  Container(
                    color: Color(0xfff8f8f8),
                    height: contraints.maxHeight * 0.5,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        Avatar(
                          size: contraints.maxHeight * 0.3,
                        ),
                        SizedBox(height: 10,),
                        Text("Bienvenido"),
                        Text(
                          "Luis Román ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ]
                    )
                  ),
                   SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(itemBuilder: (_, index){
                      return Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(5),
                        color: Colors.black12,
                      );
                    }, 
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(itemBuilder: (_, index){
                      return Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(5),
                        color: Colors.black12,
                      );
                    }, 
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(itemBuilder: (_, index){
                      return Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(5),
                        color: Colors.black12,
                      );
                    }, 
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    ),
                  ),
                  // _isEnabled == true?Cronometer(initTime: 90, fontSize: _fontSize,):Container(),
                  // SizedBox(
                  //   height: 10
                  // ),
                  // CupertinoButton(
                  //   onPressed: (){
                  //     setState(() {
                  //       _isEnabled = !_isEnabled;
                  //     });
                  //   },
                  //   color: Colors.blue,
                  //   child: Text("Enabled: $_isEnabled"),                       
                  // ),
                  // SizedBox(
                  //   height:10
                  // ),
                  // CupertinoButton(
                  //   onPressed: (){
                  //     final route = MaterialPageRoute(builder: (BuildContext _)=>ChatPage(username: "Paola Sanchez",));
                  //     Navigator.push(context, route);
                  //   },
                  //   color: Colors.green,
                  //   child: Text("Go to Chat"),
                  // )
                  // MyBtn(
                  //   label: "My post",
                  //   onPressed: (){
                  //     Navigator.pushNamed(context, PostsPage.routeName);
                  //   },
                  // )
                ],
              ),
            ),
          );
        },
      )
    );
  }


}
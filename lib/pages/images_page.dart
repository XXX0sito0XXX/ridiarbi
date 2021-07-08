import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futller_civil/widgets/my_appbar.dart';



class ImagesPageArgs{
  final String username;
  final bool isActive;

  ImagesPageArgs({@required this.username,@required this.isActive});
}

class ImagesPage extends StatefulWidget {  

  static final routeName = 'images';
  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {

    final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
       body: SafeArea(
         child: Container(
           width: double.infinity,
           height: double.infinity,
           child: Column(
              children: <Widget>[
                MyAppBar(
                  rightIcon: 'assets/icons/message1.svg',
                  leftIcon: 'assets/icons/back.svg',
                  onRightClick: (){                
                  },
                  onLeftClick: ()=> Navigator.pop(context),                
                ),
                Expanded(
                  child: GridView.builder(                    
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index){
                      return Container(
                        color: Colors.black12,
                        alignment: Alignment.center,
                        child: Text("${index + 1}"),
                      );
                    },   
                    itemCount: 1000,                 
                  ),
                )
              ]
           ),
         )
       ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futller_civil/pages/chat_page.dart';

class MyAppBar extends StatelessWidget {

  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;
  // assets/icons/person.svg
  // assets/icons/message1.svg

  MyAppBar({Key key,@required this.leftIcon,@required this.rightIcon, this.onLeftClick, this.onRightClick}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Color(0xffeeeeee),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CupertinoButton(
            onPressed: onLeftClick,
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(leftIcon, width: 35,),
          ),
          Text("RIDIARBII",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),  
          CupertinoButton(
            onPressed: onRightClick,
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(rightIcon, 
                  width: 30),
                ),                  
                Positioned(right: 12,top: 12, child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                )),
              ],
            ),
          ),       
        ],
      ),
    );
  }
}
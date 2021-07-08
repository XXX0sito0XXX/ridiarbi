import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futller_civil/widgets/circle_container.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget{
  final double size;

  const Avatar({Key key, this.size=150}) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  var _file;  

  void  _pickImage() async {
   final _picker = ImagePicker();
   var  pickedImage = await _picker.getImage(source: ImageSource.gallery);
    setState(() {   
        _file = pickedImage.path;
     
    });
  }
    
  @override
  Widget build(BuildContext context) {    
    return Container(
      width: widget.size,
      height: widget.size,      
      child: Stack(
        children: <Widget>[
          _file == null 
          ? SvgPicture.asset(
            'assets/icons/user.svg'
            )
          :ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.file(File(_file), height: 160,width: 160,fit: BoxFit.cover),
          ),
         
          Positioned(            
            child:  CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 30,
              onPressed: () => _pickImage(),              
              child: CircleContainer(    
                child: Icon(Icons.edit),          
                size: 60,    
              ),
            ),
            right: 0, 
            top:0,
          )
        ],
      ), 
    );
  }
}
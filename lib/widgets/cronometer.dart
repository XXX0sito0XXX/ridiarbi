import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futller_civil/widgets/circle_container.dart';
import 'package:after_layout/after_layout.dart';

class Cronometer extends StatefulWidget{
  
  final double initTime, fontSize;

  const Cronometer({Key key, this.initTime = 0, this.fontSize}) : super(key: key);


  @override
  State<StatefulWidget> createState()=>CronometerState();  
}

class CronometerState extends State<Cronometer> with AfterLayoutMixin {
  double _time;
  Timer _timer;

  @override
  void initState(){
    super.initState();
    print("initState");
    _time = widget.initTime;
    
  }

  @override
  void didChangeDependencies() {    
    super.didChangeDependencies();   
  }

  @override
  void didUpdateWidget(Cronometer oldWidget) {    
    super.didUpdateWidget(oldWidget);
    print("old fontSize ${oldWidget.fontSize}");
    print("new fontSize ${widget.fontSize}");
  }

  @override
  void afterFirstLayout(BuildContext context) {
    showDialog(context: this.context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("lalala afterFirstLayout"),
      );
    });
  }
  
  @override
  void dispose() {
    print("dispose");
    _stop();

    super.dispose();
  }

  void _start(){
    _timer = Timer.periodic(Duration(seconds: 1), (Timer _){
      setState(() {
        _time += 1;
      });
    });
  }

  void _stop(){
    _timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text(_time.toString(), 
            style: TextStyle(fontSize: widget.fontSize),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: CircleContainer(child: Icon(Icons.play_arrow), size: 50),
                onPressed: _start,
              ),
              CupertinoButton(
                child: CircleContainer(child: Icon(Icons.stop), size: 50),
                onPressed: _stop,
              )
              
            ]
          )         
        ]
      ),
    );
  }
}

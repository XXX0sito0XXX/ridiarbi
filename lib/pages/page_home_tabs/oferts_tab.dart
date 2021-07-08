import 'package:flutter/material.dart';

class OfertTab extends StatefulWidget {
  OfertTab({Key key}) : super(key: key);

  @override
  _OfertTabState createState() => _OfertTabState();
}

class _OfertTabState extends State<OfertTab> {
  @override
  Widget build(BuildContext context) {
    print("Ofertas");
    return Center(child: Text("Ofertas"));
  }
}
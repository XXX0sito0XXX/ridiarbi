import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futller_civil/pages/chat_page.dart';
import 'package:futller_civil/pages/images_page.dart';
import 'package:futller_civil/pages/page_home_tabs/history_tab.dart';
import 'package:futller_civil/pages/page_home_tabs/home_tab.dart';
import 'package:futller_civil/pages/page_home_tabs/more_tab.dart';
import 'package:futller_civil/pages/page_home_tabs/oferts_tab.dart';
// import 'package:futller_civil/pages/post_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:futller_civil/widgets/avatar.dart';
import 'package:futller_civil/widgets/bottom_menu.dart';
import 'package:futller_civil/widgets/my_appbar.dart';
import 'package:futller_civil/widgets/my_page_view.dart';
// import 'package:futller_civil/widgets/my_btn.dart';
// import '../widgets/circle_container.dart';
// import '../widgets/cronometer.dart';

class HomePage extends StatefulWidget{
  static final routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
int _currentPage = 0;


final _menu = [
          BottomMenuItem(iconPath: 'assets/icons/home.svg', label: 'Inicio', content: HomeTab()),
          BottomMenuItem(iconPath: 'assets/icons/history.svg', label: 'Historial', content: HistoryTab()),
          BottomMenuItem(iconPath: 'assets/icons/shop.svg', label: 'Ofertas', content: OfertTab()),
          BottomMenuItem(iconPath: 'assets/icons/menu.svg', label: 'Más', content: MoreTab()),
        ];
  @override
  void initState() {    
    super.initState();    
  }

  @override
  void dispose() {    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      backgroundColor: Colors.white,       
      bottomNavigationBar: BottomMenu(
        currentPage: _currentPage,
        onChange: (int newCurrentPage){
          setState(() {
            _currentPage = newCurrentPage;
            
          });
        },
        items: _menu,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[              
              MyAppBar(
                rightIcon: 'assets/icons/message1.svg',
                leftIcon: 'assets/icons/person.svg',
                onRightClick: (){
                  final route = MaterialPageRoute(builder: (BuildContext _)=>ChatPage(username: "Paola Sanchez",));
                  Navigator.push(context, route);
                },
                onLeftClick: (){
                  
                  Navigator.pushNamed(context, ImagesPage.routeName, arguments: ImagesPageArgs(username: "Paola", isActive: true));
                },
              ),
              Expanded(
                child: MyPageView(
                  children: _menu.map<Widget>((item)=>item.content).toList(),
                  currentPage: _currentPage,
                )
              )
            ],
          ),
        ),
      ),
    );   
  }
}
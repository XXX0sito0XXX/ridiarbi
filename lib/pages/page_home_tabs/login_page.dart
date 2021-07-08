import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futller_civil/pages/home_page.dart';
import 'package:futller_civil/widgets/my_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  static final routeName = 'login';
  // LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNodePassword = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey();

  String _email = '', _password = '';

  @override
  void dispose() {
    _focusNodePassword.dispose();    
    super.dispose();
  }

  _submit() async{
    final bool isValid = _formKey.currentState.validate();
    if(isValid){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("wasLogin", true);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

 String _validateEmail(String email){
    if(email.isNotEmpty && email.contains("@")){
      _email =  email;
      return null;
    }
    return "invalid email";
  }

  String _validatePassword(String password){
    if(password.isNotEmpty && password.length > 4){
      _password = password;
      return null;
    }
    return "invalid password";
  }

  @override
  Widget build(BuildContext context) {

    final MediaQueryData media = MediaQuery.of(context);
    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Container(
              height: size.height-padding.top-padding.bottom,              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 10),
                    child: Image.asset(
                      'assets/images/ridiarbi.png',
                      width: 300,
                      height: 120,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 330,
                      minWidth: 200,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children:<Widget> [
                          SizedBox(height:30),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "example@domain.com", 
                              labelText: "Email",                          
                              // padding: EdgeInsets.all(10),
                              prefixIcon: Container(
                                width: 70,
                                height: 40,        
                                padding: EdgeInsets.all(10),  
                                child: SvgPicture.asset("assets/icons/email.svg", color: Colors.black54),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),                      
                            ),
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.light,
                            textInputAction: TextInputAction.next,                     
                            validator: _validateEmail,
                            onFieldSubmitted:  (String text){
                              _focusNodePassword.requestFocus();
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "**********", 
                              labelText:"Password",     
                                prefixIcon: Container(
                                width: 70,
                                height: 40,  
                                padding: EdgeInsets.all(10),          
                                child: SvgPicture.asset("assets/icons/lock.svg", color: Colors.black54)              ,
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),                        
                            ),
                            obscureText: true,
                            focusNode: _focusNodePassword,
                            keyboardAppearance: Brightness.light,
                            textInputAction: TextInputAction.send,   
                            validator: _validatePassword,                
                            onFieldSubmitted: (String text) {
                              _submit();
                            },
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget> [
                              CupertinoButton(
                                child: Container(
                                  child: Text(
                                    "Recuperar Contraseñaa",
                                    style: TextStyle(color:Color(0xff304FFE)),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Color(0xff304FFE)
                                      )
                                    )
                                  ),
                                ), 
                                onPressed: (){

                                }
                              ), 
                            ],
                          ),           
                          SizedBox(height: 20),
                          MyBtn(
                            fullWidth: true,
                            label: "INGRESAR",
                            onPressed: _submit,
                            backgroundColor: Color(0xff304FFE),
                            textColor: Colors.white,
                          ),
                          SizedBox(height:35),                    
                          Text("O inicia con"),
                          SizedBox(height:15),
                          Row(
                            children: <Widget> [
                              Expanded(
                                child: MyBtn(
                                  fullWidth: true,
                                  label: "FACEBOOK",
                                  onPressed: (){},
                                  backgroundColor: Color(0xff3b5998),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                                ),
                              ),
                              SizedBox(width:10),
                              Expanded(
                                child: MyBtn(
                                  fullWidth: true,
                                  label: "GOOGLE",
                                  onPressed: (){},
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                                  backgroundColor: Color(0xffEA4335),
                                  textColor: Colors.white,
                                ),
                              ),      
                            ],
                          ),
                          SizedBox(height:30)
                        ],
                      ),
                    )
                  ),           
                ]
              ),
            )
          )
        )
      )
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/transitions/FadeRoute.dart';
import 'package:store/ui/ForgotPassword.dart';
import 'package:store/ui/Home.dart';
import 'package:store/ui/SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Stack(
        children: <Widget>[
          //TODO: Update background with your own background
           FadeInImage(
            image: AssetImage('images/back.png'),
            placeholder: AssetImage(""),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
             backgroundColor: Colors.transparent,
             body: Center(
               child:  Container(
                 decoration: BoxDecoration(
                   color: Colors.white.withOpacity(0.95),
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                 ),
                 margin: EdgeInsets.only(left: 30, right: 30),
                 width: double.infinity,

                   child: ListView(
                     shrinkWrap: true,
                   children: <Widget>[
                     Align(
                       alignment: Alignment.center,
                       child: Padding(
                         padding: EdgeInsets.only(top:20),
                         child: Text(
                           'Hello',
                           style: new TextStyle(
                               fontSize: 24,
                               fontFamily: Roboto.bold
                           ),
                         ),

                       ),
                     ),

                     Align(
                       alignment: Alignment.center,
                       child: Padding(padding: EdgeInsets.only(top:20),
                         child: Text(
                           'Please login to your account',
                           style: new TextStyle(
                               fontSize: 15,
                               color: Colors.black54,
                               fontFamily: Roboto.regular
                           ),
                         ),
                       ),
                     ),



                     Container(
                       margin: EdgeInsets.only(
                         left: 20,
                         right: 20,
                         top: 20,
                         bottom: 10,
                       ),
                       child:  TextField(
                         controller: _emailController,
                         focusNode: _emailFocus,
                         onSubmitted: (value){

                           _fieldFocusChange(context, _emailFocus, _passwordFocus);

                         },
                         textInputAction: TextInputAction.next,
                         cursorColor: Colors.black,
                         decoration: InputDecoration(
                             labelText: 'Email Adress',
                             focusColor: Colors.black,

                             labelStyle: TextStyle(color: Colors.black,
                               fontFamily: 'RobotoRegular',
                             ),
                             focusedBorder: new UnderlineInputBorder(
                                 borderSide:
                                 new BorderSide(color: AppColors.first))),
                       ),
                     ),

                      Container(
                       margin: EdgeInsets.only(
                         left: 20,
                         right: 20,
                         bottom: 10
                       ),
                       child: new TextField(
                         controller: _passwordController,
                         focusNode: _passwordFocus,
                         obscureText: true,
                         cursorColor: Colors.black,
                         onSubmitted: (value){
                           //TODO: Apply your Functions

                         },
                         decoration: InputDecoration(
                             labelText: 'Password',
                             focusColor: AppColors.first,
                             labelStyle: TextStyle(color: Colors.black,
                               fontFamily: 'RobotoRegular',
                             ),
                             focusedBorder: new UnderlineInputBorder(
                                 borderSide:
                                 new BorderSide(color: AppColors.first))),
                       ),
                     ),

                      GestureDetector(
                       onTap: () {
                         Navigator.push(
                             context,
                             PageRouteBuilder(pageBuilder: (_, __, ___) => ForgotPassword()));
                       },
                       child:  Align(
                         child:  Container(
                           margin: EdgeInsets.only(right: 20),
                           child:  Text(
                             'Forgot Password?',
                             style:  TextStyle(color: AppColors.first,
                                 fontFamily: Roboto.medium
                             ),
                           ),
                           alignment: Alignment.topRight,
                         ),
                       ),
                     ),
                      Align(
                        child: Padding(padding: EdgeInsets.only(top:30),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  FadeRoute(page: Home()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 10,
                                  bottom:10 ,
                                  left: 20,
                                  right: 20
                              ),
                              child: new Text(
                                'LOGIN',
                                style: new TextStyle(
                                    fontFamily: Roboto.bold
                                ),
                              ),
                            ),
                            color: AppColors.first,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        alignment: Alignment.center,

                      ),



                      Align(
                        alignment: Alignment.center,
                        child: Padding(padding: EdgeInsets.only(top:20),
                          child: Text(
                            'Or Login With',
                            style: new TextStyle(
                                fontSize: 16,
                                fontFamily: Roboto.medium
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top:20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         new SizedBox(
                           width: 50,
                           height: 50,
                           child: new FlatButton(
                               onPressed: () {
                                 print('fb');
                               },
                               child: new Image.asset(
                                 'images/fb.png',
                                 width: 60,
                                 height: 60,
                               )),
                         ),
                         new SizedBox(
                           width: 50,
                           height: 50,
                           child: new FlatButton(
                               onPressed: () {
                                 print('fb');
                               },
                               child: new Image.asset(
                                 'images/google.png',
                                 width: 60,
                                 height: 60,
                               )),
                         ),
                         new SizedBox(
                           width: 50,
                           height: 50,
                           child: new FlatButton(
                               onPressed: () {
                                 print('fb');
                               },
                               child: new Image.asset(
                                 'images/twitter.png',
                                 width: 60,
                                 height: 60,
                               )),
                         ),
                       ],
                     ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Don't Have Account?",
                  style: new TextStyle(color: AppColors.first,
                      fontFamily: Roboto.regular
                  ),
                ),
                new Padding(padding: EdgeInsets.all(3)),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => SignUp()));
                  },
                  child: new Text(
                    "SIGN UP",
                    style: new TextStyle(
                        color: Colors.black,
                        fontFamily: Roboto.bold
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  var _emailController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
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
              child: Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:  ListView(
                  shrinkWrap: true,

                  children: <Widget>[

                    Align(
                      alignment: Alignment.center,
                      child: Padding(padding: EdgeInsets.only(top:20),
                        child: Text(
                          'Forgot Password?',
                          style: new TextStyle(
                              fontSize: 24,
                              fontFamily: Roboto.bold),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Please enter your email adress',
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
                        bottom: 10,
                      ),
                      child: new TextField(
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.black,
                        focusNode: _emailFocus,
                        controller: _emailController,
                        onSubmitted: (value){
                          //TODO: Apply your Functions
                        },
                        decoration: InputDecoration(
                            labelText: 'Email Address',
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.first))),
                      ),
                    ),
                     Align(
                       alignment: Alignment.center,
                       child: Padding(padding: EdgeInsets.only(top:30,bottom: 10),
                         child: FlatButton(
                           onPressed: () {
                             print('object');
                           },
                           child: new Text(
                             'SEND',
                             style: new TextStyle(
                                 fontFamily: Roboto.bold),
                           ),
                           color: AppColors.first,
                           shape: RoundedRectangleBorder(
                             borderRadius: new BorderRadius.circular(5),
                           ),
                         ),
                       ),
                     )

                  ],
                ),
              ),
            ),
          ),



           Positioned(
            top: 30,
            left: 10,
            child:  IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Stack(
        children: <Widget>[
          //TODO: Update background with your own background
          new FadeInImage(
            image: AssetImage('images/back.png'),
            placeholder: AssetImage(""),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: new Container(
               // width: double.infinity,
                margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: new ListView(
                  shrinkWrap: true,

                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(padding: EdgeInsets.only(top:30),
                        child:  Text(
                          'Sign Up',
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
                          child: new Text(
                            'Enter the requested informations',
                            style: new TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontFamily: Roboto.regular
                            ),
                          )
                      ),
                    ),





                    Container(
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                          top: 20
                      ),
                      child:  TextField(
                        focusNode: _firstNameFocus,
                        controller: _firstNameController,
                        onSubmitted: (value){
                          _fieldFocusChange(context, _firstNameFocus, _lastNameFocus);
                        },
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.first))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: new TextField(
                        focusNode: _lastNameFocus,
                        controller: _lastNameController,
                        onSubmitted: (value){
                          _fieldFocusChange(context, _lastNameFocus, _emailFocus);
                        },
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.first))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child:  TextField(
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        focusNode: _emailFocus,
                        controller: _emailController,
                        onSubmitted: (value){
                          _fieldFocusChange(context, _emailFocus, _passwordFocus);
                        },
                        decoration: InputDecoration(
                            labelText: 'Email Adress',
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.first))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child:  TextField(
                        textInputAction: TextInputAction.done,
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        obscureText: true,
                        cursorColor: Colors.black,
                        onSubmitted: (value){
                          //TODO: Apply your Functions
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            focusColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: AppColors.first))),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: FlatButton(
                          onPressed: () {
                            print('object');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10,
                                bottom: 10
                            ),
                            child: new Text(
                              'SIGNUP',
                              style:  TextStyle(

                                  fontFamily: Roboto.bold),
                            ),
                          ),
                          color: AppColors.first,
                          shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          new Positioned(
            top: 30,
            left: 10,
            child: new IconButton(
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

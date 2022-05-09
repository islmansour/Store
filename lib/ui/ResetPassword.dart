import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var _passwordController = TextEditingController();
  var _verifyPasswordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _verifyPasswordFocus = FocusNode();

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
               child: Container(
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
                        child: Padding(padding: EdgeInsets.only(top:10),
                          child: Text(
                            'Password Reset',
                            style: new TextStyle(
                                fontSize: 24,
                                fontFamily: Roboto.medium),
                          ),)
                      ),

                      Align(
                          alignment: Alignment.center,
                          child: Padding(padding: EdgeInsets.only(top:10),
                              child: Text(
                                'Please select new password',
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
                        ),
                        child:  TextField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          onSubmitted: (value){
                            _fieldFocusChange(context, _passwordFocus, _verifyPasswordFocus);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: AppColors.first))),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: new TextField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          cursorColor: Colors.black,
                          controller: _verifyPasswordController,
                          focusNode: _verifyPasswordFocus,
                          onSubmitted: (value){
                            //TODO: Apply your Functions
                          },

                          decoration: InputDecoration(
                              labelText: 'Verify password',
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: AppColors.first))),
                        ),
                      ),

                       Align(
                         alignment: Alignment.center,
                         child: Padding(padding: EdgeInsets.only(top :30,bottom: 10),
                           child: FlatButton(
                             onPressed: () {
                               print('object');
                             },
                             child: new Text(
                               'RESET',
                               style: new TextStyle(
                                   fontFamily: Roboto.bold),
                             ),
                             color: AppColors.first,
                             shape: RoundedRectangleBorder(
                               borderRadius: new BorderRadius.circular(5),
                             ),
                           ),),
                       )

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

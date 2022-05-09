import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/transitions/FadeRoute.dart';

import 'Login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  double screenHeight = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = double.parse(MediaQuery.of(context).size.height.toString());

    final kTitleStyle = TextStyle(
      color: Colors.black,
      fontFamily: Roboto.bold,
      fontSize: 0.031 * screenHeight,
    );

    final kSubtitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 0.022 * screenHeight,
        fontFamily: Roboto.regular
    );

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFeeaa00),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFB000),

                Color(0xFFeeaa00),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.05 * screenHeight),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            FadeRoute(page: Login()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 0.025 * screenHeight,
                            fontFamily: Roboto.bold,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Wrap(
                  children: <Widget>[
                    Container(
                      height: screenHeight * 0.8,
                      width: double.infinity,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },

                        //TODO: Set your texts and images
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: FadeInImage(
                                    image: AssetImage(
                                      'images/furniture.png',
                                    ),
                                    placeholder: AssetImage(""),
                                    height: screenHeight / 3,
                                    width: screenHeight / 3,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: Text(
                                    'Online Shop',
                                    style: kTitleStyle,
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Center(
                                  child: Text(
                                    'A wide range of products from the best companies.',
                                    textAlign: TextAlign.center,
                                    style: kSubtitleStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: FadeInImage(
                                    image: AssetImage(
                                      'images/shipping.png',
                                    ),
                                    placeholder: AssetImage(""),
                                    height: screenHeight / 3,
                                    width: screenHeight / 3,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: Text(
                                    'Fast Shipping',
                                    style: kTitleStyle,
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Center(
                                  child: Text(
                                    'Shipping can take up to 3 days from purchase',
                                    textAlign: TextAlign.center,
                                    style: kSubtitleStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: FadeInImage(
                                    image: AssetImage(
                                      'images/payment.png',
                                    ),
                                    placeholder: AssetImage(""),
                                    height: screenHeight / 3,
                                    width: screenHeight / 3,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Center(
                                  child: Text(
                                    'Easy Payment',
                                    style: kTitleStyle,
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Center(
                                  child: Text(
                                    'The app secures all personal informations.',
                                    textAlign: TextAlign.center,
                                    style: kSubtitleStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ],
                )),
                _currentPage != _numPages - 1
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.025 * screenHeight,
                                      fontFamily: Roboto.bold,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 0.036 * screenHeight,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 50,
              width: double.infinity,
              color: Color(0xFFeeaa00),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      FadeRoute(page: Login()));
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                    top: 10
                    ,bottom: 10),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.025 * screenHeight,
                        fontWeight: FontWeight.bold,
                          fontFamily: Roboto.medium
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}

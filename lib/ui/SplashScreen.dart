import 'package:flutter/material.dart';
import 'package:store/Data.dart';
import 'package:store/transitions/FadeRoute.dart';
import 'package:store/ui/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //Wait 3 seconds then go to Login Page
    Future.delayed(Duration(milliseconds: 3000), () async {
      Navigator.pushReplacement(context, FadeRoute(page: OnboardingScreen()));

      print(MediaQuery.of(context).size.height.toString());
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //Precache image to load them faster

    for (int i = 0; i < Data.listOfImages.length; i++) {
      var l = Image.asset(Data.listOfImages[i], fit: BoxFit.cover);
      precacheImage(l.image, context);
    }
    for (int i = 0; i < Data.articles.length; i++) {
      for (int j = 0; j < Data.articles[i].image.length; j++) {
        var l = Image.network(Data.articles[i].image[j], fit: BoxFit.cover);
        precacheImage(l.image, context);
      }
    }
    for (int j = 0; j < Data.discount.length; j++) {
      var l = Image.network(Data.discount[j].image, fit: BoxFit.cover);
      precacheImage(l.image, context);
    }

    for (int j = 0; j < Data.listOfNetworkImages.length; j++) {
      var l = Image.network(Data.listOfNetworkImages[j], fit: BoxFit.cover);
      precacheImage(l.image, context);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        //TODO: Update image with your own image and set opacity
        new Opacity(
          opacity: 0.5,
          child: new FadeInImage(
            image: AssetImage('images/back.png'),
            placeholder: AssetImage(""),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        //TODO: Update logo with your own logo
        Center(
          child: FadeInImage(
            image: AssetImage('images/logo.png'),
            placeholder: AssetImage(""),
            width: 171,
            height: 112,
          ),
        )
      ],
    ));
  }
}

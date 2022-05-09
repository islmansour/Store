import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/Data.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Ad.dart';
import 'package:store/ui/HomeWidgets/Cart.dart';
import 'package:store/ui/HomeWidgets/Profile.dart';
import 'package:store/ui/HomeWidgets/Search.dart';
import 'package:store/ui/ProductDetails.dart';
import 'HomeWidgets/BottomMenu.dart';
import 'HomeWidgets/HomePage.dart';
import 'HomeWidgets/Notifications.dart';
import 'ads/Ad1.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey _homePageKey = GlobalKey();
  final GlobalKey _searchKey = GlobalKey();
  final GlobalKey _notificationsKey = GlobalKey();
  final GlobalKey _cartKey = GlobalKey();
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _bottomMenuKey = GlobalKey();

  changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;

  List l = ['Explore', 'Search', 'Notifications', 'Cart', 'Profile'];
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();

    Future.delayed(Duration(milliseconds: 3000)).then((onValue) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Ad1(
            ad: Ad(
              title: '30% Discount',
              subtitle: 'On any chair',
              buttonText: 'Shop Now!',
              image:
                  'https://cdn.wallpaper.com/main/styles/wp_large/s3/legacy/whouse/ac2/1441387758_Ricardo_Casas.jpg',
              action: () {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProductDetails(Data.articles[1]),
                    ));
              },
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      //First Screen
      HomePage(
        key: _homePageKey,
        function: changeIndex,
      ),
      //Second Screen
      Search(
        key: _searchKey,
        function: () {},
      ),
      //Third Screen
      Notifications(
        key: _notificationsKey,
        function: () {},
      ),
      //Fourth Screen
      Cart(
        key: _cartKey,
        function: () {},
      ),
      //Fifth Screen
      Profile(
        key: _profileKey,
        function: () {},
      ),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      //Init Floating Action Bubble
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "הזמנה חדשה",
            iconColor: Colors.white,
            bubbleColor: Color(0xFFFFB000),
            icon: Icons.settings,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {},
          ),
          // Floating action menu item
          Bubble(
            title: "הודעה",
            iconColor: Colors.white,
            bubbleColor: Color(0xFFFFB000),
            icon: Icons.people,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {},
          ),
          //Floating action menu item
          /*  Bubble(
            title: "Home",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.home,
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {},
          ), */
        ],
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        iconColor: Color.fromARGB(255, 237, 162, 0),

        // Flaoting Action button Icon
        iconData: Icons.add_shopping_cart,
        backGroundColor: Colors.white,
      ),

      appBar: AppBar(
        elevation: (_currentIndex == 4) ? 0.0 : 4.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.dehaze),
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext bc) {
                      return BottomMenu(
                          key: _bottomMenuKey, function: changeIndex);
                    });
              });
            },
            color: Colors.black,
          )
        ],
        leading: Visibility(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          visible: (_currentIndex == 2) ? true : false,
        ),
        backgroundColor: AppColors.first,
        title: new Text(
          l[_currentIndex],
          style: new TextStyle(color: Colors.black, fontFamily: Roboto.bold),
        ),
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.third,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.home,
                color: (_currentIndex == 0) ? AppColors.first : Colors.grey,
              ),
              label:
                  'Home' /*  Text(
              'Home',
              style:  TextStyle(
                  color: (_currentIndex == 0) ? AppColors.first : Colors.grey,
                  fontFamily: Roboto.regular),
            ), */
              ),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.search,
                color: (_currentIndex == 1) ? AppColors.first : Colors.grey,
              ),
              label:
                  'Search' /* Text(
              'Search',
              style: TextStyle(
                fontFamily: Roboto.regular,
                color: (_currentIndex == 1) ? AppColors.first : Colors.grey,
              ),
            ), */
              ),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.notifications,
                color: (_currentIndex == 2) ? AppColors.first : Colors.grey,
              ),
              label:
                  'Alerts' /*  Text(
              'Notifications',
              style: TextStyle(
                fontFamily: Roboto.regular,
                color: (_currentIndex == 2) ? AppColors.first : Colors.grey,
              ),
            ), */
              ),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.shoppingCart,
                color: (_currentIndex == 3) ? AppColors.first : Colors.grey,
              ),
              label:
                  'Cart' /* Text(
              'Cart',
              style: TextStyle(
                fontFamily: Roboto.regular,
                color: (_currentIndex == 3) ? AppColors.first : Colors.grey,
              ),
            ), */
              ),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.person,
                color: (_currentIndex == 4) ? AppColors.first : Colors.grey,
              ),
              label:
                  'Profile' /* Text(
              'Profile',
              style: TextStyle(
                fontFamily: Roboto.regular,
                color: (_currentIndex == 4) ? AppColors.first : Colors.grey,
              ),
            ), */
              ),
        ],
      ),
    );
  }
}

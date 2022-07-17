import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/main_activity/ads_page.dart';
import 'screens/main_activity/home_page.dart';
import 'screens/main_activity/profile_page.dart';
import 'screens/main_activity/selfie_of_the_week_page.dart';
import 'screens/main_activity/whats_on_page.dart';
import 'screens/search/search.dart';
import 'screens/profile_menus/profile_menu.dart';
import 'screens/inbox/notifications.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();

}

class HomeState extends State<Home> {

  int selectedPage = 0;

 //Main Activity Pages
  final _mainActivityPages = [
    HomePage(),
  //SelfieOfTheWeekPage(),
  // WhatsOnPage(),
  // AdsPage(),
    ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _mainActivityPages[selectedPage], //initial value is 0 some HomePage will be shown first
      //bottom navigation for main activity
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: <Widget> [
          Icon(Icons.home, size: 30, color: Colors.white,),
          //Icon(Icons.favorite, size: 30, color: Colors.white,),
          //Icon(Icons.star, size: 30, color: Colors.white,),
          //Icon(Icons.search, size: 30, color: Colors.white,),
          Icon(Icons.person, size: 30, color: Colors.white,),
        ],
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );


    /*
    *return DefaultTabController(
      length: 5,
      child: SafeArea(bottom: false,
        child: Scaffold(
          bottomNavigationBar:

          Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide( color: Colors.grey, width: 0.5)),
            ),
            child: TabBar(
                labelColor: Colors.blue,
                padding: EdgeInsets.all(3),
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: MaterialIndicator(
                  height: 3,
                  color: Colors.blue,
                  topLeftRadius: 25,
                  topRightRadius: 25,
                  tabPosition: TabPosition.bottom,
                ),
                tabs: [
                  Tab(icon: Icon(Icons.home, size: 30),),
                  Tab(icon: Icon(Icons.favorite, size: 30),),
                  Tab(icon: Icon(Icons.star, size: 30),),
                  Tab(icon: Icon(Icons.search, size: 30),),
                  Tab(icon: Icon(Icons.person, size: 30),),

                ],
              ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SelfieOfTheWeekPage(),
              WhatsOnPage(),
              AdsPage(),
              ProfilePage()

            ],
          ),
        ),
      ),
    );*/
  }
}
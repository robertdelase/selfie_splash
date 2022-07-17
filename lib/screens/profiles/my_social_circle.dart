import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/profiles/profile_friend.dart';
import 'package:selphie_splash/screens/profiles/profile_user.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../components/popContext.dart';


class MySocialCircle extends StatefulWidget {
  @override
  MySocialCircleState createState() => MySocialCircleState();
}

class MySocialCircleState extends State<MySocialCircle> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,
                  color: Colors.black,)),
                elevation: 0,
                titleSpacing: 0,
	            	//title text for every user's personal follower/following list
                title: Text('My Social Circle', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
                toolbarHeight: 70,
                bottom: TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: MaterialIndicator(
                    height: 4,
                    color: Colors.blue,
                    topLeftRadius: 25,
                    topRightRadius: 25,
                    tabPosition: TabPosition.bottom,
                  ),
                  tabs: [
		                //displays user's followers with corresponding count
                    Tab(text: '123K followers',),
		                //displays user's following with corresponding count
                    Tab(text: '222 following',),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
              children: [
                // first tab bar view widget
		            //displays user's follower's list
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchInput(hint: 'followers', changed: (value){},),
                      Container(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: [
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollower(),
                            ItemFollower1(),
                            ItemFollower(),
                            ItemFollower1(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // second tab bar view widget
		            //displays user's following list
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchInput(hint: 'following', changed: (value){},),
                      Container(
                        height: MediaQuery.of(context).size.height*1.5,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          children: [
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                            ItemFollowing(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
//for searching names of profiles in each tab
class SearchInput extends StatelessWidget {
  SearchInput({
    Key? key,
    required this.hint,
    required this.changed
  }) : super(key: key);
  String hint;
  ValueChanged changed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            Icon(Icons.search,  color: Colors.black,),
            SizedBox(width: 10,),
            Expanded(
                child: TextField(
                  onChanged: changed,
                  style: TextStyle(color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search $hint',
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),

                  ),
                ),)

          ],
        ),

    );
  }
}

//My followers that I am not following
class ItemFollower extends StatelessWidget {
  const ItemFollower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
		                //displays user's profile pic. Onclick takes user to that user's profile
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileUser();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
		                //displays user's name with corresponding country flag. Onclick navigates to that user's profile
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileUser();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
			                  //displays one line preview of user's bio
                        Text('Welcome to my humble pa gg gg gg.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                SizedBox(width: 3,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
		                //allows users to accept follow request from the user
                    ElevatedButton(onPressed: (){showDialog(context: context, builder: AcceptModal);},
                      child: Text('Accept As?'),
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(width: 5,),
		                //allows user to delete user from list & unfollow as well
                    Icon(Icons.delete_forever_rounded, color: Colors.red, size: 30,)
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}

// My followers that I am following too
class ItemFollower1 extends StatelessWidget {
  const ItemFollower1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileFriend();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileFriend();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
                        Text('Welcome to my humble pa gg gg gg.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                    SizedBox(width: 5,),
		    //allows user to delete user from list & unfollow as well
                    Icon(Icons.delete_forever_rounded, color: Colors.red, size: 30,)
              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}

//friends/users that I am following
class ItemFollowing extends StatelessWidget {
  const ItemFollowing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              )
            ]
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProfileFriend();
                        }));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileFriend();
                            }));
                          },
                          child: Text('Alice Stark 🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 3,),
                        Text('Welcome to my humble page ggg ggg.', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),),
                  ],),),
                SizedBox(width: 3,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
		                //allows users to change follower status or unfollow the user completely
                    ElevatedButton(onPressed: (){showDialog(context: context, builder: ChangeStatusModal);},
                      child: Text('Following', style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.white,
                          side: BorderSide(color: Colors.grey, width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
		                //onclick opens popup menu
                    FocusedMenuHolder(
                      menuWidth: MediaQuery.of(context).size.width * 0.6,
                      menuOffset: 10,
                      menuItemExtent: 50,
                      blurSize: 0,
                      menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                      menuItems: [
			                  //allows user to manage notifications of activity of that user
                        FocusedMenuItem(title:Text('Manage Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
			                  //allows user to mute a user completely
                        FocusedMenuItem(title: Text('Mute', style: TextStyle(fontSize: 14),), onPressed:(){}),

                      ],
                      blurBackgroundColor: Colors.black54,
                      openWithTap: true,
                      onPressed: (){},

                      child: Icon(Icons.more_vert, color: Colors.black, size: 30,),

                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),

          ],
        )
    );
  }
}
//allows users to accept follow request
//whatever option the receiving user selects is displayed on the status side of both sender's & receiver's profiles
Widget AcceptModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Accept Me As?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40,),
                SizedBox(width: 5,),
                Text('Lover', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 40,),
                SizedBox(width: 5,),
                Text('Family', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 40,),
                SizedBox(width: 5,),
                Text('Bestie', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 40,),
                SizedBox(width: 5,),
                Text('Friend', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
          ],
        ),
      )
  ),
);
//allows users to change follower status or unfollow user entirely
//whatever option the receiving user selects is displayed on the status side of both sender's & receiver's profiles
Widget ChangeStatusModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: 370,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Change Status To?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40,),
                SizedBox(width: 5,),
                Text('Lover', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 40,),
                SizedBox(width: 5,),
                Text('Family', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 40,),
                SizedBox(width: 5,),
                Text('Bestie', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 40,),
                SizedBox(width: 5,),
                Text('Friend', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.block, color: Colors.black, size: 40,),
                SizedBox(width: 5,),
                Text('Unfollow', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 5,),
            Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,),
          ],
        ),
      )
  ),
);


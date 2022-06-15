import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/posted_items/comments_meme.dart';
import 'package:selphie_splash/screens/posted_items/comments_mood.dart';
import 'package:selphie_splash/screens/posted_items/comments_post.dart';
import 'package:selphie_splash/screens/posted_items/comments_selfie.dart';
import 'package:selphie_splash/screens/posted_items/comments_svlog.dart';
import '../posted_items/moments.dart';
import '../posted_items/tags.dart';
import '../posted_items/reacts.dart';
import '../main_activity/profile_page.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import '../profiles/profile_friend.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('SelfieSplash', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          GestureDetector(onTap: (){
            Navigator.pushNamed(context,'add_new');
          },child: Image.asset('assets/camera.png', width: 35, height: 35,)),
          SizedBox(width: 20,),
          GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'inbox');
              }, child: Image.asset('assets/chats.png', width: 35, height: 35,)),
          SizedBox(width: 20,),
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
        bottom: false,
        child:SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                /*TextButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                }, child: Text('Log Out')),*/
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  height: 200,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stories(),
                      Stories(),
                      Stories(),
                      Stories(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 110,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weekly Motivation', style: kOnboardTextSmall.copyWith(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),),
                          Image.asset('assets/motivation.png', width: 30, height: 30),
                        ],
                      ),
                      Text('"Dreams don\'t work unless you do"', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('- John C Maxwell', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15, fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(2, 4),
                            blurRadius: 10,
                            spreadRadius: 4,
                            color: Colors.grey.withOpacity(0.3)
                        )
                      ]
                  ),
                ),
                SizedBox(height: 20,),
                SelfieItem(),
                SizedBox(height: 20,),
                PostItem(),
                SizedBox(height: 20,),
                MemeItem(),
                SizedBox(height: 20,),
                SVlogItem(),
                SizedBox(height: 20,),
                MoodItem(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ),
    );
  }
}

//Selfie Item layout
class SelfieItem extends StatelessWidget {
  const SelfieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileFriend();
                                  }));
                                },
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage('assets/selfie.jpg'),),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return ProfileFriend();
                                      }));
                                    },
                                    child: Text('Alice Stark 🇺🇸',
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                        fontSize: 13, fontWeight: FontWeight.w500),),
                                    Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
                                    Text(' . 20m', style: TextStyle(fontSize: 13),),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        FocusedMenuHolder(
                          menuWidth: MediaQuery.of(context).size.width * 0.6,
                          menuOffset: 10,
                          menuItemExtent: 50,
                          blurSize: 0,
                          menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                          menuItems: [

                            FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CommentsSelfie();
                              }));
                            }),
                            FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                            FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                            FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                          ],
                          blurBackgroundColor: Colors.black54,
                          openWithTap: true,
                          onPressed: (){},

                          child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                        ),
                      ],
                    ),),
                  SizedBox(height: 10,),
                  Container(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: (
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
                                Text('#selfietags #selfietags #selfietags', style: TextStyle(fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic, fontSize: 16, color: Colors.blue),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),

                  SizedBox(height: 10,),
                  //Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                    child: Image.asset('assets/selfie.jpg', fit: BoxFit.cover, ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsSelfie();
                      }));
                    },),
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
                    Pallets(icon: Icons.share, text: '4',),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}

//Post item layout
class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage('assets/selfie.jpg'),),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ProfileFriend();
                                }));
                              },
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return ProfileFriend();
                                    }));
                                  },
                                  child: Text('Alice Stark 🇺🇸',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Post ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                        fontSize: 13, fontWeight: FontWeight.w500),),
                                    Image.asset('assets/indicator_post.png', width: 18, height: 18),
                                    Text(' . 20m', style: TextStyle(fontSize: 13),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        FocusedMenuHolder(
                          menuWidth: MediaQuery.of(context).size.width * 0.6,
                          menuOffset: 10,
                          menuItemExtent: 50,
                          blurSize: 0,
                          menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                          menuItems: [

                            FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CommentsPost();
                              }));
                            }),
                            FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                            FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                            FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                          ],
                          blurBackgroundColor: Colors.black54,
                          openWithTap: true,
                          onPressed: (){},

                          child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: (
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                            Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                            fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                        SizedBox(height: 10,),
                        Text('#posttags #posttags #posttags', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic, fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 2),
                      ],
                    )
                  ),),
                  SizedBox(height: 10,),
                  //Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                    child: Image.asset('assets/selfie.jpg', fit: BoxFit.cover, ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsPost();
                      }));
                    },),
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
                    Pallets(icon: Icons.share, text: '4',),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}

//Meme item layout
class MemeItem extends StatelessWidget {
  const MemeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileFriend();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage('assets/selfie.jpg'),),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileFriend();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Meme ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_meme.png', width: 20, height: 20),
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [

                          FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CommentsMeme();
                            }));
                          }),
                          FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                        ],
                        blurBackgroundColor: Colors.black54,
                        openWithTap: true,
                        onPressed: (){},

                        child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                      ),
                    ],
                  ),),
                  SizedBox(height: 10,),
                  Container(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: (
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
                                Text('#memetags #memetags #memetags', style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.pink, fontStyle: FontStyle.italic, fontSize: 16),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),
                  SizedBox(height: 10,),
                  //Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                    child: Image.asset('assets/selfie.jpg', fit: BoxFit.cover, ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsMeme();
                      }));
                    },),
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
                    Pallets(icon: Icons.share, text: '4',),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}

//SVlog item layout
class SVlogItem extends StatelessWidget {
  const SVlogItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileFriend();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage('assets/selfie.jpg'),),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileFriend();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('SVlog ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_svlog.png', width: 20, height: 20),
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [

                          FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CommentsSVlog();
                            }));
                          }),
                          FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                        ],
                        blurBackgroundColor: Colors.black54,
                        openWithTap: true,
                        onPressed: (){},

                        child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                      ),
                    ],
                  ),),
                  SizedBox(height: 10,),
                  Container(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: (
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Where users tap to switch between tab/fragment pages of the Activity.",
                                    style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
                                Text('#svlogtags #svlogtags #svlogtags', style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),

                  SizedBox(height: 10,),
                  //Image
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /*
                        *ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                          child: Image.asset('assets/selfie1.jpeg', fit: BoxFit.cover, ),
                        ),*/
                        Positioned(
                            child: Image.asset('assets/splash_svlog.png', scale: 1.4)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.remove_red_eye, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsSVlog();
                      }));
                    },),
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
                    Pallets(icon: Icons.share, text: '4',),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}

//Mood item layout
class MoodItem extends StatelessWidget {
  const MoodItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileFriend();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage('assets/selfie.jpg'),),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileFriend();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Mood ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_mood.png', width: 20, height: 20),
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [

                          FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 14),), onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CommentsMood();
                            }));
                          }),
                          FocusedMenuItem(title: Text('Copy Link', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title:Text('Mute Notifications', style: TextStyle(fontSize: 14),), onPressed:(){}),
                          FocusedMenuItem(title: Text('Report', style: TextStyle(fontSize: 14),), onPressed:(){}),

                        ],
                        blurBackgroundColor: Colors.black54,
                        openWithTap: true,
                        onPressed: (){},

                        child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Image.asset('assets/m32.png', width: 40, height: 40),
                  SizedBox(height: 10,),
                  Text("Always be Happy!", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                  SizedBox(height: 10,),
                  Text('#moodtags #moodtags #moodtags', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic, fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 2),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 4),
                      blurRadius: 10,
                      spreadRadius: 4,
                      color: Colors.grey.withOpacity(0.3)
                  )
                ]
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 55,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '333K',),
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsMood();
                      }));
                    },),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}



class Pallets extends StatelessWidget {
   Pallets({
    Key? key,
    required this.icon,
    required this.text,
    this.tapped
  }) : super(key: key);

  final IconData icon;
  final String text;
  VoidCallback? tapped;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Row(
        children: [
          Icon(icon, size: 35, color: Colors.grey.shade200,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade200, fontSize: 18),)
        ],
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          Moments()
      ));
    },
    child: Container(
        margin: EdgeInsets.only(right: 3),
        width: 140,
        height: 190,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.white.withOpacity(0.3)
              ),

            ]
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mark Alice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 12),),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text(' 20m', style: TextStyle(color: Colors.white, fontSize: 12), ),
                        SizedBox(width: 3,),
                        Text('.', style: TextStyle(color: Colors.white, fontSize: 12), ),
                        SizedBox(width: 3,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('3.2K', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(width: 2,),
                            Icon(Icons.remove_red_eye, color: Colors.white, size: 18,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0), bottomRight:Radius.circular(20), bottomLeft: Radius.circular(20)),
                ),

              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)

                ),
                child: Text('6', style: TextStyle(color: Colors.white, fontSize: 13),),
              ),
            )
          ],
        )
    ),
    );

  }
}

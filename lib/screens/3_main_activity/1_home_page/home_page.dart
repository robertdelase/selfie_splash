import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import '../4_ads_page/3_discover_people_page/profile_page/1_moments_page/moments.dart';
import '../4_ads_page/3_discover_people_page/profile_page/4_gallery/1_gallery_selfie/comment_page/comments_selfie.dart';
import '../4_ads_page/3_discover_people_page/profile_page/4_gallery/2_gallery_post/comment_page/comments_post.dart';
import '../4_ads_page/3_discover_people_page/profile_page/4_gallery/3_gallery_meme/comment_page/comments_meme.dart';
import '../4_ads_page/3_discover_people_page/profile_page/4_gallery/4_gallery_svlog/comment_page/comments_svlog.dart';
import '4_item_selfie/1_profile_page/profile_friend.dart';
import '8_item_mood/2_comment_page/comments_mood.dart';
import '9_comment_reacts_tags/tags.dart';


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
	        //for opening the "Splash A New?" page to select content to upload
          GestureDetector(onTap: (){
            Navigator.pushNamed(context,'add_new');
          },child: Image.asset('assets/camera.png', width: 35, height: 35,)),
          SizedBox(width: 20,),
	        //for opening one's inbox
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
		            //for displaying Moments (stories) on the Home Page
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
                //for displaying the weekly motivation quotes which is updated on a weekly basis
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
		            //for displaying uploaded contents i.e. Selfies, Posts, Memes, SVlogs & Moods
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

//Selfie item layout
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
			                      //for displaying user's profile picture. Onclick navigates to that user's profile
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
			                          //for displaying user's name with country flag. Onclick navigates to that user's profile
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
                                    //selfie indicator
                                    Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                        fontSize: 13, fontWeight: FontWeight.w500),),
                                    Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
				                            //time posted
                                    Text(' . 20m', style: TextStyle(fontSize: 13),),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
			                  //for displaying pop up menu onclick
                        FocusedMenuHolder(
                          menuWidth: MediaQuery.of(context).size.width * 0.6,
                          menuOffset: 10,
                          menuItemExtent: 50,
                          blurSize: 0,
                          menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                          menuItems: [
			                    //allows users to view comment page of Selfie item
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
				                      //for displaying location of user
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
				                        //for displaying caption on uploaded content
                                Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
                                //for displaying hashtags on uploaded content
                                Text('#selfietags #selfietags #selfietags', style: TextStyle(fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic, fontSize: 16, color: Colors.blue),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),

                  SizedBox(height: 10,),
                  //Image of Selfie content uploaded
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
		                //for liking/unliking content, with corresponding count
                    Pallets(icon: Icons.favorite_border, text: '333K',),
		                //navigates user to content's comment, with corresponding count
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsSelfie();
                      }));
                    },),
		                //navigates user to content's tag list, with corresponding count
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
		                //for sharing content, with corresponding count
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
			                      //for displaying user's profile picture. Onclick navigates to that user's profile
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
				                        //for displaying user's name with country flag. Onclick navigates to that user's profile
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
				                            //post indicator
                                    Text('Post ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                        fontSize: 13, fontWeight: FontWeight.w500),),
                                    Image.asset('assets/indicator_post.png', width: 18, height: 18),
				                            //time posted
                                    Text(' . 20m', style: TextStyle(fontSize: 13),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
			                  //for displaying pop up menu onclick
                        FocusedMenuHolder(
                          menuWidth: MediaQuery.of(context).size.width * 0.6,
                          menuOffset: 10,
                          menuItemExtent: 50,
                          blurSize: 0,
                          menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                          menuItems: [
			                      //allows users to view comment page of Post item
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
			                  //for displaying location of user
                        Row(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                            Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),)
                          ],
                        ),
                        SizedBox(height: 10,),
			                  //for displaying caption on uploaded content
                        Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                            fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                        SizedBox(height: 10,),
			                  //for displaying hashtags on uploaded content
                        Text('#posttags #posttags #posttags', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic, fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 2),
                      ],
                    )
                  ),),
                  SizedBox(height: 10,),
                  //Image/video content
                  //Multiple content should be displayed with swiping feature & indicator dots
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
		                //for liking/unliking content, with corresponding count
                    Pallets(icon: Icons.favorite_border, text: '333K',),
		                //navigates user to content's comment, with corresponding count
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsPost();
                      }));
                    },),
		                //navigates user to content's tag list, with corresponding count
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
		                //for sharing content, with corresponding count
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
			                  //for displaying user's profile picture. Onclick navigates to that user's profile
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
			                        //for displaying user's name with country flag. Onclick navigates to that user's profile
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
				                          //meme indicator
                                  Text('Meme ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_meme.png', width: 20, height: 20),
				                          //time posted
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
		                  //for displaying pop up menu onclick
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [
			                    //allows user to view comment page of Meme item
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
				                        //for displaying location of user
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
				                        //for displaying caption on uploaded content
                                Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
				                        //for displaying hashtags on uploaded content
                                Text('#memetags #memetags #memetags', style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.pink, fontStyle: FontStyle.italic, fontSize: 16),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),
                  SizedBox(height: 10,),
                  //Image/Video of uploaded content.
                  //Multiple content should be displayed with swiping feature & indicator dots
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
		                //for liking/unliking content, with corresponding count
                    Pallets(icon: Icons.favorite_border, text: '333K',),
		                //navigates user to content's comment, with corresponding count
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsMeme();
                      }));
                    },),
		                //navigates user to content's tag list, with corresponding count
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
		                //for sharing content, with corresponding count
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
			                    //for displaying user's profile picture. Onclick navigates to that user's profile
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
			                        //for displaying user's name with country flag. Onclick navigates to that user's profile
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
				                          //svlog indicator
                                  Text('SVlog ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_svlog.png', width: 20, height: 20),
				                          //time posted
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
		                  //for displaying pop up menu onclick
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [
			                    //allows user to view comment page of SVlog item
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
				                        //for displaying location of user
                                Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                                    Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),)
                                  ],
                                ),
                                SizedBox(height: 10,),
				                        //for displaying caption on uploaded content
                                Text("Where users tap to switch between tab/fragment pages of the Activity.",
                                    style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                                    fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                                SizedBox(height: 10,),
				                        //for displaying hashtags on uploaded content
                                Text('#svlogtags #svlogtags #svlogtags', style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),
                                    overflow: TextOverflow.ellipsis, maxLines: 2),
                              ]))),

                  SizedBox(height: 10,),
                  //for displaying video of uploaded content with play button
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
			                  //play button for video
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
		                //views on content, with corresponding count
                    Pallets(icon: Icons.remove_red_eye, text: '333K',),
		                //navigates user to content's comment, with corresponding count
                    Pallets(icon: Icons.comment, text: '333K', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CommentsSVlog();
                      }));
                    },),
		                //navigates user to content's tag list, with corresponding count
                    Pallets(icon: Icons.account_circle_rounded, text: '26', tapped: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Tags();
                      }));
                    },),
		                //for sharing content, with corresponding count
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
			                    //for displaying user's profile picture. Onclick navigates to that user's profile
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
			                        //for displaying user's name with country flag. Onclick navigates to that user's profile
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
				                        //mood indicator
                                  Text('Mood ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                      fontSize: 13, fontWeight: FontWeight.w500),),
                                  Image.asset('assets/indicator_mood.png', width: 20, height: 20),
				                          //time posted
                                  Text(' . 20m', style: TextStyle(fontSize: 13),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      //for displaying pop up menu onclick
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [
			                  //allows user to view comment page of Mood item
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
		              //for displaying mood emoji
                  Image.asset('assets/m32.png', width: 40, height: 40),
                  SizedBox(height: 10,),
		              //for displaying mood caption
                  Text("Always be Happy!", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),overflow: TextOverflow.ellipsis, maxLines: 3),
                  SizedBox(height: 10,),
		              //for displaying mood hashtags
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
		                //for liking/unliking content, with corresponding count
                    Pallets(icon: Icons.favorite_border, text: '333K',),
		                //navigates user to content's comment, with corresponding count
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


//uploaded contents pallets layout
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

//Moments/stories layout
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
	          //image/video of last posted item
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
		                //name of user
                    Text('Mark Alice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 12),),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
			                  //time posted
                        Text(' 20m', style: TextStyle(color: Colors.white, fontSize: 12), ),
                        SizedBox(width: 3,),
                        Text('.', style: TextStyle(color: Colors.white, fontSize: 12), ),
                        SizedBox(width: 3,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
		 	                      //number of views of current items in Moments
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
	          //Moments/stories count
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

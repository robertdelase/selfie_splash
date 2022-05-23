import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/posted_items/comments_selfie.dart';
import '../posted_items/moments.dart';
import '../profiles/profile_user.dart';

class SelfieOfTheWeekCountry extends StatelessWidget {
  const SelfieOfTheWeekCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
        ],
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('SOTW(Ghana)🇬🇭', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  /*TextButton(onPressed: (){
                   showDialog(context: context, builder: ModalWinner);

                  }, child: Text('Launch alert')),*/
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 230,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stories(),
                        Stories(),
                        Stories(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Selfie(),
                  Selfie1(),
                  Selfie2(),
                ],
              ),
            ),
          )
      ),
    );
  }
}


class Selfie extends StatelessWidget {
  const Selfie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('SOTW(GHANA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
              color: Colors.blueGrey),),),
          SizedBox(height: 5,),
          Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProfileUser();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/welcome.png'),),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileUser();
                              }));
                            },
                            child: Text('Alice Stark 🇬🇭 ',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                          ),
                          Icon(Icons.stars, color: Colors.brown, size: 20,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                              fontSize: 13, fontWeight: FontWeight.w500),),
                          Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
                          Text(' . 13/07/2022 . Happy🤗 ', style: TextStyle(fontSize: 13),),
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

                ],
                blurBackgroundColor: Colors.black54,
                openWithTap: true,
                onPressed: (){},

                child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

              ),
            ],
          ),),
          SizedBox(height: 15,),
          //Image
          Image.asset('assets/welcome.png',),
          SizedBox(height: 10,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 35,),
                SizedBox(width: 5,),
                Text('7K', style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                ],
              ),),
        ],
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
    );
  }
}

class Selfie1 extends StatelessWidget {
  const Selfie1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('2ND MOST ADMIRED', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
              color: Colors.blueGrey),),),
          SizedBox(height: 5,),
          Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProfileUser();
                      }));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/welcome.png'),),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProfileUser();
                          }));
                        },
                        child: Text('Alice Stark 🇬🇭 ',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                              fontSize: 13, fontWeight: FontWeight.w500),),
                          Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
                          Text(' . 13/07/2022 . Happy🤗 ', style: TextStyle(fontSize: 13),),
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

                ],
                blurBackgroundColor: Colors.black54,
                openWithTap: true,
                onPressed: (){},

                child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

              ),
            ],
          ),),
          SizedBox(height: 15,),
          //Image
          Image.asset('assets/welcome.png',),
          SizedBox(height: 10,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 35,),
                SizedBox(width: 5,),
                Text('7K', style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                ],
              ),),
        ],
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
    );
  }
}

class Selfie2 extends StatelessWidget {
  const Selfie2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(right: 5, left: 5, bottom: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('3RD MOST ADMIRED', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
          color: Colors.blueGrey),),),
          SizedBox(height: 5,),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProfileUser();
                          }));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/welcome.png'),),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfileUser();
                              }));
                            },
                            child: Text('Alice Stark 🇬🇭 ',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Selfie ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic,
                                  fontSize: 13, fontWeight: FontWeight.w500),),
                              Image.asset('assets/indicator_selfie.png', width: 20, height: 20),
                              Text(' . 13/07/2022 . Happy🤗 ', style: TextStyle(fontSize: 13),),
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

                    ],
                    blurBackgroundColor: Colors.black54,
                    openWithTap: true,
                    onPressed: (){},

                    child: Icon(Icons.more_vert, color: Colors.black, size: 25,),

                  ),
                ],
              ),),
          SizedBox(height: 15,),
          //Image
          Image.asset('assets/welcome.png',),
          SizedBox(height: 10,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 35,),
                SizedBox(width: 5,),
                Text('7K', style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                ],
              ),),
        ],
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
        margin: EdgeInsets.only(right: 5),
        width: 170,
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
                    Text('Mark Alice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
                    Row(
                      children: [
                        Text('20m', style: TextStyle(color: Colors.white, fontSize: 12),),
                        SizedBox(width: 3,),
                        Text('.', style: TextStyle(color: Colors.white, fontSize: 12 ), ),
                        SizedBox(width: 3,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('3.2K', style: TextStyle(color: Colors.white, fontSize: 12),),
                            SizedBox(width: 3,),
                            Icon(Icons.remove_red_eye, color: Colors.white, size: 20)
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)

                ),
                child: Text('6', style: TextStyle(color: Colors.white, fontSize: 15),),
              ),
            )
          ],
        )
    ));
  }
}

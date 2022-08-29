import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import '../1_home_page/3_item_moments/moments.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/1_gallery_selfie/comment_page/comments_selfie.dart';
import '../4_ads_page/3_discover_people_page/profile_page/profile_user.dart';


class SelfieOfTheWeekPage extends StatelessWidget {
  const SelfieOfTheWeekPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = ['🇬🇭', '🇬🇬', '🇦🇽', '🇨🇩','🇺🇸', '🇳🇮'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('Selfie of the Week', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          GestureDetector(
              onTap: (){
                showDialog(context: context, builder: ModalWinner);
              },
              child: Image.asset('assets/info.png', width: 35,  height: 35,))
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
                   showDialog(context: context, builder: ModalWinner);

                  }, child: Text('Launch alert')),*/
                  SizedBox(height: 20,),
                  GestureDetector(onTap: (){
                    Navigator.pushNamed(context,'selfie_of_the_week_country');
                  },child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Selfie of the Week (Ghana) 🇬🇭', style: kOnboardTextSmall.copyWith(wordSpacing: 1, color: Colors.black, fontWeight: FontWeight.w600),),
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
                  ),),

                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 230,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stories(title: '🇬🇭'),
                        Stories(title: '🇬🇬',),
                        Stories(title: '🇦🇽',),
                        Stories(title: '🇨🇩',),
                        Stories(title: '🇺🇸',),
                        Stories(title: '🇳🇮',),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  SelfieAfrica(),
                  SelfieAsia(),
                  SelfieAustralia(),
                  SelfieEurope(),
                  SelfieNorthAmerica(),
                  SelfieSouthAmerica(),
                ],
              ),
            ),
          )
      ),
    );
  }
}

  Widget ModalWinner(BuildContext context) =>AlertDialog(
    contentPadding: EdgeInsets.all(10),
    backgroundColor: Colors.transparent,
    content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      height:300,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/award.png', scale: 3.5,),
          SizedBox(height: 5,),
          Text('Get the most selfie admiration for the week to win!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
  );

class SelfieAfrica extends StatelessWidget {
  const SelfieAfrica({
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
          Center(child: Text('SOTW(GLOBAL/AFRICA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                          Icon(Icons.stars, color: Colors.amber, size: 20),
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
          child: Column(
            children: [
              Row(
                children: [
                  Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text('Ghana🇬🇭', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                ],
              )
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
class SelfieAsia extends StatelessWidget {
  const SelfieAsia({
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
          Center(child: Text('SOTW(ASIA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                            child: Text('Su Lin 🇬🇬 ',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                          ),
                          Icon(Icons.stars, color: Colors.grey, size: 20),
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
            child: Column(
                children: [
                  Row(
                    children: [
                      Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('#funSelfie', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('South Korea🇬🇬', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  )
                ],
          )),
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
class SelfieAustralia extends StatelessWidget {
  const SelfieAustralia({
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
          Center(child: Text('SOTW(AUSTRALIA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                                child: Text('Shika Vole 🇦🇽 ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              Icon(Icons.stars, color: Colors.grey, size: 20),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('#funSelfie', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('Australia🇦🇽', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  )
                ],
              )),
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
class SelfieEurope extends StatelessWidget {
  const SelfieEurope({
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
          Center(child: Text('SOTW(EUROPE)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                                child: Text('Madie Blanc 🇨🇩 ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              Icon(Icons.stars, color: Colors.grey, size: 20),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('#funSelfie', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('France🇨🇩', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  )
                ],
              )),
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
class SelfieNorthAmerica extends StatelessWidget {
  const SelfieNorthAmerica({
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
          Center(child: Text('SOTW(NORTH AMERICA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfileUser();
                                  }));
                                },
                                child: Text('Ashley Cooke 🇺🇸 ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              Icon(Icons.stars, color: Colors.grey, size: 20,),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('#funSelfie', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('USA🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  )
                ],
              )),
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
class SelfieSouthAmerica extends StatelessWidget {
  const SelfieSouthAmerica({
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
          Center(child: Text('SOTW(SOUTH AMERICA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
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
                                child: Text('Ney Santos 🇳🇮 ',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              ),
                              Icon(Icons.stars, color: Colors.grey, size: 20),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('SelfieTag: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 18, fontStyle: FontStyle.italic),)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('Country: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('Brazil🇳🇮', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 18),)
                    ],
                  )
                ],
              )),
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
   Stories({
    Key? key,
    required this.title
  }) : super(key: key);
  String title;

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
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)

                    ),
                    child: Text('6', style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
                  Text(title, style: TextStyle(fontSize: 20),),
                ],)
            )
          ],
        )
    ));
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/3_discover_people_page/profile_page/profile_user.dart';



class DiscoverPeople extends StatelessWidget {
  const DiscoverPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.2,
        titleSpacing: 0,
	      //title text
        title: Text('Discover People', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
            child: Column(
            children: [
              Container(
                height: size.height * 0.26,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1,2),
                          blurRadius: 4,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(0.1)
                      )
                    ]
                ),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
		                  //page info text
                      Text('Add people to your social circle.', style: kOnboardTextSmall.copyWith(color: Colors.black87, fontWeight: FontWeight.bold, wordSpacing: 0.3),),
                      SizedBox(height: 15,),
                      Container(
                        height: size.height * 0.2 * 0.80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
			                      //onclick allows user to find SelfieSplash users from their contacts
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.contact_phone_rounded, size: 60, color: Colors.blue,),
                                  SizedBox(height: 5,),
                                  Text('Connect Contacts', style: kLittleDarkGreyText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 1, height: 90, child: Container(color:Colors.grey),),
			                      //onclick allows users to find SelfieSplash users in their vicinity
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.location_on, size: 60, color: Colors.orange,),
                                  SizedBox(height: 5,),
                                  Text('Search Area', style: kLittleDarkGreyText,)
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

		              //displays list of suggested profiles users can follow
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    margin: EdgeInsets.only(top: 5),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),
                        DiscoverItem(),

                      ],
                    ),

                  )

            ],
          ),)

    );

  }
}


//item widget layout
class DiscoverItem extends StatelessWidget {
  const DiscoverItem({
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
        child: Column(
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
                      //displays user's profile pic. Onclick navigates to user's profile
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfileUser();
                            }));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/selfie1.jpeg'),),),
                      SizedBox(width: 5,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
			                    //displays user's name with country flag. Onclick navigates to user's profile
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
                          Text('Welcome to my humble page.', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(color: Colors.grey, fontSize: 13),)
                        ],
                      ),),
                    ],),),
                  SizedBox(width: 3,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
		                  //allows users to follow that user
                      ElevatedButton(onPressed: (){showDialog(context: context, builder: FollowModal);},
                        child: Text('Follow'),
                        style: ElevatedButton.styleFrom(
                            elevation: 1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                        ),
                      ),
                      SizedBox(width: 5,),
		                  //allows users to delete that user from the list
                      Icon(Icons.delete_forever_rounded, color: Colors.red, size: 30,)
                    ],
                  )
                ],
              ),
              SizedBox(height: 5,),

            ],
          ),
    );
  }
}
//allows users to follow that user
Widget FollowModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
      ),
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Follow Me As?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 18),),
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
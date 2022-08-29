import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

import '../1_home_page/3_item_moments/moments.dart';
import '../1_home_page/4_item_selfie/1_profile_page/2_mood_layout/profile_mood.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/1_gallery_selfie/profile_selfies.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/2_gallery_post/profile_posts.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/3_gallery_meme/profile_memes.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/4_gallery_svlog/profile_svlogs.dart';
import '../1_home_page/4_item_selfie/1_profile_page/4_gallery/5_gallery_tag/profile_tags.dart';
import '3_mood_layout/add_edit_mood.dart';
import '4_edit_profile/edit_profile.dart';
import '5_social_circle/my_social_circle.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          'Me',
          style: kOnboardTextBig.copyWith(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: [
	        //onclick takes user to the menu profile page
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, 'profile_menu');},
            child: Image.asset(
              'assets/menu.png', width: 35, height: 35,
            ),
          ),
        ],
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Stack(
              children: [
		            //displays cover image of user. The same image as the user's profile pic
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/selfie1.jpeg'),
                          fit: BoxFit.cover)),
                ),
		            //profile container colour is dependent on the colour family a user chooses
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 420,
                    margin: EdgeInsets.only(top: 40, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, left: 20, right: 20,),
                      child: Column(
                        children: [
			                    //displays the user's profile pic
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('assets/selfie1.jpeg'),
                          ),
                          SizedBox(height: 15,),
			                    //displays the user's name with user's country flag
                          Text('Princess Sersei🇬🇭', style: kOnboardTextSmall.copyWith(fontSize:22, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
			                    //displays the user's bio
                          Text('Sersei is the name not your regular gal don\'t forget to smile ;)',
                              overflow: TextOverflow.ellipsis, maxLines: 3,
                              textAlign: TextAlign.center, style: kOnboardTextSmall.copyWith(fontSize: 16, wordSpacing: 0.2),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
			                        //displays the user's birthday
                              Row(
                                children: [
                                  Icon(Icons.cake, color: Colors.white,),
                                  Text('11/06/1995 ', style: kOnboardTextSmall.copyWith(fontSize: 15),)
                                ],
                              ), 
			                        SizedBox(width: 5,),
                              Container(width: 1,height: 28,color: Colors.white,),
 			                        SizedBox(width: 5,),
			                        //displays status. This is how it appears on very user's own profile
                              Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.white,),
                                  Text('Me', style: kOnboardTextSmall.copyWith(fontSize: 15),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ContainerCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
		              //displays the Moments/stories of the user when the user uploads them. Disappears when there are none
                  GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Moments()));
                    }, child: HighLights(
                          text: 'Moments',
                          image: 'assets/welcome.png',
                        ),)
			                  //displays the user's shop when created
                        /*
                        *HighLights(
                          text: 'Shops(23)',
                          image: 'assets/welcome.png',
                        ),
			                  //displays the user's pages when created
                        HighLights(
                          text: 'Pages(1)',
                          image: 'assets/welcome.png',
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  ContainerCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
			                    //displays the user's mood emoji
                          Row(
                            children: [
                              Text('Mood: ', style: kSimpleBasicText.copyWith(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),),
                                  Image.asset('assets/m1.png', width: 40, height: 40,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
			                        //allows user to update/edit mood onclick
                              GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    AddEditMood())
                                );
                              }, child: Icon(Icons.add_reaction, color: Colors.grey,)),
                              SizedBox(width: 15),
                              Container(color: Colors.grey, width: 1, height: 35,),
                              SizedBox(width: 15),
			                        //allows user to view his/her mood history
                              GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    ProfileMood())
                                );
                              }, child: Row(
                                children: [
                                  Text(
                                    '(25)',
                                    style: TextStyle(
                                      color: Colors.grey,),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20, color: Colors.grey,
                                  )
                                ],
                              ))
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 10,),
		                  //displays user's mood text/caption
                      Text('Not stopping still I get to the top.', style: kSimpleBasicText,overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                      SizedBox(height: 10,),
		                  //displays mood hashtags
                      Text('#growth #billionaire', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.purple,
                      fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ],
                  )),
                  SizedBox(height: 20,),
                  ContainerCard(
                      child: Column(
                    children: [
                      //Button colours dependent on the user's family colour
		                  //allows user to change their family colour
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){showDialog(context: context, builder: ChangeFamilyModal);},
                            child: Text('Change Family',
                            style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                primary: Colors.purple,
                                elevation: 0.2
                            ),
                          ),
                        ),
                      ),
		                  //navigates user to the edit profile page to edit their profile details
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return EditProfile();
                              }));
                            }, child: Text('Edit Profile',
                            style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                primary: Colors.purple,
                                elevation: 0.2
                            ),
                          ),
                        ),
                      ),
		                //navigates user to their social circle/follower's & following list
		                //text also displays the number of followers the user has
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MySocialCircle();
                            }));
                          }, child: Text('Social Circle (500K followers)',
                          style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              primary: Colors.purple,
                              elevation: 0.2
                          ),
                        ),
                      ),
                    ),
                    ],
                  )),
                  SizedBox(height: 20,),
		              //displays the user's gallery
                  ContainerCard(
                      child: Container(
                    padding: EdgeInsets.all(1),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                      childAspectRatio: 0.9,
                      children: [
			                  //displays the user's posted selfies with corresponding count
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProfileSelfies())
                          );
                          }, child: Container(
                          child: Column(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 8,),
                            Text('Selfies(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        ),
                        ),
			                  //displays the user's posted posts with corresponding count
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProfilePosts())
                          );
                        }, child: Container(
                          child: Column(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 8,),
                            Text('Posts(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        ),
                        ),
			                  //displays the user's posted memes with corresponding count
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProfileMemes())
                          );
                        }, child: Container( child: Column(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 8,),
                            Text('Memes(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        ),
                        ),
                        //displays the user's posted svlogs with corresponding count
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProfileSVlogs())
                          );
                        }, child: Container( child: Column(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 8,),
                            Text('SVlogs(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        ),
                        ),
			                  //displays the Selfies, Posts, Memes & SVlogs the user has been tagged with, with corresponding count
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              ProfileTags())
                          );
                        }, child: Container( child: Column(
                          children: [
                            Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 8,),
                            Text('Tags(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
//not used currently
class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key,
    required this.text,
    this.tapped
  }) : super(key: key);

  VoidCallback? tapped;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: (){}, child: Text(text,
          style: TextStyle(
            fontSize: 18
          ),
        ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            primary: Colors.purple,
            elevation: 0.2
          ),
        ),
      ),
        );
  }
}
//highlights widgets layout
class HighLights extends StatelessWidget {
  const HighLights({Key? key, required this.text, required this.image})
      : super(key: key);

  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.4),
            radius: 40,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(image),
              ),
            ),
          ), SizedBox(height: 5,),
          Text(text)
        ],
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 4,
                color: Colors.grey.withOpacity(0.3))
          ]),
    );
  }
}
//dialog that allows users to change their family colour
Widget ChangeFamilyModal(BuildContext context) =>AlertDialog(
  backgroundColor: Colors.transparent,
  contentPadding: EdgeInsets.all(10),
  content: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      child:  Column(
          children: [
            //Container colour is dependent on the family colour the user is
            Container(
                padding: EdgeInsets.only(top: 30, right: 20,left: 20, bottom: 30 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple
                ),
                child: Center(
                  child: Text('Your current family is Family Purple.',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,),
                )
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Text('Choose your new Family Colour!',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 16),
                textAlign: TextAlign.center,),
            ),
            //Clicking on the red button changes the user's coloured profile container to red with opacity 0.7
            //It also changes the colour of the coloured profile buttons to red
            //All hashtags related to the items posted by the user will also be red
            ElevatedButton(onPressed: (){},
              child: Text('Family Red', style: TextStyle(color: Colors.red,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.red, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the green button changes the user's coloured profile container to green with opacity 0.7
            //It also changes the colour of the coloured profile buttons to green
            //All hashtags related to the items posted by the user will also be green
            ElevatedButton(onPressed: (){},
              child: Text('Family Green', style: TextStyle(color: Colors.green,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.green, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the blue button changes the user's coloured profile container to blue with opacity 0.7
            //It also changes the colour of the coloured profile buttons to blue
            //All hashtags related to the items posted by the user will also be blue
            ElevatedButton(onPressed: (){},
              child: Text('Family Blue', style: TextStyle(color: Colors.blue,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.blue, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the black button changes the user's coloured profile container to black with opacity 0.7
            //It also changes the colour of the coloured profile buttons to black
            //All hashtags related to the items posted by the user will also be black
            ElevatedButton(onPressed: (){},
              child: Text('Family Black', style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.black, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the pink button changes the user's coloured profile container to pink with opacity 0.7
            //It also changes the colour of the coloured profile buttons to pink
            //All hashtags related to the items posted by the user will also be pink
            ElevatedButton(onPressed: (){},
              child: Text('Family Pink', style: TextStyle(color: Colors.pink,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.pink, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the purple button changes the user's coloured profile container to purple with opacity 0.7
            //It also changes the colour of the coloured profile buttons to purple
            //All hashtags related to the items posted by the user will also be purple
            ElevatedButton(onPressed: (){},
              child: Text('Family Purple', style: TextStyle(color: Colors.purple,fontSize: 18, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 20,),
            //Clicking on the yellow button changes the user's coloured profile container to yellow with opacity 0.7
            //It also changes the colour of the coloured profile buttons to yellow
            //All hashtags related to the items posted by the user will also be yellow
            ElevatedButton(onPressed: (){},
              child: Text('Family Yellow', style: TextStyle(color: Colors.amber.shade700,fontSize: 18,
                  fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.amber.shade700, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
          ],
        ),
  ),
  actionsAlignment: MainAxisAlignment.center,
);

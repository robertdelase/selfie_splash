import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/profiles/profile_memes.dart';
import 'package:selphie_splash/screens/profiles/profile_mood.dart';
import 'package:selphie_splash/screens/profiles/profile_posts.dart';
import 'package:selphie_splash/screens/profiles/profile_svlogs.dart';
import 'package:selphie_splash/screens/profiles/profile_tags.dart';
import '../profiles/profile_selfies.dart';
import '../profiles/my_social_circle.dart';
import 'mutual_social_circle.dart';

class ProfileFriend extends StatelessWidget {
  const ProfileFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Alice Stark', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/selfie.jpg'),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 420,
                    margin: EdgeInsets.only(top: 40, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, left: 20, right: 20,),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: AssetImage('assets/selfie.jpg'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Alice Stark🇺🇸', style: kOnboardTextSmall.copyWith(fontSize:22, fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Just a simple humble girl :) :)',
                              overflow: TextOverflow.ellipsis, maxLines: 3,
                              textAlign: TextAlign.center, style: kOnboardTextSmall.copyWith(fontSize: 16, wordSpacing: 0.2),),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.cake, color: Colors.white,),
                                  Text('11/06/1995 ', style: kOnboardTextSmall.copyWith(fontSize: 15),)
                                ],
                              ), SizedBox(width: 5,),
                              Container(
                                width: 1,
                                height: 28,
                                color: Colors.white,
                              ),SizedBox(width: 5,),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.white,),
                                  Text('Bestie', style: kOnboardTextSmall.copyWith(fontSize: 15),)
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ContainerCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HighLights(
                          text: 'Moments',
                          image: 'assets/welcome.png',
                        ),
                        /*
                        *HighLights(
                          text: 'Shops(23)',
                          image: 'assets/welcome.png',
                        ),
                        HighLights(
                          text: 'Pages(1)',
                          image: 'assets/welcome.png',
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ContainerCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Mood: ', style: kSimpleBasicText.copyWith(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold),),
                              Image.asset('assets/m1.png', width: 40, height: 40,),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                ProfileMood())
                            );
                          }, child: Row(
                            children: [
                              Text(
                                '(25)',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: Colors.grey,
                              )
                            ],
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Not stopping still I get to the top.', style: kSimpleBasicText,overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                      SizedBox(height: 10,),
                      Text('#growth #billionaire', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue,
                      fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  ContainerCard(
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){}, child: Text('Message Me',
                            style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                primary: Colors.blue,
                                elevation: 0.2
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){showDialog(context: context, builder: ChangeStatusModal);},
                            child: Text('Change Status',
                            style: TextStyle(fontSize: 18),),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                primary: Colors.blue,
                                elevation: 0.2
                            ),
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return MutualSocialCircle();
                            }));
                          }, child: Text('Social Circle (500K followers)',
                          style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              primary: Colors.blue,
                              elevation: 0.2
                          ),
                        ),
                      ),
                    )
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
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

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.text
  }) : super(key: key);

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
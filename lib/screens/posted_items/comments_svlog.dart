import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/screens/posted_items/reacts.dart';
import '../main_activity/home_page.dart';
import '../main_activity/profile_page.dart';
import 'package:selphie_splash/constants.dart';
import '../posted_items/tags.dart';
import '../profiles/profile_friend.dart';
import 'comments_selfie.dart';

class CommentsSVlog extends StatelessWidget {
  const CommentsSVlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.5,
        titleSpacing: 0,
	//displays name of poster with corresponding item (SVlog)
        title: Text('Alice Stark\'s sVlog', style: kOnboardTextBig.copyWith(color: Colors.black,
            fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Expanded(
          child: SingleChildScrollView(
                child: Column(
                  children: [
		    //displays uploaded content being commented on
                    CommentSVlogItem(),
		    //displays comments under content
                    Comment(),
                    Comment(),
                    Comment(),
                  ],
                ),
          ),
        )
      ),

      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical:10),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Colors.grey))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
	      //for inputing and posting comment
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Add comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 1, color: Colors.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10)
                  ),
                ),
              ),
	      //for adding emoji react to comment
              IconButton(onPressed: (){ showDialog(context: context, builder: CommentMoodModal);},
                  icon: Icon(Icons.mood, color: Colors.grey, size: 32)),
	      //for sending/posting comment when ready
              IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.grey, size: 32)),
            ],
          ),
        ),
      )
    );
  }
}

//comment layout
class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5),
        child: ContainerCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
		   //for displaying commenter's profile pic. Onclick navigates to poster's profile
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProfileFriend();
                      }));
                    },
                    child: CircleAvatar(radius: 25,backgroundImage: AssetImage('assets/selfie1.jpeg')),
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
		      //for displaying commenter's name with country flag. Onclick navigates to poster's profile
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProfileFriend();
                          }));
                        },
                        child: Text('Mari Flake🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
		      //comment text
                      Text('Smile :)', overflow: TextOverflow.ellipsis, maxLines: 4,)
                    ],
                  )
                ],
              ),
	      //comment emoji react located far right of comment
              Image.asset('assets/m1.png', width: 50, height: 50,),

            ],
          ),),),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
	    //comment time posted
            Text('1h', textAlign: TextAlign.center,),
            Row(
              children: [
		//allows user to react to a comment onclick
                GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: ReactionModal);
                    },
                    child: Icon(Icons.favorite, color: Colors.grey, size: 30,)),
                SizedBox(width: 10,),
		//react count
                Text('3'),
                SizedBox(width: 10,),
		//allows users to view reacts on the comment
                GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Reacts();
                        }));
                      },
                      child: Container(
                          child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        children: [
			  //leading react icon
                          Icon(Icons.favorite, color: Colors.red, size: 30,),
			  //second leading react icon
                          Positioned (left:12, top: 5,  child: Icon(Icons.favorite, color: Colors.blue, size: 30,),),
			  //third leading react icon
                          Positioned(left:25, top: 9,  child: Icon(Icons.favorite, color: Colors.green, size: 30,),),
                        ],
                      ))),
              ],
            ),
	    //allows users to reply to a comment onclick
            Text('Reply', textAlign: TextAlign.center,),

          ],
        ),
        SizedBox(height: 20,),
	//allows users to view all replies to a comment onclick
        Text('View all replies', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
	      //displays profile pic of replier
              CircleAvatar(radius: 18,backgroundImage: AssetImage('assets/selfie.jpg')),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
		  //displays name of replier with country flag
                  Text('Emily Lina🇳🇮',overflow: TextOverflow.ellipsis, maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
		  //displays first line of reply under a comment
                  Text('I have a thought on this though.',overflow: TextOverflow.ellipsis, maxLines: 1,
                    style: TextStyle(fontSize: 12),)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
//comment design layout
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


//widgets for uploaded content being commented on
class CommentSVlogItem extends StatelessWidget {
  const CommentSVlogItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:10),
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
			  //displays poster's profile pic. Onclick navigates to poster's profile
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProfilePage();
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
			      //displays poster's name with country flag. Onclick navigates to poster's profile
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ProfilePage();
                                  }));
                                },
                                child: Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.bold, fontSize: 16),),
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
		      //displays popup menu onclick
                      FocusedMenuHolder(
                        menuWidth: MediaQuery.of(context).size.width * 0.6,
                        menuOffset: 10,
                        menuItemExtent: 50,
                        blurSize: 0,
                        menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                        menuItems: [

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
			  //displays location of user
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, size: 18, color: Colors.blueGrey,),
                              Text(' Tema, Ghana', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),)
                            ],
                          ),
                          SizedBox(height: 10,),
			  //displays caption of content
                          Text("Where users tap to switch between tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                              fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 4,),
                          SizedBox(height: 10,),
			  //displays hashtags on content
                          Text('#hashtags #hashtags #hashtags', style: TextStyle(fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic, fontSize: 16, color: Colors.green),
                            overflow: TextOverflow.ellipsis, maxLines: 2,),
                        ],
                      )
                  ),),
                SizedBox(height: 10,),
                //displays video of svlog uploaded
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
		      //play button image for svlog
                      Positioned(
                          child: Image.asset('assets/splash_svlog.png', scale: 1.4)
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
		      //for viewing number of views, with corresponding count
                      Pallets(icon: Icons.remove_red_eye, text: '333K',),
			  //shows comment icon and count
                          Pallets(icon: Icons.comment, text: '43',),
			  //navigates user to content's tag list, with corresponding count
                          Pallets(icon: Icons.account_circle_rounded, text: '10', tapped: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Tags();
                            }));
                          },),
			  //allows user to share content, with corresponding count
                          Pallets(icon: Icons.share, text: '4',),
                    ],
                  ),
                ),

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
          Icon(icon, size: 35, color: Colors.grey.shade600,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 18),)
        ],
      ),
    );
  }
}

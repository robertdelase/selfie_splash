import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import '../profile/profile_page.dart';
import 'package:selphie_splash/constants.dart';
import '../tags.dart';
class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87,)),
        title: Text('Alice Stark\'s selfie', style: kOnboardTextSmall.copyWith(color: Colors.black87),),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PostItem(),
              Comment(),
              Comment(),
              Comment(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: ContainerCard(
        child: Row(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Add comment'
              ),
            ),
            // IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions)),
            // IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions)),
          ],
        ),
      ),
    );
  }
}


class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        ContainerCard(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Mari Flake',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Smile :)'
                    )
                  ],
                )
              ],
            ),
            Text('😊', style: TextStyle(fontSize: 30),)

          ],
        )),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('1 h'),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: ReactionModal);
                    },
                    child: Icon(Icons.favorite)),
                Text('3'),
                Icon(Icons.favorite, color: Colors.redAccent,)
              ],
            ),
            Text('Reply')
          ],
        ),
        SizedBox(height: 20,),
        Text('View all replies'),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CircleAvatar(radius: 20,),
              SizedBox(width: 20,),
              Text('Amie stone I have a tought on this though', style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ],
    );
  }
}


//widgets
class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5,),
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
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProfilePage();
                            }));
                          },
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                            SizedBox(height: 8,),
                            Text('Post😂 . 20m . Happy🤗 '),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert, size: 25,),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                    fontSize: 16),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                    Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                    Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                  ],
                ),
                SizedBox(height: 20,),
                //Image
                Image.asset('assets/welcome.png'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Pallets(icon: Icons.favorite_border, text: '1k',),
                          Pallets(icon: Icons.message_outlined, text: '43',),
                          Pallets(icon: Icons.account_circle_rounded, text: '10', tapped: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Tags();
                            }));
                          },),
                          Pallets(icon: Icons.share, text: '4',),
                        ],
                      )
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
            margin: EdgeInsets.only(left: 5, right: 5,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 8,),
                              Text('Selfie😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  //Image
                  Image.asset('assets/welcome.png',)
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
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 65,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '2k',),
                    Pallets(icon: Icons.message_outlined, text: '43',),
                    Pallets(icon: Icons.account_circle_rounded, text: '26',),
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
            margin: EdgeInsets.only(left: 5, right: 5,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 8,),
                              Text('Meme😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  //Image
                  Image.asset('assets/welcome.png',)
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
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 65,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '1k',),
                    Pallets(icon: Icons.message_outlined, text: '43',),
                    Pallets(icon: Icons.account_circle_rounded, text: '26',),
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

class Svlog extends StatelessWidget {
  const Svlog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        height: 600,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage('assets/welcome.png'),),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Alice Stark 🇺🇸'),
                                  SizedBox(height: 10,),
                                  Text('Svlog . 20m . Happy🤗 '),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_vert, size: 25,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black, fontSize: 12),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' #tags',),
                          Text(' #tags'),
                          Text(' #tags')
                        ],
                      ),
                      SizedBox(height: 20,),
                      //Image
                      Image.asset('assets/welcome.png',)
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
              top: 535,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                height: 65,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pallets(icon: Icons.remove_red_eye, text: '1k',),
                        Pallets(icon: Icons.message_outlined, text: '43',),
                        Pallets(icon: Icons.account_circle_rounded, text: '26',),
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
        ),
      ),
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
          Icon(icon, size: 30, color: Colors.grey.shade600,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 20),)
        ],
      ),
    );
  }
}

Widget ReactionModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.white,
  content: ContainerCard(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height:400,
      child: GridView.count(crossAxisCount: 3,
        children: [
         Icon(Icons.favorite, color: Colors.redAccent,),
         Icon(Icons.favorite, color: Colors.redAccent,),
         Icon(Icons.favorite, color: Colors.redAccent,)
        ],
      ),
    ),
  ),
  actionsAlignment: MainAxisAlignment.center,
);
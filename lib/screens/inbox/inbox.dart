import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,
          color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 30, color: Colors.black,))
        ],
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('My Inbox', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.24,

              child:Column(
                children: [
                  SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        Text('Favourites', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        SizedBox(width: 3,),
                        Icon(Icons.favorite, color: Colors.red,),
                      ]
                  ),
                  SizedBox(height: 5,),
                  Container(
                      width: double.infinity,
                      height: size.height * 0.2 * 0.85,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                            UserProfiles(),
                          ],
                        ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ]
            ),
            SizedBox(height: 3,),
            //Messages
            Container(
              padding: EdgeInsets.only(bottom: 15),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),
                      InboxItem(),

                    ],
                  ),

                )

          ],
        ),),

    );

  }
}

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                spreadRadius: 3,
                color: Colors.grey.withOpacity(0.3))
          ]),
    );
  }
}

class InboxItem extends StatelessWidget {
  const InboxItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: ContainerCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/welcome.png'),),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alice Stark 🇬🇭', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis, maxLines: 1,),
                  SizedBox(height: 5,),
                  Text('How are you doing?', style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis, maxLines: 1,),
                ],
              )
            ],),
            SizedBox(height: 10,),
            Divider(height: 1,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('10 munites ago'),
                Row(
                  children: [
                    SizedBox(width: 1, height: 20, child: Container(color:Colors.black26),),
                    SizedBox(width: 10,),
                    Text('1 ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                  ],
                )

              ],
            ),
          ],
        )
      )
    );
  }
}

class UserProfiles extends StatelessWidget {
  const UserProfiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4, left: 4, top: 8, bottom: 15),
      child: ContainerCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/welcome.png'),),
                Container(height: 60,child: Text('🇬🇭', style: TextStyle(fontSize: 15))),
              ],
            ),
            SizedBox(height:8,),
            Text('Ama Obeng', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, maxLines: 1,)
          ],
        ),
      )
    );
  }
}

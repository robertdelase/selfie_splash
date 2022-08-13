import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/challenges/challengeUsers.dart';
import 'challengeUsersGlobal.dart';
import 'addChallenge.dart';

class GlobalChallenge extends StatelessWidget {
  const GlobalChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = ['🇺🇸', '🇦🇫', '🇦🇽', '🇨🇩', '🇬🇬', '🇬🇭', '🇳🇬', '🇳🇮'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
        title: Text('View Global', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black,))
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                children: [
                  // TextButton(onPressed: (){
                  //   FirebaseAuth.instance.signOut();
                  // }, child: Text('Log Out')),
                  SizedBox(height: 20,),
                  Center(child: Text('View, Join and Enjoy fun challenges in the SelfieSplash world!',
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, wordSpacing: 0.5),)),
                  SizedBox(height: 10,),
                  Image.asset('assets/global.png', scale: 2,),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height*1.5,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        crossAxisCount: 2,
                      ),

                      itemBuilder: (BuildContext context, index){
                        return Stories(title: items[index]);
                      },
                      itemCount: items.length,
                    ),
                  )
                ],
              ),
            ),
          )
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
            ChallengeUsersGlobal(
              name: 'Name🇺🇸',
              desc: 'Take a selfie with your fav mask',
              tags: '#challengefiesta',
              image: '',
            )
        ));
      },
      child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.grey.withOpacity(0.2)
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
                      Text('Mask Up Challenge', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                      Text('Take a selfie with your fav mask', overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(color: Colors.white, fontSize: 12),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('24K', style: TextStyle(color: Colors.white, fontSize: 12),),
                          SizedBox(width: 3,),
                          Icon(Icons.group, color: Colors.white, size: 18,),
                          SizedBox(width: 3,),
                          Text('.', style: TextStyle(color: Colors.white, fontSize: 12), ),
                          SizedBox(width: 3,),
                          Text('2h', style: TextStyle(color: Colors.white, fontSize: 12),),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0), bottomRight:Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),

                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                    child: Column(
                      children: [
                        Text(title, style: TextStyle(fontSize: 20),),
                        Icon(Icons.star, color: Colors.amberAccent, size: 25,),
                      ],
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}

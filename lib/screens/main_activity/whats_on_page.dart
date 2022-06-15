import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import '../challenges/challengeUsers.dart';
import '../challenges/addChallenge.dart';
import '../challenges/globalChallenge.dart';

class WhatsOnPage extends StatelessWidget {
  const WhatsOnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = [1, 2, 3, 4, 5, 6, 7, 8];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('What\'s On', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.w600),),
        actions: [
          Image.asset('assets/search1.png', width: 35, height: 35,)
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
        bottom: false,
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                children: [
                  // TextButton(onPressed: (){
                  //   FirebaseAuth.instance.signOut();
                  // }, child: Text('Log Out')),
                  SizedBox(height: 20,),
                  Center(child: Text('Enjoy and participate in fun challenges and campaigns in Ghana! 🇬🇭',
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, wordSpacing: 0.5),)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return AddChallenge();
                        }));
                      }, child: Text('Create New', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20)
                        ),

                      ),SizedBox(width: 15,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return GlobalChallenge();
                        }));
                      }, child: Text('View Global', style: TextStyle(fontSize: 20, color: Colors.blue),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
                            side: BorderSide(color: Colors.blue, width: 2),
                            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20)

                        ),

                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height*1.4,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 2,
                          crossAxisCount: 2,
                          crossAxisSpacing: 2
                        ),

                        itemBuilder: (BuildContext context, index){
                      return Stories();
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
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            ChallengeUsers(
              name: 'Name',
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

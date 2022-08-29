import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

class ChallengeUsersGlobal extends StatelessWidget {
   ChallengeUsersGlobal({Key? key,
     required this.name,
     required this.desc,
     required this.tags,
     this.image,
     this.participantsNo,
     this.time
   }) : super(key: key);
  final String name, desc, tags;
  int? participantsNo, time;
  String? image;


  @override
  Widget build(BuildContext context) {
    final List items = [1, 2, 3, 4,5,6];
    final List flags1 = ['🇺🇸', '🇦🇫', '🇦🇽', '🇨🇩', '🇬🇬', '🇬🇭', '🇳🇬', '🇳🇮'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
          titleSpacing: 0,
          title: Text(name, style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.black,),),
          ],
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(radius: 65,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name, style:  TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),),
                        Icon(Icons.star, color: Colors.yellow,)
                      ],
                    ),
                    Text(desc, style: TextStyle(
                      fontSize: 17,
                    ),),
                    Text(tags, style: TextStyle(
                      fontSize: 17,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('$participantsNo participating',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text('Started by Robbie $time hours ago',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 3,
                    childAspectRatio: 0.8
                  ),

                  itemBuilder: (BuildContext context, index){
                    if(index+1 > 3){
                      return PeopleCardNoStar(flags: flags1[index]);
                    }else{
                      return PeopleCard(flags: flags1[index]);
                    }
                  },
                  itemCount: items.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class PeopleCard extends StatelessWidget {
  PeopleCard({
    Key? key,
    required this.flags,
  }) : super(key: key);
  final String flags;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Alice Stark', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                    fontSize: 12),),
                    Text(' . ', style: TextStyle(color: Colors.white, fontSize: 12), ),
                    Text('2h', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12),)
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
              top: 5,
              right: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Column (children: [
                  Text(flags, style: TextStyle(fontSize: 16),),
                  Icon(Icons.star, size: 20, color: Colors.amberAccent,),
                ],)
              ),
            ),
          ],
        )
    );
  }
}

class PeopleCardNoStar extends StatelessWidget {
  PeopleCardNoStar({
    Key? key,
    required this.flags,
  }) : super(key: key);
  final String flags;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Alice Stark', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                        fontSize: 12),),
                    Text(' . ', style: TextStyle(color: Colors.white, fontSize: 12), ),
                    Text('2h', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12),)
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
              top: 5,
              right: 5,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Column (children: [
                    Text(flags, style: TextStyle(fontSize: 16),),
                  ],)
              ),
            ),
          ],
        )
    );
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/profile/profile_page.dart';

class Challenge extends StatelessWidget {
   Challenge({Key? key,
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87,),),
          title: Text(name, style: kOnboardTextBig.copyWith(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w600),),
          actions: [
            IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.add, color: Colors.black87,),),
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
                      fontStyle: FontStyle.italic
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
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount: 3,
                    mainAxisExtent: 200
                  ),

                  itemBuilder: (BuildContext context, index){
                    if(index+1 > 3){
                      return PeopleCardNoStar();
                    }else{
                      return PeopleCard();
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
  const PeopleCard({
    Key? key,
  }) : super(key: key);

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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                height: 27,
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Alice Stark', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Text('2h', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),)
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
              top: 1,
              left: 90,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Icon(Icons.star, color: Colors.yellow,)

              ),
            ),
          ],
        )
    );
  }
}

class PeopleCardNoStar extends StatelessWidget {
  const PeopleCardNoStar({
    Key? key,
  }) : super(key: key);

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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                height: 27,
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Alice Stark', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Text('2h', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),)
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

          ],
        )
    );
  }
}


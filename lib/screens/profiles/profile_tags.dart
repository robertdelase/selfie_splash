import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../components/popContext.dart';


class ProfileTags extends StatelessWidget {
  ProfileTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Tags', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        leading: PopContext(),
      ),
	    //layout for Tags section of user's profile gallery
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ), itemBuilder: (context, index){
          return Container(
            child: Image.asset('assets/selfie1.jpeg', fit: BoxFit.cover),
          );
        }, itemCount: 30,
        ),
      ),
    );
  }
}

//layout of single image item in an uploaded content in gallery (Selfies, Posts & Memes)
class ItemSingle extends StatelessWidget {
  ItemSingle({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover),

          ),
      );
  }
}

//layout of single uploaded video content for Posts & Memes in gallery
class ItemVideo extends StatelessWidget {
  ItemVideo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover),

          ),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white, size: 18,),
                      ],
                    )
                ),
              )
            ],
          )
      );
  }
}

//layout of multiple image/video in a single uploaded content in gallery (Posts & Memes)
class ItemCollage extends StatelessWidget {
  ItemCollage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover),

          ),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.collections, color: Colors.white, size: 18,),
                      ],
                    )
                ),
              )
            ],
          )
      );
  }
}

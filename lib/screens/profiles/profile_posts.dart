import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../components/popContext.dart';


class ProfilePosts extends StatelessWidget {
  ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Posts', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        leading: PopContext(),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ), itemBuilder: (BuildContext context, index){
          return ItemVideo();
        }, itemCount: 30,),
      ),
    );
  }
}

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




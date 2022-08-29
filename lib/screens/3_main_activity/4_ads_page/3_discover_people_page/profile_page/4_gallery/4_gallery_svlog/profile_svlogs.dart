import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../../../../../components/popContext.dart';


class ProfileSVlogs extends StatelessWidget {
  ProfileSVlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('SVlogs', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        leading: PopContext(),
      ),
	    //layout for SVlogs section of user's profile gallery
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.8
        ), itemBuilder: (BuildContext context, index){
          return ItemSVlog();
        }, itemCount: 30,),
      ),
    );
  }
}
//layout of svlog items in gallery
class ItemSVlog extends StatelessWidget {
  ItemSVlog({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), fit: BoxFit.cover),
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
                right: 5,
                bottom: 5,
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white, size: 18,),
                        Text('20:32', style: TextStyle(fontSize: 14, color: Colors.white),),
                      ],
                    )
                ),
              )
            ],
          )
      );
  }
}

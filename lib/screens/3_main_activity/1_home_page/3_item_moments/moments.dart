import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';

class Moments extends StatelessWidget {
  const Moments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
	      //background image/video of Moment/story item
              image: DecorationImage(image: AssetImage('assets/selfie1.jpeg'), ),
              color: Colors.black,
            ),
            child: Stack(
              children: [
		//Moments item count represented with dashes
                Positioned(
                    top: 5,
                    left: 0,
                    right: 0,
                    child: DotWidget(
                      dashColor: Colors.white,
                    dashHeight:2,
                    totalWidth: MediaQuery.of(context).size.width,
                    dashWidth: 50) ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(
                              children: [
				//displays profile pic of poster
                                CircleAvatar(radius: 22,backgroundImage: AssetImage('assets/selfie1.jpeg')),
                                SizedBox(width: 5,),
				//displays name of poster withtheir corresponding country
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment:  CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mari Flake🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, ),
                                        ),
					//time posted
                                        Text('20m', style: TextStyle(fontSize: 12, color: Colors.white),)
                                      ],
                                    ))

                              ],
                            ),),
			    //emoji react selected by poster
                            Image.asset('assets/m10.png', width: 40, height: 40,),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),

                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
			  //caption for Moments
                          Text('Strive for happiness every day!!!', overflow: TextOverflow.ellipsis, maxLines: 2,
                            style: TextStyle(fontSize: 15,color: Colors.white,),),
                          SizedBox(height: 5,),
			  //hashtags for Moments
                          Text('#happiness #unbothered', overflow: TextOverflow.ellipsis, maxLines: 1,
                            style: TextStyle(fontSize: 15, color: Colors.blue, fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,),),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
			      //Moments indicator
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Moments',
                                    style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
                                  Image.asset('assets/indicator_moments.png', width: 25, height: 25,),
                                ],
                              ),
                              Row(
                                children: [
				  //allows users to comment on Moments item
                                  Icon(Icons.comment, color: Colors.white, size: 30,),
                                  SizedBox(width: 20,),
				  //displays popup menu onclick
                                  FocusedMenuHolder(
                                    menuWidth: MediaQuery.of(context).size.width * 0.6,
                                    menuOffset: 10,
                                    menuItemExtent: 50,
                                    blurSize: 0,
                                    menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                                    menuItems: [

                                      FocusedMenuItem(title:Text('Mute', style: TextStyle(fontSize: 14),), onPressed:(){}),
                                      FocusedMenuItem(title: Text('Share to...', style: TextStyle(fontSize: 14),), onPressed:(){}),

                                    ],
                                    blurBackgroundColor: Colors.black54,
                                    openWithTap: true,
                                    onPressed: (){},

                                    child: Icon(Icons.more_vert, color: Colors.white, size: 30,),


                                  ),
                                  SizedBox(width: 10,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
//dots/dashes to indicaate Moments item count
class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
            (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}

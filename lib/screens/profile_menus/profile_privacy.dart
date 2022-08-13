import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../main_activity/home_page.dart';
import '../main_activity/profile_page.dart';
import 'package:selphie_splash/constants.dart';

class ProfilePrivacy extends StatelessWidget {
  const ProfilePrivacy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('Privacy', style: kOnboardTextSmall.copyWith(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Title(text: 'Interactions',),
            Item(text: 'Moments',),
            Item(text: 'Comments',),
            Item(text: 'Tags',),
            Item(text: 'Mentions',),
            Item(text: 'Activity Status',),
            Item(text: 'Birthday',),
            SizedBox(height: 25,),
            Title(text: 'Connections',),
            Item1(text: 'Account Privacy',),
            Item(text: 'Blocked Accounts',),
            Item(text: 'Muted Accounts',),
            Item(text: 'Social Circle (10K followers)',),
            Item(text: 'Accounts You Follow',),
            SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child:Container(
        decoration: BoxDecoration(
        ),
        child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.start,),
              ],
            )
        ),

      ),

    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    Text(text, style: TextStyle(color: Colors.black, fontSize: 16),),
                    SizedBox(height: 25,),
                    Container(color: Colors.blue, width: double.infinity,height: 0.5,),
                  ],
                )
              ),
    );
  }
}


class Item1 extends StatelessWidget {
  Item1({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child:Container(
          decoration: BoxDecoration(
          ),
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text, style: TextStyle(color: Colors.black, fontSize: 16),),
                      ToggleSwitch(
                        cornerRadius: 20,
                        activeBgColor: [Colors.blue],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: ['Private', 'Public'],
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      )
                  ],
                  ),
                  SizedBox(height: 20,),
                  Container(color: Colors.blue, width: double.infinity,height: 0.5,),
                ]
            ),

          ),

        ));
  }
  }


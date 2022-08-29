import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:selphie_splash/constants.dart';

class ProfileNotifications extends StatelessWidget {
  const ProfileNotifications({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('Notifications', style: kOnboardTextSmall.copyWith(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Title(text: 'App Notifications',),
            Item1(text: 'Pause All',),
            Item(text: 'Items Posted, Moments and Comments',),
            Item(text: 'Following and Followers',),
            Item(text: 'Messages',),
            Item(text: 'From SelfieSplash',),
            SizedBox(height: 25,),
            Title(text: 'Others',),
            Item(text: 'Email and SMS',),
            SizedBox(height: 50,),


          ],
        ),
      ),
    );
  }
}

class Switch extends StatefulWidget {
  const Switch({Key? key}) : super(key: key);

  @override
  State<Switch> createState() => _SwitchState();
}

class _SwitchState extends State<Switch> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
                      activeBgColors: [
                        [Colors.green[600]!],
                        [Colors.red[600]!]],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['On', 'Off'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
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


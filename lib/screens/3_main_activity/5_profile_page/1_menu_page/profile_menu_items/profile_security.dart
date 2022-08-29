import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

class ProfileSecurity extends StatelessWidget {
  const ProfileSecurity({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('Security', style: kOnboardTextSmall.copyWith(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Title(text:'Login Security',),
            Item(text: 'Password',),
            Item(text: 'Login Activity',),
            Item(text: 'Saved Login Info',),
            Item(text: 'Two-factor Authentication',),
            Item(text: 'Emails from SelfieSplash',),
            SizedBox(height: 25,),
            Title(text: 'Data and History',),
            Item(text: 'Access Data',),
            Item(text: 'Download Data',),
            Item(text: 'Apps and Websites',),
            Item(text: 'Search History',),
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
      child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.start,),
              ],
            )
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
        child:Container(
              decoration: BoxDecoration(
              ),
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

            ),

    );
  }
}



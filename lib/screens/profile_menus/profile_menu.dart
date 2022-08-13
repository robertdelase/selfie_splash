import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.5,
        titleSpacing: 0,
        title: Text('Profile Menu', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.75,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: [
                  //navigates user to the Account menu
                  ProfileMenuItem(icon: Icons.account_circle, text: 'Account', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_account');}),
                  //navigates user to the Notifications menu
                  ProfileMenuItem(icon: Icons.notifications, text: 'Notifications', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_notifications');}),
                  //navigates user to the Security menu
                  ProfileMenuItem(icon: Icons.security, text: 'Security', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_security');}),
                  //navigates user to the Privacy menu
                  ProfileMenuItem(icon: Icons.lock, text: 'Privacy', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_privacy');}),
                  //navigates user to the Ads menu
                  ProfileMenuItem(icon: Icons.campaign, text: 'Ads', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_ads');}),
                  //navigates user to the About menu
                  ProfileMenuItem(icon: Icons.info, text: 'About', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_about');}),
                  //navigates user to the Support menu
                  ProfileMenuItem(icon: Icons.support_agent, text: 'Support', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_support');}),
                  //opens the Log Out dialog onclick for users to either remain or exit the platform
                  ProfileMenuItem(icon: Icons.logout, text: 'Logout', color: Colors.blue, tapped: (){
                    showDialog(context: context, builder: createDialog);
                  },),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Image.asset('assets/onboard_logo1.png', scale: 2,),
                  SizedBox(height: 10,),
                  Text('SelfieSplash', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 30),),
                  SizedBox(height: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


//Logout alert dialog
Widget createDialog(BuildContext context) => AlertDialog(
  contentPadding: EdgeInsets.all(0),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
      ),
      height:250,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Splash an extra selfie or logout?', style: TextStyle(color: Colors.blue, fontSize: 22,
        fontWeight: FontWeight.w600),),
        Row(
          children: [
            Checkbox(value: false, onChanged: (value){}),
            Text('Remember my login info', )
          ],
        ),
        Row (mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child:ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('STAY', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),),
            SizedBox(width: 20,),
            Expanded(
                child:ElevatedButton(onPressed: (){FirebaseAuth.instance.signOut();}, child: Text('LOG OUT', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),),


        ],)
      ],
    )
  ),
  actionsAlignment: MainAxisAlignment.center,
);

//profile menu item widget layout
class ProfileMenuItem extends StatelessWidget {
   ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    this.color,
     this.tapped
  }) : super(key: key);

  final IconData icon;
  final String text;
  Color? color;
  VoidCallback? tapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.blue,
                width: 1.5
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.blue.withOpacity(0.1)
              )
            ]
        ),
        width: 50,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color != null ? color : Colors.blue,),
            SizedBox(height: 8,),
            Text(text, style: kLittleDarkGreyText.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 18),)
          ],
        ),
      ),
    );
  }
}

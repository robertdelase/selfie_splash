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
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Profile Menu', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: [
                  ProfileMenuItem(icon: Icons.account_circle, text: 'Account', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_account');}),
                  ProfileMenuItem(icon: Icons.notifications, text: 'Notifications', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_notifications');}),
                  ProfileMenuItem(icon: Icons.security, text: 'Security', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_security');}),
                  ProfileMenuItem(icon: Icons.lock, text: 'Privacy', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_privacy');}),
                  ProfileMenuItem(icon: Icons.campaign, text: 'Ads', color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'profile_ads');}),
                  ProfileMenuItem(icon: Icons.info, text: 'About', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_about');}),
                  ProfileMenuItem(icon: Icons.support_agent, text: 'Support', color: Colors.blue,tapped: (){Navigator.pushNamed(context, 'profile_support');}),
                  ProfileMenuItem(icon: Icons.logout, text: 'Logout', color: Colors.blue, tapped: (){
                    showDialog(context: context, builder: createDialog);
                  },),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Image.asset('assets/onboard_logo.png', scale: 2,),
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
  title: Text('Splash an extra selfie or logout?', style: TextStyle(color: Colors.blue, fontSize: 22),),
  content: Row(
    children: [
      Checkbox(value: false, onChanged: (value){}),
      Text('Remember my login info', )
    ],
  ),
  actions: [
    ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('STAY', style: TextStyle(fontSize: 20),),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    ElevatedButton(onPressed: (){FirebaseAuth.instance.signOut();}, child: Text('LOG OUT', style: TextStyle(fontSize: 20),),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  ],
  actionsAlignment: MainAxisAlignment.center,
  actionsPadding: EdgeInsets.only(bottom: 20),
);
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
        decoration: BoxDecoration(
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

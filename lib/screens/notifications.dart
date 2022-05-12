import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/profile_page.dart';
import '../components/flexibleCard.dart';
import 'package:focused_menu/focused_menu.dart';
class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.2,
        title: Text('My Notifications', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NotificationItem(
                text: 'Alice Stark, Su Lin \n and 25 others admired your selfie',
                icon: Icons.favorite,
                time: '10m',
                iconColor: Colors.red,
              ),
              NotificationItem(
                text: 'Alice Stark, Su Lin \n and 25 others admired your selfie',
                icon: Icons.message_outlined,
                time: '10m',
                iconColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.text,
    required this.time,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  final String text, time;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.7,
      menuOffset: 12,
      menuItemExtent: 60,
      blurSize: 0,
      menuItems: [

        FocusedMenuItem(title:Text('View', style: TextStyle(fontSize: 12),), onPressed:(){}),
        FocusedMenuItem(
            title: Text('Return', style: TextStyle(fontSize: 12),), onPressed:(){}),

      ],
      blurBackgroundColor: Colors.white,
      openWithTap: true,
      onPressed: (){},

      child: Container(
        margin: EdgeInsets.all(5),
        child: ContainerCard(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(text,
               maxLines: 2,
               ),
                SizedBox(height: 5,),
                Text(time, style: TextStyle(color: Colors.grey),)
              ],
            ),
            Icon(icon, size: 30, color: iconColor,),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, size: 30, color: Colors.black87,),)
          ],
        )),
      ),
    );
  }
}

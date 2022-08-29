import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../components/flexibleCard.dart';
import 'package:focused_menu/focused_menu.dart';



class AdsPreferred extends StatelessWidget {
  const AdsPreferred ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check,  size: 30, color: Colors.blue,))
        ],
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Select Preferred Ads', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              PreferredItem(
                icon: Icons.campaign,
                text: 'Advertising & Marketing',
                iconColor: Colors.black,
              ),
              PreferredItem(
                icon: Icons.camera_alt,
                text: 'Arts & Photography',
                iconColor: Colors.purple,
              ),
              PreferredItem(
                icon: Icons.spa,
                text: 'Beauty & Cosmetics',
                iconColor: Colors.pink,
              ),
              PreferredItem(
                icon: Icons.business,
                text: 'Business & Finance',
                iconColor: Colors.blueGrey,
              ),
              PreferredItem(
                icon: Icons.room_service,
                text: 'Catering',
                iconColor: Colors.orange,
              ),
              PreferredItem(
                icon: Icons.delivery_dining,
                text: 'Delivery & Logistics',
                iconColor: Colors.black,
              ),
              PreferredItem(
                icon: Icons.design_services,
                text: 'Design & Development',
                iconColor: Colors.blue,
              ),
              PreferredItem(
                icon: Icons.school,
                text: 'Education',
                iconColor: Colors.purple,
              ),
              PreferredItem(
                icon: Icons.engineering,
                text: 'Engineering & Construction',
                iconColor: Colors.green,
              ),
              PreferredItem(
                icon: Icons.movie,
                text: 'Entertainment',
                iconColor: Colors.red,
              ),
              PreferredItem(
                icon: Icons.event_note,
                text: 'Events & Social',
                iconColor: Colors.blue,
              ),
              PreferredItem(
                icon: Icons.content_cut,
                text: 'Fashion & Style',
                iconColor: Colors.pink,
              ),
              PreferredItem(
                icon: Icons.fastfood,
                text: 'Food & Drinks',
                iconColor: Colors.orange,
              ),
              PreferredItem(
                icon: Icons.sports_soccer,
                text: 'Games & Sports',
                iconColor: Colors.black,
              ),
              PreferredItem(
                icon: Icons.fitness_center,
                text: 'Health & Wellness',
                iconColor: Colors.green,
              ),
              PreferredItem(
                icon: Icons.home_work,
                text: 'Homes & Offices',
                iconColor: Colors.blueGrey,
              ),
              PreferredItem(
                icon: Icons.bed,
                text: 'Hospitality',
                iconColor: Colors.blue,
              ),
              PreferredItem(
                icon: Icons.person,
                text: 'Influencer',
                iconColor: Colors.pink,
              ),
              PreferredItem(
                icon: Icons.phonelink,
                text: 'Internet & Technology',
                iconColor: Colors.grey,
              ),
              PreferredItem(
                icon: Icons.phonelink_ring,
                text: 'Telecommunication',
                iconColor: Colors.red,
              ),
              PreferredItem(
                icon: Icons.directions_car,
                text: 'Transport & Luxury',
                iconColor: Colors.purple,
              ),
              PreferredItem(
                icon: Icons.local_airport,
                text: 'Travel & Tourism',
                iconColor: Colors.blue,
              ),
              SizedBox(height: 20,)
            ],
          ),
      ),
    );
  }
}

class PreferredItem extends StatelessWidget {
  const PreferredItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: iconColor,),
                    SizedBox(width: 3,),
                    Text(text, style: TextStyle(color: Colors.black,)),
                  ]
              ),
            ),
            ToggleSwitch(
              minWidth: 40,
              minHeight: 30,
              cornerRadius: 20,
              activeBgColor: [Colors.blue],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey.shade400,
              inactiveFgColor: Colors.white,
              initialLabelIndex: 0,
              totalSwitches: 2,
              icons: [Icons.check, Icons.close],
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            )
          ],

          )
        );
  }
}

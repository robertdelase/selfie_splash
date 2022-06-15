import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/ads/adsPreferred.dart';
import '../ads/adsCategory.dart';
import '../ads/adsPreferred.dart';
import '../ads/adsPages.dart';
import '../ads/adsShops.dart';
import '../ads/adsShopNow.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('Explore Ads', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          Image.asset('assets/search1.png', width: 35, height: 35,),
          SizedBox(width: 15,),
          GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'notifications');
              },
              child: Image.asset('assets/notifications.png', width: 35, height: 35,)),

          SizedBox(width: 15,),
          GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'discover');
              },
              child: Image.asset('assets/follow.png', width: 35, height: 35,)),
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
        bottom: false,
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                children: [
                  // TextButton(onPressed: (){
                  //   FirebaseAuth.instance.signOut();
                  // }, child: Text('Log Out')),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom:5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.3)
                      )
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsPages();
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/ic_pages.png', width: 30, height: 30,),
                                SizedBox(width: 5,),
                                Text('Pages', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            ),
                          ),

                          Container(
                            color: Colors.grey,
                            width: 0.5,
                            height: 38,
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsShops();
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/ic_shop_front.png', width: 30, height: 30,),
                                SizedBox(width: 5,),
                                Text('Shops', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            ),
                          ),

                          Container(
                            color: Colors.grey,
                            width: 0.5,
                            height: 38,
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsShopNow();
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/ic_shop_now.png', width: 30, height: 30,),
                                SizedBox(width: 5,),
                                Text('Shop Now!', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            ),
                          ),

                        ],
                      ),
                  ),
                  SizedBox(height: 15,),

                  Container(
                    child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AdsPreferred();
                              }));
                            }, child:  Text('My Preferred Ads', style: TextStyle(color: Colors.blue, fontSize: 14)),
                          ),
                        ),
                        SizedBox(width: 5,),

                        Container(
                          color: Colors.grey,
                          width: 0.5,
                          height: 40,
                        ),

                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AdsCategory(title: 'Advertising & Marketing');
                              }));
                            }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.campaign, color: Colors.black,),
                                SizedBox(width: 3,),
                                Text('Advertising & Marketing', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AdsCategory(title: 'Arts & Photography');
                              }));
                            }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt, color: Colors.purple,),
                                SizedBox(width: 3,),
                                Text('Arts & Photography', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AdsCategory(title: 'Beauty & Cosmetics');
                              }));
                            }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.spa, color: Colors.pink,),
                                SizedBox(width: 3,),
                                Text('Beauty & Cosmetics', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all( 5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Business & Finance');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.business, color: Colors.blueGrey,),
                                SizedBox(width: 3,),
                                Text('Business & Finance', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Catering');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.room_service, color: Colors.orange,),
                                SizedBox(width: 3,),
                                Text('Catering', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Delivery & Logistics');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.delivery_dining, color: Colors.black,),
                                SizedBox(width: 3,),
                                Text('Delivery & Logistics', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container( decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Design & Development');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.design_services, color: Colors.blue,),
                                SizedBox(width: 3,),
                                Text('Design & Development', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Education');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.school, color: Colors.purple,),
                                SizedBox(width: 3,),
                                Text('Education', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Engineering & Construction');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.engineering, color: Colors.green,),
                                SizedBox(width: 3,),
                                Text('Engineering & Construction', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Entertainment');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.movie, color: Colors.red,),
                                SizedBox(width: 3,),
                                Text('Entertainment', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Events & Social');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.event_note, color: Colors.blue,),
                                SizedBox(width: 3,),
                                Text('Events & Social', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Fashion & Style');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.content_cut, color: Colors.pink,),
                                SizedBox(width: 3,),
                                Text('Fashion & Style', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Food & Drinks');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fastfood, color: Colors.orange,),
                                SizedBox(width: 3,),
                                Text('Food & Drinks', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Games & Sports');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sports_soccer, color: Colors.black,),
                                SizedBox(width: 3,),
                                Text('Games & Sports', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Health & Wellness');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fitness_center, color: Colors.green,),
                                SizedBox(width: 5,),
                                Text('Health & Wellness', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Homes & Offices');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_work, color: Colors.blueGrey,),
                                SizedBox(width: 3,),
                                Text('Homes & Offices', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Hospitality');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bed, color: Colors.blue,),
                                SizedBox(width: 3,),
                                Text('Hospitality', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Influencer');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person, color: Colors.pink,),
                                SizedBox(width: 3,),
                                Text('Influencer', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Internet & Technology');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.phonelink, color: Colors.grey,),
                                SizedBox(width: 3,),
                                Text('Internet & Technology', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Telecommunication');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.phonelink_ring, color: Colors.red,),
                                SizedBox(width: 3,),
                                Text('Telecommunication', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Transport & Luxury');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.directions_car, color: Colors.purple,),
                                SizedBox(width: 3,),
                                Text('Transport & Luxury', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AdsCategory(title: 'Travel & Tourism');
                                }));
                              }, child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_airport, color: Colors.blue,),
                                SizedBox(width: 3,),
                                Text('Travel & Tourism', style: TextStyle(color: Colors.black, fontSize: 14)),
                              ]
                          ),
                          ),
                        ),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ) ,
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 1,
                        crossAxisCount: 4,
                        crossAxisSpacing: 1,
                      ),

                      itemBuilder: (BuildContext context, index){
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/adverts.jpg'), fit: BoxFit.cover)
                          ),
                        );
                      },
                      itemCount: 22,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class TopTab extends StatelessWidget {
  const TopTab({
    Key? key,
    required this.text,
    required this.icon
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
          Icon(icon, size: 25,),
          Text(text, style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/7_preferred_ads/adsPreferred.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '4_adverts_pages/adsPages.dart';
import '5_adverts_shops/adsShops.dart';
import '6_adverts_shop_now/adsShopNow.dart';
import '8_category_ads/adsCategory.dart';
import 'package:carousel_slider/carousel_slider.dart';



class AdsPage extends StatefulWidget {
  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                 AdCarousel(),
                  SizedBox(height: 15,),
                  Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 15),),
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
                            color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                              BoxShadow(
                              offset: Offset(1,2),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.blue.withOpacity(0.1)
                        )
                      ]
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
                        CategoryAdTitle(icon: Icons.campaign, text: 'Advertising & Marketing',
                            color: Colors.black, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.camera_alt, text: 'Arts & Photography',
                            color: Colors.purple, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.spa, text: 'Beauty & Cosmetics',
                            color: Colors.pink, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.business, text: 'Business & Finance',
                            color: Colors.blueGrey, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.room_service, text: 'Catering',
                            color: Colors.orange, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.delivery_dining, text: 'Delivery & Logistics',
                            color: Colors.black, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.design_services, text: 'Design & Development',
                            color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.school, text: 'Education',
                            color: Colors.purple, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.engineering, text: 'Engineering & Construction',
                            color: Colors.green, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.movie, text: 'Entertainment',
                            color: Colors.red, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.event_note, text: 'Events & Social',
                            color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.content_cut, text: 'Fashion & Style',
                            color: Colors.pink, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.fastfood, text: 'Food & Drinks',
                            color: Colors.orange, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.sports_soccer, text: 'Games & Sports',
                            color: Colors.black, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.fitness_center, text: 'Health & Wellness',
                            color: Colors.green, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.home_work, text: 'Homes & Offices',
                            color: Colors.blueGrey, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.bed, text: 'Hospitality',
                            color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.person, text: 'Influencer',
                            color: Colors.pink, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.phonelink, text: 'Internet & Technology',
                            color: Colors.grey, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.phonelink_ring, text: 'Telecommunication',
                            color: Colors.red, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.directions_car, text: 'Transport & Luxury',
                            color: Colors.purple, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                        CategoryAdTitle(icon: Icons.local_airport, text: 'Travel & Tourism',
                            color: Colors.blue, tapped: (){Navigator.pushNamed(context, 'ads_category_page');}),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ) ,
                  ),
                  SizedBox(height: 15,),
                  Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 15),),
                  SizedBox(height: 10,),
                  PageAds(),
                  SizedBox(height: 10,),
                  Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 15),),
                  SizedBox(height: 10,),
                  ShopAds(),
                  SizedBox(height: 10,),
                  Container(color: Colors.blueGrey, width: double.infinity,height: 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 15),),
                  SizedBox(height: 10,),
                  ShopNowAds(),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          )
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'

];

class AdCarousel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AdCarouselState();
  }
}

class _AdCarouselState extends State<AdCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return Column(children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            itemCount: imgList.length,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2,
                disableCenter: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemBuilder: (context, index, realIndex) {
              final urlImage = imgList[index];

              return buildImage(urlImage, index);
            },
          ),
        ),
      SizedBox(height: 10,),
        Container(
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _current,
              count: imgList.length,
              effect: WormEffect(
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 12,
                radius: 10,
                activeDotColor: Colors.blue,
                strokeWidth: 1.0,
              ),
            ),
          ),
        ),
      ]);
  }
}

Widget buildImage(String urlImage, int index) => Container(
  child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Stack(
        children: <Widget>[
          Image.network(urlImage, fit: BoxFit.cover, width: 1000.0,),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. ${imgList.indexOf(urlImage)} image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )),
);


class PageAds extends StatelessWidget {
  const PageAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric( horizontal: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_pages.png', width: 30, height: 30,),
                    SizedBox(width: 5,),
                    Text('Pages', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AdsPages();
                    }));
                  }, child: Text('View All', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: VerifiedPageAd(
                  name: 'Access Bank Ghana🇬🇭',
                ),
              ),
              SizedBox(width: 3,),
              Expanded(
                  child: UnverifiedPageAd(
                    name: 'Maria Photography🇬🇭',
                  ),
              ),
              SizedBox(width: 3,),
              Expanded(
                child: VerifiedPageAd(
                  name: 'Access Ghana🇬🇭',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VerifiedPageAd extends StatelessWidget {
  const VerifiedPageAd({
    Key? key,

    required this.name,

  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ad6.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(name, overflow: TextOverflow.ellipsis, maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white),)),
                    Icon(Icons.verified, size: 12, color: Colors.blue.shade900,),
                  ],
                ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0), bottomRight:Radius.circular(12), bottomLeft: Radius.circular(12)),
              ),

            ),
          ),
        ],
      )
    );
  }
}

class UnverifiedPageAd extends StatelessWidget {
  const UnverifiedPageAd({
    Key? key,
    required this.name,

  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ad1.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              child: Text(name, overflow: TextOverflow.ellipsis, maxLines: 2,style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11),),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0), bottomRight:Radius.circular(12), bottomLeft: Radius.circular(12)),
              ),

            ),
          ),
        ],
      )
    );
  }
}



class ShopAds extends StatelessWidget {
  const ShopAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric( horizontal: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_shop_front.png', width: 30, height: 30,),
                    SizedBox(width: 3,),
                    Text('Shops', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AdsShops();
                    }));
                  }, child: Text('View All', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: ShopVerifiedAds(),),
              SizedBox(width: 3,),
              Expanded(child: ShopUnverifiedAds(),),
              SizedBox(width: 3,),
              Expanded(child: ShopVerifiedAds(),),
            ],
          )
        ],
      ),
    );
  }
}

class ShopVerifiedAds extends StatelessWidget {
  ShopVerifiedAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 140,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1,
                  child: Row(
                    children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/ad4.jpg'),
                    ),
                    SizedBox(width: 3,),
                    Expanded(child: Row(
                      children: [
                        Expanded(
                            child: Text('Adidas🇺🇸', overflow: TextOverflow.ellipsis, maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),)),
                        Icon(Icons.verified, size: 14, color: Colors.blue.shade900,),
                      ],
                    ),)
                  ],))
              ,
              SizedBox(height: 3,),
              Expanded( flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/ad2.jpg', fit: BoxFit.cover,),
                ),
              )
            ],
          ),
    );
  }
}

class ShopUnverifiedAds extends StatelessWidget {
  ShopUnverifiedAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 140,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1,
                  child: Row(children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/adverts.jpg'),
                    ),
                    SizedBox(width: 3,),
                    Expanded(child:
                    Text('Venloh🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),),
                    )
                  ],)),
              SizedBox(height: 3,),
              Expanded( flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/adverts.jpg', fit: BoxFit.cover,),
                ),
              )
            ],
          ),
    );
  }
}

class ShopNowAds extends StatelessWidget {
  const ShopNowAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric( horizontal: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/ic_shop_now.png', width: 30, height: 30,),
                    SizedBox(width: 5,),
                    Text('Shop Now!', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AdsShopNow();
                    }));
                  }, child: Text('View All', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                    color: Colors.blueGrey)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
         Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/ad5.jpg'), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Icon(Icons.collections, color: Colors.white, size: 18,)
                            ),
                          )
                        ],
                      )
                  )),
                SizedBox(width: 3,),
                Expanded(
                  child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/ad5.jpg'), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                Icon(Icons.collections, color: Colors.white, size: 18,)
                            ),
                          )
                        ],
                      )
                  ),),
                SizedBox(width: 3,),
                Expanded(
                  child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/ad5.jpg'), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                Icon(Icons.collections, color: Colors.white, size: 18,)
                            ),
                          )
                        ],
                      )
                  ),),
              ],
            ),

        ],
      ),
    );
  }
}

//profile menu item widget layout
class CategoryAdTitle extends StatelessWidget {
  CategoryAdTitle({
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
      child:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
            BoxShadow(
            offset: Offset(1,2),
          blurRadius: 4,
          spreadRadius: 2,
          color: Colors.grey.withOpacity(0.1)
      )
        ]
        ),
        padding: EdgeInsets.all(5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color != null ? color : Colors.blue,),
              SizedBox(width: 3,),
              Text(text, style: TextStyle(color: Colors.black, fontSize: 14)),
            ]
        ),

      ),
    );
  }
}


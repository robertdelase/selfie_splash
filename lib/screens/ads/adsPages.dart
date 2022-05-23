import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/screens/main_activity/profile_page.dart';
import '../../components/flexibleCard.dart';
import 'package:focused_menu/focused_menu.dart';



class AdsPages extends StatelessWidget {
  const AdsPages ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Page Ads', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: SingleChildScrollView(
          child: Column(
            children: [
              AdsPageVerified(
                name: 'Access Bank Ghana🇬🇭',
                category: 'Banking & Finance',
                bio: 'Tomorrow is Here.',
              ),
              AdsPageVerified(
                name: 'Access Bank Ghana🇬🇭',
                category: 'Banking & Finance',
                bio: 'Tomorrow is Here.',
              ),
              AdsPageVerified(
                name: 'Access Bank Ghana🇬🇭',
                category: 'Banking & Finance',
                bio: 'Tomorrow is Here.',
              ),
              AdsPageUnverified(
                name: 'Maria Photography🇬🇭',
                category: 'Arts & Photography',
                bio: 'Capturing priceless moments!',
              ),
              AdsPageUnverified(
                name: 'Maria Photography🇬🇭',
                category: 'Arts & Photography',
                bio: 'Capturing priceless moments!',
              ),
              AdsPageUnverified(
                name: 'Maria Photography🇬🇭',
                category: 'Arts & Photography',
                bio: 'Capturing priceless moments!',
              ),
            ],
          ),
      ),
    );
  }
}

class AdsPageVerified extends StatelessWidget {
  const AdsPageVerified({
    Key? key,
    required this.name,
    required this.category,
    required this.bio,
  }) : super(key: key);

  final String name, category, bio;

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/ad6.jpg'),
                      ),
                      SizedBox(width: 8,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(name, overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,
                              ),),
                              Icon(Icons.verified, size: 20, color: Colors.blue.shade900,),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Text(category, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                          SizedBox(height: 3,),
                          Text(bio, overflow: TextOverflow.ellipsis, maxLines: 1,),
                        ],
                      ),
                      ),
                    ],
                  ),
                  ),
                ],
              )),
        );
  }
}

class AdsPageUnverified extends StatelessWidget {
  const AdsPageUnverified({
    Key? key,
    required this.name,
    required this.category,
    required this.bio,
  }) : super(key: key);

  final String name, category, bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/ad1.jpg'),
                  ),
                  SizedBox(width: 8,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(name, overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,),),
                      SizedBox(height: 3,),
                      Text(category, style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                      SizedBox(height: 3,),
                      Text(bio, overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ],
                  ),
                  ),
                ],
              ),
              ),
            ],
          )),
    );
  }
}

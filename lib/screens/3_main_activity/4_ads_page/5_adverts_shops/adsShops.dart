import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

class AdsShops extends StatelessWidget {
   AdsShops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List items = [1, 2, 3, 4,5,6,7,8];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
          titleSpacing: 0,
          title: Text('Shop Ads', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
          toolbarHeight: 70,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 5),
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    crossAxisCount: 2,
                    childAspectRatio: 1.4
                  ),

                  itemBuilder: (BuildContext context, index){
                    if(index+1 > 4){
                      return ShopUnverified();
                    }else{
                      return ShopVerified();
                    }
                  },
                  itemCount: items.length,
                ),
              )

      ),
    );
  }
}


class ShopVerified extends StatelessWidget {
  ShopVerified({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/ad4.jpg'),
                ),
                SizedBox(width: 3,),
                Expanded(child: Row(
                  children: [
                    Text('Adidas🇺🇸', overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,
                    ),),
                    Icon(Icons.verified, size: 16, color: Colors.blue.shade900,),
                  ],
                ),)
              ],),
              SizedBox(height: 3,),
              Row(
                children: [
                  Expanded(child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/ad2.jpg', fit: BoxFit.cover, width: 100, height: 100,),
                      )
                  ),
                  SizedBox(width: 3,),
                  Expanded(child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/ad3.jpg', fit: BoxFit.cover, width: 100, height: 100,),
                      )
                  ),
                ],)
            ],
          )),
    );
  }
}

class ShopUnverified extends StatelessWidget {
  ShopUnverified({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/adverts.jpg'),
                ),
                SizedBox(width: 3,),
                Expanded(child:
                    Text('Venlo🇬🇭', overflow: TextOverflow.ellipsis, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,
                    ),),
                )
              ],),
              SizedBox(height: 3,),
              Row(
                children: [
                  Expanded(child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/adverts.jpg', fit: BoxFit.cover, width: 100, height: 100,),
                      )
                  ),
                  SizedBox(width: 3,),
                  Expanded(child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/adverts.jpg', fit: BoxFit.cover, width: 100, height: 100,),
                      )
                  ),
                ],)
            ],
          )),
    );
  }
}


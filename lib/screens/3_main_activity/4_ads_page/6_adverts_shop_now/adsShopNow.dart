import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../../components/popContext.dart';


class AdsShopNow extends StatelessWidget {
  AdsShopNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Shop Now', style: TextStyle(color: Colors.black, fontSize: 22),),
        leading: PopContext(),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ), itemBuilder: (context, index){
          return Container(
            child: Image.asset('assets/ad5.jpg', fit: BoxFit.cover),
          );
        }),
      ),
    );
  }
}



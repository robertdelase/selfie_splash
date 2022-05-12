import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'package:selphie_splash/constants.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87,)),
        title: Text('Alice Stark\'s selfie', style: kOnboardTextSmall.copyWith(color: Colors.black87),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Pallet(),
            Pallet(),
            Pallet(),
          ],
        ),
      ),
    );
  }
}

class Pallet extends StatelessWidget {
  const Pallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ContainerCard(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 30,),
                  SizedBox(width: 5,),
                  Text('Alice stark 🇬🇭', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              ElevatedButton(onPressed: (){}, child: Text('Follow Back'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
              )
            ],
          )
      ),
    );
  }
}

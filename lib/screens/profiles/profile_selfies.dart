import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../components/popContext.dart';


class ProfileSelfies extends StatelessWidget {
  ProfileSelfies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Selfies', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        leading: PopContext(),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ), itemBuilder: (context, index){
          return Container(
            child: Image.asset('assets/selfie1.jpeg', fit: BoxFit.cover),
          );
        }, itemCount: 30,
        ),
      ),
    );
  }
}



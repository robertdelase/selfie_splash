import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../../../components/popContext.dart';


class AdCategory extends StatelessWidget {
  AdCategory({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(title, style: TextStyle(color: Colors.black87),),
        leading: PopContext(),
      ),
      body: Container(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 190,
          mainAxisSpacing: 2
        ), itemBuilder: (context, index){
          return Container(
            child: Image.asset('assets/welcome.png'),
          );
        }),
      ),
    );
  }
}



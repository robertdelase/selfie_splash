import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selphie_splash/constants.dart';


class AddChallenge extends StatelessWidget {
  const AddChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87,),),
        title: Text('New Challenge/Campaign', style: kOnboardTextBig.copyWith(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.image_outlined, color: Colors.grey, size: 200,),
                TextInputOne(title: 'Challenge/Campaign Title', hint: 'title', changed: (value){},),
                TextInputOne(title: 'Description', hint: 'description', changed: (value){},),
                TextInputOne(title: 'Challenge/Campaign Hash Tag(s)', hint: 'hashtag(s)', changed: (value){},),

                ElevatedButton(onPressed: (){}, child: Text('Launch', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal:80, vertical: 20)
                  ),
                ),
                SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      )
    );
  }
}

class TextInputOne extends StatelessWidget {
 TextInputOne({
    Key? key,
    required this.title,
    required this.hint,
    required this.changed
  }) : super(key: key);
  String title, hint;
  ValueChanged changed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          TextField(
            onChanged: changed,
            style: TextStyle(
            ),
            decoration: InputDecoration(
              hintText: 'Enter $hint here',
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,

              ),
            ),
          ),
        ],
      ),
    );
  }
}

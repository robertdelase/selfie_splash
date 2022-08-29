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
        titleSpacing: 0,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
        title: Text('New Challenge/Campaign', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 150,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Icon(Icons.add_a_photo, color: Colors.white, size: 100,),
                    )),
                SizedBox(height: 25,),
                TextInputOne(title: 'Challenge/Campaign Title', hint: 'title', changed: (value){},),
                SizedBox(height: 25,),
                TextInputOne(title: 'Description', hint: 'description', changed: (value){},),
                SizedBox(height: 25,),
                TextInputOne(title: 'Challenge/Campaign HashTag(s)', hint: 'hashtag(s)', changed: (value){},),
                SizedBox(height: 25,),
                ElevatedButton(onPressed: (){}, child: Text('LAUNCH', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal:80, vertical: 20)
                  ),
                ),
                SizedBox(height: 50,)
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
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: changed,
            style: TextStyle(fontSize: 18,
            ),
            decoration: InputDecoration(
              hintText: 'Enter $hint here',
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,

              ),
            ),
          ),
        ],
      ),
    );
  }
}

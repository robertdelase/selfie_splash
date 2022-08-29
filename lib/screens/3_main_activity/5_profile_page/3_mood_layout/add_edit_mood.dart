import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selphie_splash/constants.dart';


class AddEditMood extends StatelessWidget {
  const AddEditMood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleSpacing: 0,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
	      //title text of page
        title: Text('My Mood', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text('Select Mood Icon:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                    SizedBox(width: 10),
		                //onclick opens a popup menu from which user can select any icon
		                //"assets/m1.png" is default icon when no icon is selected
                    GestureDetector(onTap: (){
                      showDialog(context: context, builder: SelectMoodModal);
                    }, child: Image.asset('assets/m1.png', width: 40, height: 40,),)
                  ]
                ),
                SizedBox(height: 30),
		            //allows user to input mood text/caption
                TextInputOne(title: 'Edit Mood Text', hint: 'mood text', changed: (value){},),
                SizedBox(height: 30),
		            //allows user ot input mood hashtags
                TextInputOne(title: 'Edit Mood Tag', hint: 'mood hashtag', changed: (value){},),
                SizedBox(height: 40),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
		                //allows user to discard changes
                    Expanded(
                      child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('BACK', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      )
                    ),
                    SizedBox(width: 20,),
                    //allows user to save changes and update mood
                    Expanded(
                      child: ElevatedButton(onPressed: (){}, child: Text('SAVE', style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
//input widget layout
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
          SizedBox(height: 8,),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: changed,
            style: TextStyle(
                fontSize: 18,
            ),
            decoration: InputDecoration(
              hintText: 'Enter $hint here',
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ],
      ),
    );
  }
}
//opens a popup menu with mood icons from which a user can select any
Widget SelectMoodModal(BuildContext context) =>AlertDialog(
  contentPadding: EdgeInsets.all(10),
  backgroundColor: Colors.transparent,
  content: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      height: MediaQuery.of(context).size.height*0.7,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m1.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m2.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m3.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m4.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m5.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m6.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m7.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m8.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m9.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m10.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m11.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m12.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m13.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m14.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m15.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m16.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m17.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m18.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m19.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m20.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m21.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m22.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m23.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m24.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m25.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m26.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m27.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m28.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m29.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m30.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m31.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m32.png', width: 50, height: 50,),),
              ],),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Image.asset('assets/m33.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m34.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m35.png', width: 50, height: 50,),),
                Expanded(child: Image.asset('assets/m36.png', width: 50, height: 50,),),
              ],),
          ],
        ),
      )
  ),
);
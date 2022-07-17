import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';


class SplashSelfie extends StatelessWidget {
  const SplashSelfie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('New Selfie', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
	      //for displaying selected image/video from phone gallery or camera
              Center(
                child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/welcome.png',  scale: 4, fit: BoxFit.cover)),
              ),
              SizedBox(height: 20,),
              Container(color: Colors.blue, width: double.infinity,height: 1,),
              SizedBox(height: 25,),
	      //for inputing caption text for the Selfie item
              InputBoxes(title: 'Add Caption', hint: 'caption', changed: (value){},),
              SizedBox(height: 25,),
	      //for inputing hashtag(s) for the Selfie item
              InputBoxes(title: 'Add SelfieTag (i.e. #happyselfie #smilingselfie)', hint: 'hashtag', changed: (value){},),
              SizedBox(height: 25,),
	      //for inputing and selecting names of friends/followers to tag for the Selfie item
              InputBoxes(title: 'Tag People', hint: 'people you want to tag', changed: (value){},),
              SizedBox(height: 25,),
	      //for inputing & selecting location for the Selfie item
              InputBoxes(title: 'Add Location', hint: 'location', changed: (value){},),
              SizedBox(height: 25,),
	      //for saving and uploading item to Home Page
              ElevatedButton(onPressed: (){}, child: Text('SPLASH', style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal:80, vertical: 20)
                ),
              ),
              SizedBox(height: 50,),
            ]
          ),
        ),
      ),
    );
  }
}

class InputBoxes extends StatelessWidget {
  InputBoxes({
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
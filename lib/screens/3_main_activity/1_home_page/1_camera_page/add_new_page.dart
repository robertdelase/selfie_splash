import 'package:flutter/material.dart';
import '../../../../../constants.dart';


class AddNew extends StatelessWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
        ],
        elevation: 0.2,
        titleSpacing: 0,
        title: Text('Splash A New?', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
	  //for adding new moments/stories
          ContainerCardExpanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_moments.png', height: 90, width: 90 ),
            SizedBox(width: 5,),
            Text('Moments', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),] ),),
	  
	  //for adding new selfies
          ContainerCardExpanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_selfie.png', height: 90, width: 90),
                SizedBox(width: 10,),
                Text('Selfie', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),] ),),

	  //for adding new posts
          ContainerCardExpanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_post.png', height: 90, width: 90),
                SizedBox(width: 10,),
                Text('Post', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),] ),),

	  //for adding new memes
          ContainerCardExpanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_meme.png', height: 90, width: 90 ),
                SizedBox(width: 10,),
                Text('Meme', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),] ),),

	  //for adding new svlogs
          ContainerCardExpanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash_svlog.png', height: 90, width: 90),
                SizedBox(width: 10,),
                Text('SVlog', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),] ),),
        ],
      ),
    );
  }
}

class RowField extends StatelessWidget {
  const RowField({Key? key, required this.emoji, required this.text} ) : super(key: key);
  final String emoji, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40,)),
          SizedBox(width: 10,),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
        ],
      ),
    );
  }
}


class ContainerCardExpanded extends StatelessWidget {
  const ContainerCardExpanded({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      width: double.infinity,
      child: child,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.4))
          ]),
    ));
  }
}

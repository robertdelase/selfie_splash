import 'package:flutter/material.dart';
class PopContext extends StatelessWidget {
  const PopContext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back, color: Colors.black87));
  }
}
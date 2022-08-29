import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:selphie_splash/constants.dart';


class EditProfile extends StatefulWidget {
   const EditProfile({Key? key}) : super(key: key);

   @override
   State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  String c_string = 'Select your country';
  //for user birthday date selection
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        String convertedDateTime = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
        // _date.value = TextEditingValue(text: picked.toString());
        _date.value = TextEditingValue(text: convertedDateTime);;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          titleSpacing: 0,
          leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,),),
	        //page title
          title: Text('Edit Profile', style: kOnboardTextBig.copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),),
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
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
			                  //displays current user's profile pic or icon placeholder if no pic has been used
                        CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('assets/selfie1.jpeg'),),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                              width: 60,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle
                                ),
                                //allows user to upload profile pic from gallery or take new one onclick
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera,
                                  color: Colors.white, size: 35,), padding: EdgeInsets.zero,),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
		              //for inputting/updating username
                  TextInputOne(title: 'Username', hint: '', changed: (value){},),
		              //for inputting/updating user's bio
                  TextInputOne(title: 'About Me', hint: '', changed: (value){},),
                  SizedBox(height: 30,),
		              //for selecting/updating current country
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Country', style: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.grey
                                    ),
                                  ),
                                  child: Text(c_string, style: TextStyle(fontSize: 18),),
                                )),
                            IconButton(onPressed: (){
                              showCountryPicker(
                                context: context,
                                showPhoneCode: false, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  setState(() {
                                    c_string = '${country.flagEmoji} ${country.name}';
                                  });
                                  print('Select country: ${country.e164Key}');
                                },
                              );
                            }, icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.blueGrey,))
                          ],
                        )
                      ],
                    ),
                  SizedBox(height: 30,),
		              //for selecting date of birth
                  GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: _date,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    width: 1
                                )
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            labelText: 'Birthday',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,),
                            // pass the hint text parameter here
                            hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                            suffixIcon: Icon(Icons.calendar_today, color: Colors.blueGrey,),
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
		              //for updating email
                  TextInputOne(title: 'Email', hint: '', changed: (value){},),
		              //for entering old password
                  TextInputOne(title: 'Old Password', hint: '', changed: (value){},),
		              //for entering new password
                  TextInputOne(title: 'New Password', hint: '', changed: (value){},),
                  SizedBox(height: 20,),
		              //for saving any changes
                  ElevatedButton(onPressed: (){}, child: Text('Save', style: TextStyle(fontSize: 20),),
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
          SizedBox(height: 30,),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: changed,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                )
              ),
              labelText: title,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ],
      ),
    );
  }
}


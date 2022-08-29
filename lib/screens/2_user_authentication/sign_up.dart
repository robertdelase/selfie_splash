import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selphie_splash/constants.dart';
import '../../components/IntroButton.dart';
import 'package:country_picker/country_picker.dart';
import '../../components/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:selphie_splash/auth_service.dart';


String name = '', email = '', c_password = '', password = '', country = '';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FirebaseAuth auth = FirebaseAuth.instance;
  //select country string
  String c_string = 'Select your country';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/login.png'),fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset('assets/logo.png', scale: 2,),
                Text('SelfieSplash', style: GoogleFonts.varelaRound(fontWeight: FontWeight.w500, fontSize: 35,
                    color: Colors.white),),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white54.withOpacity(0.2),
                  ),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      //for inputting user's name
                      InputText(text: "NAME",),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('COUNTRY', style: kOnboardTextSmall,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //for displaying selected country with flag from country list
                              Expanded(
                                  child:Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20)

                                      ),
                                      child: Text(c_string)
                                  ), ),
                              //for opening country list onclick
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
                              }, icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,))
                            ],
                          )
                        ],
                      ),
                      //for inputting email
                      InputText(text: "EMAIL", change: (value) => email = value,),
                      //for inputting password
                      InputText(text: "PASSWORD", change: (value) => password = value),
                      //for re-inputting password for confirmation
                      InputText(text: "CONFIRM PASSWORD", change: (value) => c_password = value),
                      //for authenticating details and taking user to Home Page, with Profile Page generated as well
                      IntroButtons(
                          text: 'SIGN UP',
                          pressed: (){
                            print(email);
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((user) => {
                              user.user
                            }
                            ).catchError((e) => print(e));
                        }
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ALREADY HAVE AN ACCOUNT?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          //navigates user to Log In page
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'login');},child: Text(' LOGIN', style: kOnboardTextSmall.copyWith(fontSize: 16,
                          fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('TROUBLE LOGGING IN?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          //navigates user to Retrieve Password page
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'retrieve');},child: Text(' CLICK HERE', style: kOnboardTextSmall.copyWith(fontSize: 16,
                          fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      SizedBox(height: 20,),


                    ],
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



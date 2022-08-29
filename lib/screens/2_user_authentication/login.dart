import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selphie_splash/constants.dart';
import '../../components/InputField.dart';
import '../../components/IntroButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:selphie_splash/auth_service.dart';
import 'package:provider/provider.dart';
import 'retrieve_password.dart';
import 'sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

String name = '', email = '', password = '';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        //for inputting email
                        InputText(text: "EMAIL", change: (value) => email = value,),
                        //for inputting password
                        InputText(text: "PASSWORD",  change: (value) => password = value),
                        //for authenticating login details and taking user to Home Page
                        IntroButtons(text: 'LOGIN',
                          pressed: () async{
                          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                           //await context.read<AuthService>().SignIn(email, password);
                          },
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("DON'T HAVE AN ACCOUNT?" ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                            //navigates user to Sign Up page
                            GestureDetector(onTap:(){Navigator.pushNamed(context, 'signUp');},child: Text(' SIGN UP', style: kOnboardTextSmall.copyWith(fontSize: 16,
                                fontWeight: FontWeight.bold),)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('TROUBLE LOGGING IN?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                            //navigates user to Retrieve Password page
                            GestureDetector(onTap: (){
                              Navigator.pushNamed(context, 'retrieve');
                              },
                                child: Text(' CLICK HERE', style: kOnboardTextSmall.copyWith(fontSize: 16, fontWeight: FontWeight.bold),)),
                          ],
                        ),
                        SizedBox(height: 20,),


                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}

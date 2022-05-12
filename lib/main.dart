import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/screens/challenge/challenges.dart';
import 'package:selphie_splash/screens/profile/discover_people.dart';
import 'package:selphie_splash/screens/profile/profile_menu.dart';
import 'package:selphie_splash/screens/profile/profile_page.dart';
import 'screens/user_auth/on_boarding.dart';
import 'screens/user_auth/login.dart';
import 'screens/user_auth/sign_up.dart';
import 'screens/user_auth/login.dart';
import 'screens/user_auth/retrieve_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'screens/user_auth/login.dart';
import 'screens/user_auth/sign_up.dart';
import 'screens/user_auth/retrieve_password.dart';
import 'screens/home/home_page.dart';
import 'screens/profile/toolbar_page.dart';
import 'screens/selfie/selfie_post.dart';
import 'screens/ads/ads.dart';
import 'screens/selfie/selfie_of_week.dart';
import 'home.dart';
import 'auth_service.dart';
import 'screens/inbox/inbox.dart';
import 'screens/profile/discover_people.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
              create: (_) => AuthService(FirebaseAuth.instance)),
          StreamProvider(create: (context) => context.read<AuthService>().authUserStateChange, initialData: [],)
        ],
      child:  MaterialApp(
          routes: {
            'home': (context) => HomePage(),
            'login': (context) => LoginPage(),
            'signUp': (context) => SignUp(),
            'profile_page': (context) => ProfilePage(),
            'ads_page': (context) => AdsPage(),
            'inbox': (context) => Inbox(),
            'retrieve': (context) => RetrievePasswordPage(),
            'selphie_post': (context) => PostPage(),
            'profile_menu': (context) => ProfileMenu(),
            'discover': (context) => DiscoverPeople()

          },
          home: AuthenticationWrapper()
      )
    );
  }

}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

}

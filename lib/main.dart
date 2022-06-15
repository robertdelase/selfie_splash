import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/screens/add_new/add_new_page.dart';
import 'package:selphie_splash/screens/add_new/splash_meme.dart';
import 'package:selphie_splash/screens/add_new/splash_moments.dart';
import 'package:selphie_splash/screens/add_new/splash_post.dart';
import 'package:selphie_splash/screens/add_new/splash_svlog.dart';
import 'package:selphie_splash/screens/ads/adsCategory.dart';
import 'package:selphie_splash/screens/ads/adsPages.dart';
import 'package:selphie_splash/screens/ads/adsPreferred.dart';
import 'package:selphie_splash/screens/ads/adsShopNow.dart';
import 'package:selphie_splash/screens/ads/adsShops.dart';
import 'package:selphie_splash/screens/challenges/addChallenge.dart';
import 'package:selphie_splash/screens/challenges/challengeUsers.dart';
import 'package:selphie_splash/screens/challenges/challengeUsersGlobal.dart';
import 'package:selphie_splash/screens/challenges/globalChallenge.dart';
import 'package:selphie_splash/screens/inbox/notifications.dart';
import 'package:selphie_splash/screens/main_activity/whats_on_page.dart';
import 'package:selphie_splash/screens/posted_items/comments_meme.dart';
import 'package:selphie_splash/screens/posted_items/comments_mood.dart';
import 'package:selphie_splash/screens/posted_items/comments_post.dart';
import 'package:selphie_splash/screens/posted_items/comments_selfie.dart';
import 'package:selphie_splash/screens/posted_items/comments_svlog.dart';
import 'package:selphie_splash/screens/posted_items/moments.dart';
import 'package:selphie_splash/screens/posted_items/reacts.dart';
import 'package:selphie_splash/screens/posted_items/tags.dart';
import 'package:selphie_splash/screens/profile_menus/profile_about.dart';
import 'package:selphie_splash/screens/profile_menus/profile_account.dart';
import 'package:selphie_splash/screens/profile_menus/profile_ads.dart';
import 'package:selphie_splash/screens/profile_menus/profile_notifications.dart';
import 'package:selphie_splash/screens/profile_menus/profile_privacy.dart';
import 'package:selphie_splash/screens/profile_menus/profile_security.dart';
import 'package:selphie_splash/screens/profile_menus/profile_support.dart';
import 'package:selphie_splash/screens/profiles/add_edit_mood.dart';
import 'package:selphie_splash/screens/profiles/discover_people.dart';
import 'package:selphie_splash/screens/profile_menus/profile_menu.dart';
import 'package:selphie_splash/screens/main_activity/profile_page.dart';
import 'package:selphie_splash/screens/profiles/edit_profile.dart';
import 'package:selphie_splash/screens/profiles/mutual_social_circle.dart';
import 'package:selphie_splash/screens/profiles/my_social_circle.dart';
import 'package:selphie_splash/screens/profiles/non_mutual_social_circle.dart';
import 'package:selphie_splash/screens/profiles/profile_friend.dart';
import 'package:selphie_splash/screens/profiles/profile_memes.dart';
import 'package:selphie_splash/screens/profiles/profile_mood.dart';
import 'package:selphie_splash/screens/profiles/profile_posts.dart';
import 'package:selphie_splash/screens/profiles/profile_selfies.dart';
import 'package:selphie_splash/screens/profiles/profile_svlogs.dart';
import 'package:selphie_splash/screens/profiles/profile_tags.dart';
import 'package:selphie_splash/screens/profiles/profile_user.dart';
import 'package:selphie_splash/screens/search/search.dart';
import 'package:selphie_splash/screens/selfie_week_country/selfie_of_the_week_country.dart';
import 'screens/user_auth/on_boarding.dart';
import 'screens/user_auth/login.dart';
import 'screens/user_auth/sign_up.dart';
import 'screens/user_auth/retrieve_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'screens/main_activity/home_page.dart';
import 'screens/add_new/add_new_page.dart';
import 'screens/add_new/splash_selfie.dart';
import 'screens/main_activity/ads_page.dart';
import 'screens/main_activity/selfie_of_the_week_page.dart';
import 'home.dart';
import 'screens/inbox/inbox.dart';
import 'screens/profiles/discover_people.dart';

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
            //Add New Items Pages
            'add_new': (context) => AddNew(),
            'splash_selfie': (context) => SplashSelfie(),
            'splash_post': (context) => SplashPost(),
            'splash_meme': (context) => SplashMeme(),
            'splash_svlog': (context) => SplashSVlog(),
            'splash_moments': (context) => SplashMoments(),

            //Ads Pages
            'ads_category_page': (context) => AdsCategory(title: ''),
            'ads_pages': (context) => AdsPages(),
            'ads_preferred': (context) => AdsPreferred(),
            'ads_shop_now': (context) => AdsShopNow(),
            'ads_shops': (context) => AdsShops(),

            //Challenges Pages
            'add_challenge': (context) => AddChallenge(),
            'challenge_users': (context) => ChallengeUsers(name: '', desc: '', tags: ''),
            'challenge_users_global': (context) => ChallengeUsersGlobal(name: '', desc: '', tags: ''),
            'challenge_global': (context) => GlobalChallenge(),

            //Inbox & Notifications Pages
            'inbox': (context) => Inbox(),
            'notifications': (context) => Notifications(),

            //Main Activity Pages
            'home': (context) => HomePage(),
            'selfie_of_the_week': (context) => SelfieOfTheWeekPage(),
            'whats_on': (context) => WhatsOnPage(),
            'ads_page': (context) => AdsPage(),
            'profile_page': (context) => ProfilePage(),

            //Posted Item Comment Pages and other related pages
            'comments_meme': (context) => CommentsMeme(),
            'comments_mood': (context) => CommentsMood(),
            'comments_post': (context) => CommentsPost(),
            'comments_selfie': (context) => CommentsSelfie(),
            'comments_svlog': (context) => CommentsSVlog(),
            'moments': (context) => Moments(),
            'reacts': (context) => Reacts(),
            'tags': (context) => Tags(),

            //User Authentication Pages
            'login': (context) => LoginPage(),
            'signUp': (context) => SignUp(),
            'retrieve': (context) => RetrievePasswordPage(),
            'on_boarding': (context) => OnBoardingScreen(),

            //Profiles, Discover, Follower and other profile related Pages
            'discover': (context) => DiscoverPeople(),
            'add_edit_mood': (context) => AddEditMood(),
            'edit_profile': (context) => EditProfile(),
            'mutual_social_circle': (context) => MutualSocialCircle(),
            'my_social_circle': (context) => MySocialCircle(),
            'non_mutual_social_circle': (context) => NonMutualSocialCircle(),
            'profile_friend': (context) => ProfileFriend(),
            'profile_user': (context) => ProfileUser(),
            'profile_memes': (context) => ProfileMemes(),
            'profile_mood': (context) => ProfileMood(),
            'profile_posts': (context) => ProfilePosts(),
            'profile_selfies': (context) => ProfileSelfies(),
            'profile_svlogs': (context) => ProfileSVlogs(),
            'profile_tags': (context) => ProfileTags(),

            //Profile Menu Pages
            'profile_menu': (context) => ProfileMenu(),
            'profile_account': (context) => Account(),
            'profile_notifications': (context) => ProfileNotifications(),
            'profile_security': (context) => ProfileSecurity(),
            'profile_privacy': (context) => ProfilePrivacy(),
            'profile_ads': (context) => ProfileAds(),
            'profile_about': (context) => ProfileAbout(),
            'profile_support': (context) => ProfileSupport(),

            //Selfie of the Week Country Page
            'selfie_of_the_week_country': (context) => SelfieOfTheWeekCountry(),

            //Search Page
            'search': (context) => SearchPage(),

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
            return OnBoardingScreen();
          }
        },
      ),
    );
  }

}

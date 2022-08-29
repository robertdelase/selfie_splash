import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/2_inbox_page/inbox.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/2_mood_layout/profile_mood.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/3_social_circle/mutual_social_circle.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/4_gallery/1_gallery_selfie/profile_selfies.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/4_gallery/2_gallery_post/profile_posts.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/4_gallery/3_gallery_meme/profile_memes.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/4_gallery/4_gallery_svlog/profile_svlogs.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/4_gallery/5_gallery_tag/profile_tags.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/1_profile_page/profile_friend.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/home_page.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/1_search_page/search.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/3_discover_people_page/discover_people.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/3_discover_people_page/profile_page/3_social_circle/non_mutual_social_circle.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/3_discover_people_page/profile_page/profile_user.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/ads_page.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_about.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_account.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_ads.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_notifications.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_privacy.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_security.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/1_menu_page/profile_menu_items/profile_support.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/3_mood_layout/add_edit_mood.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/4_edit_profile/edit_profile.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/5_social_circle/my_social_circle.dart';
import 'package:selphie_splash/screens/3_main_activity/5_profile_page/profile_page.dart';
import 'screens/1_onboarding/onboarding.dart';
import 'screens/2_user_authentication/login.dart';
import 'screens/2_user_authentication/sign_up.dart';
import 'screens/2_user_authentication/retrieve_password.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/add_new_page.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/1_splash_new_moments/splash_moments.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/2_splash_new_selfie/splash_selfie.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/3_splash_new_post/splash_post.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/4_splash_new_meme/splash_meme.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/1_camera_page/5_splash_new_svlog/splash_svlog.dart';
import 'package:selphie_splash/screens/3_main_activity/2_selfie_of_the_week_page/selfie_of_the_week_page.dart';
import 'package:selphie_splash/screens/3_main_activity/2_selfie_of_the_week_page/selfie_week_country/selfie_of_the_week_country.dart';
import 'package:selphie_splash/screens/3_main_activity/3_whats_on_page/whats_on_page.dart';
import 'package:selphie_splash/screens/3_main_activity/3_whats_on_page/1_create_challenge/addChallenge.dart';
import 'package:selphie_splash/screens/3_main_activity/3_whats_on_page/3_challenge_users/challengeUsers.dart';
import 'package:selphie_splash/screens/3_main_activity/3_whats_on_page/2_view_global/challenge_global_users/challengeUsersGlobal.dart';
import 'package:selphie_splash/screens/3_main_activity/3_whats_on_page/2_view_global/globalChallenge.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/8_category_ads/adsCategory.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/4_adverts_pages/adsPages.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/7_preferred_ads/adsPreferred.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/6_adverts_shop_now/adsShopNow.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/5_adverts_shops/adsShops.dart';
import 'package:selphie_splash/screens/3_main_activity/4_ads_page/2_notifications_page/notifications.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/4_item_selfie/2_comment_page/comments_selfie.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/5_item_post/2_comment_page/comments_post.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/6_item_meme/2_comment_page/comments_meme.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/7_item_svlog/2_comment_page/comments_svlog.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/8_item_mood/2_comment_page/comments_mood.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/3_item_moments/moments.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/9_comment_reacts_tags/reacts.dart';
import 'package:selphie_splash/screens/3_main_activity/1_home_page/9_comment_reacts_tags/tags.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'home.dart';


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

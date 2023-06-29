import 'package:flutter/material.dart';
import 'package:my_app/pages/about_us_page.dart';
import 'package:my_app/pages/assign_quiz_page.dart';
import 'package:my_app/pages/certificate_page.dart';
import 'package:my_app/pages/completed_quiz_page.dart';
import 'package:my_app/pages/dashboard_page.dart';
import 'package:my_app/pages/gallery_for_SAP.dart';
import 'package:my_app/pages/get_email_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/landing_page.dart';
import 'package:my_app/pages/new_password_page.dart';
import 'package:my_app/pages/notification_page.dart';
import 'package:my_app/pages/one_time_page.dart';
import 'package:my_app/pages/profile_page.dart';
import 'package:my_app/pages/exam_details_page.dart';
import 'package:my_app/pages/quiz_page.dart';
import 'package:my_app/pages/quiz_review_page.dart';
import 'package:my_app/pages/security_awareness_page.dart';
import 'package:my_app/pages/terms_and_condition_page.dart';
import 'package:my_app/pages/training_video_page.dart';
import 'package:my_app/pages/verify_otp_page.dart';
import 'package:my_app/pages/welcome_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,

      initialRoute: MyRoutes.WelcomePage,
      // initialRoute: MyRoutes.LandingPage,
      // initialRoute: MyRoutes.HomePage,
      // initialRoute: MyRoutes.Dashboardpage,
      // initialRoute: MyRoutes.ProfilePage,
      // initialRoute: MyRoutes.AssignQuizPage,
      // initialRoute: MyRoutes.CompletedQuizPage,
      // initialRoute: MyRoutes.CertificatePage,
      // initialRoute: MyRoutes.ExamDetailsPage,
      // initialRoute: MyRoutes.OneTimePage,
      // initialRoute: MyRoutes.TermsAndConditionPage,
      // initialRoute: MyRoutes.AboutUsPage,
      // initialRoute: MyRoutes.QuizPage,
      // initialRoute: MyRoutes.QuizReviewPage,
      // initialRoute: MyRoutes.GetEmailPage,
      // initialRoute: MyRoutes.VerfiyOTPPage,
      // initialRoute: MyRoutes.NewPasswordPacge,
      // initialRoute: MyRoutes.SecurityAwarenessPage,
      // initialRoute: MyRoutes.TextPage,
      // initialRoute: MyRoutes.Notificationpage,
      // initialRoute: MyRoutes.TrainingVideopage,
      routes: {
        "/welcomepage": (context) => WelcomePage(),
        "/landingpage": (context) => LandingPage(),
        "/homepage": (context) => HomePage(),
        "/dashBoardpage": (context) => DashboardPage(),
        "/profilepage": (context) => ProfilePage(),
        "/assignQuizpage": (context) => AssignQuizPage(),
        "/completedQuizpage": (context) => CompletedQuizPage(),
        "/certificatepage": (context) => CertificatePage(),
        "/examDetailspage": (context) => ExamDetailsPage(),
        "/oneTimepage": (context) => OneTimePage(),
        "/termsAndConditionpage": (context) => TermsAndConditionPage(),
        "/aboutUspage": (context) => AboutUsPage(),
        "/quizpage": (context) => QuizPage(),
        "/quizReviewpage": (context) => QuizReviewPage(),
        "/getEmailpage": (context) => GetEmailPage(),
        "/verifyOTPpage": (context) => VerifyOTPPage(),
        "/securityAwarenesspage": (context) => SecurityAwarenessPage(),
        "/newPasswordpage": (context) => NewPasswordPage(),
        "/galleryForSAPpage": (context) => GalleryForSAPPage(),
        "/notificationpage": (context) => NotificationPage(),
        "/trainingVideopage": (context) => TrainingVideoPage(),
      },
    );
  }
}

// void storedLoggedInUser(bool isLoggedInUser) async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setBool("isLoggedIn", isLoggedInUser);
// }

// Future<bool?> isLoggedInSatus() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   return preferences.getBool("isLoggedIn") ?? false;
// }

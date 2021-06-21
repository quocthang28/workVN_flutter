import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/api/benefits/benefits_service.dart';
import 'package:workvn/api/company/company_service.dart';
import 'package:workvn/api/dio.dart';
import 'package:workvn/api/job_detail/job_detail_service.dart';
import 'package:workvn/api/recruitment_post/recruitment_post_service.dart';
import 'package:workvn/controller/app_controller.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/controller/benefits_controller.dart';
import 'package:workvn/controller/company_controller/company_controller.dart';
import 'package:workvn/controller/job_detail_controller/job_detail_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/ui/auth/login.dart';
import 'package:workvn/ui/auth/register.dart';
import 'package:workvn/ui/company_detail/company_detail.dart';
import 'package:workvn/ui/home/home.dart';
import 'package:workvn/ui/hot_category_posts/TopViewPosts.dart';
import 'package:workvn/ui/main_screen.dart';
import 'package:workvn/ui/post_detail/post_detail_screen.dart';
import 'package:workvn/ui/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'workVN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: SiteNavigation.SPLASH,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<DioModule>(() => DioModule(), fenix: true);
        Get.put<AppController>(AppController(), permanent: true);
        Get.put<AuthController>(AuthController(), permanent: true);
        Get.put<BenefitsService>(BenefitsService(Get.find<DioModule>().dio),
            permanent: true);
        Get.put<BenefitsController>(BenefitsController(), permanent: true);
        Get.lazyPut<JobDetailService>(
            () => JobDetailService(Get.find<DioModule>().dio),
            fenix: true);
        Get.lazyPut<RecruitmentPostService>(
            () => RecruitmentPostService(Get.find<DioModule>().dio),
            fenix: true);
        Get.lazyPut<CompanyService>(
            () => CompanyService(Get.find<DioModule>().dio),
            fenix: true);
        Get.lazyPut<JobDetailController>(() => JobDetailController(),
            fenix: true);
        Get.lazyPut<RecruitmentPostController>(
            () => RecruitmentPostController(),
            fenix: true);
        Get.lazyPut<CompanyController>(() => CompanyController(), fenix: true);
      }),
      getPages: [
        GetPage(name: SiteNavigation.SPLASH, page: () => SplashScreen()),
        GetPage(name: SiteNavigation.MAIN, page: () => MainScreen()),
        GetPage(name: SiteNavigation.REGISTER, page: () => RegisterScreen()),
        GetPage(name: SiteNavigation.LOGIN, page: () => LoginScreen()),
        GetPage(name: SiteNavigation.HOME, page: () => HomeScreen()),
        GetPage(
            name: SiteNavigation.POSTDETAIL, page: () => PostDetailScreen()),
        GetPage(
            name: SiteNavigation.TOPVIEWPOSTS,
            page: () => TopViewPostsScreen()),
        GetPage(
            name: SiteNavigation.COMPANYDETAIL,
            page: () => CompanyDetailScreen()),
      ],
    );
  }
}

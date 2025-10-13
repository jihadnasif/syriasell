import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syria_sell/view/screen/Ads/AddAd.dart';
import 'package:syria_sell/view/screen/Ads/AddNewAd.dart';
import 'package:syria_sell/view/screen/Ads/ItemDetails.dart';
import 'package:syria_sell/view/screen/Ads/ItemsCategId.dart';
import 'package:syria_sell/view/screen/Ads/PublishedAds.dart';
import 'package:syria_sell/view/screen/Ads/ReviewAds.dart';
import 'package:syria_sell/view/screen/Auth/ForgetPassword/CheckEmailGetPass.dart';
import 'package:syria_sell/view/screen/Auth/ForgetPassword/ResetPassword.dart';
import 'package:syria_sell/view/screen/Auth/ForgetPassword/SuccessResetPassword.dart';
import 'package:syria_sell/view/screen/Auth/ForgetPassword/VerificationCodeRePass.dart';
import 'package:syria_sell/view/screen/Auth/SignIn.dart';
import 'package:syria_sell/view/screen/Auth/SignUp.dart';
import 'package:syria_sell/view/screen/Auth/SuccessSignUpAuth.dart';
import 'package:syria_sell/view/screen/Auth/VerificationCodeSignUp.dart';
import 'package:syria_sell/view/screen/Beginning/Beginning.dart';
import 'package:syria_sell/view/screen/Beginning/GreenPage.dart';
import 'package:syria_sell/view/screen/Beginning/OnBoarding.dart';
import 'package:syria_sell/view/screen/Beginning/welcome.dart';
import 'package:syria_sell/view/screen/Bidding.dart';
import 'package:syria_sell/view/screen/Home/HomeUser.dart';
import 'package:syria_sell/view/screen/More/About.dart';
import 'package:syria_sell/view/screen/More/ChangeLang.dart';
import 'package:syria_sell/view/screen/More/Favorite.dart';
import 'package:syria_sell/view/screen/More/More.dart';
import 'package:syria_sell/view/screen/More/Mydata.dart';
import 'package:syria_sell/view/screen/More/Privacy.dart';
import 'package:syria_sell/view/screen/More/SuccessChangedMydata.dart';
import 'package:syria_sell/view/screen/More/Support.dart';
import 'package:syria_sell/view/screen/More/Terms.dart';
import 'package:syria_sell/view/screen/MyJobs/MyApplicationJobs.dart';
import 'package:syria_sell/view/screen/MyJobs/MyoppJobs.dart';
import 'package:syria_sell/view/screen/jobs/AddJobOpportunity.dart';
import 'package:syria_sell/view/screen/jobs/JobApplicationDetails.dart';
import 'package:syria_sell/view/screen/jobs/JobOpportunityDetails.dart';
import 'package:syria_sell/view/screen/jobs/ViewJobApplication.dart';
import 'package:syria_sell/view/screen/jobs/addJobApplication.dart';
import 'package:syria_sell/view/screen/jobs/viewJopOpportunity.dart';

import 'Binding/Binding.dart';
import 'controller/Ads/ItemDetalisController.dart';
import 'controller/Jobs/ViewJopApplicationControllrt.dart';
import 'controller/Jobs/ViewJopOpportunityController.dart';
import 'core/class/CRUD.dart';
import 'core/constant/routes.dart';
import 'core/localization/ChangeLocalController.dart';
import 'core/localization/translation.dart';
import 'core/middleware/PageBeginnig.dart';
import 'core/services/services.dart';
import 'core/utils/app_scale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  await initialServices();
  runApp(const SyriaSell());
}

class SyriaSell extends StatefulWidget {
  const SyriaSell({super.key});

  @override
  State<SyriaSell> createState() => _SyriaSellState();
}

class _SyriaSellState extends State<SyriaSell> {
  static const platform = MethodChannel('syriasell.deep_link');

  @override
  void initState() {
    super.initState();

    platform.setMethodCallHandler((call) async {
      if (call.method == "onDeepLink") {
        final String link = call.arguments as String;
        print("Deep link received: $link");
        // تأجيل التنقل حتى يتم بناء الـ widget tree
        WidgetsBinding.instance.addPostFrameCallback((_) {
          handleDeepLink(link);
        });
      }
    });
  }

  void handleDeepLink(String link) async {
    try {
      Uri uri = Uri.parse(link);

      if (uri.pathSegments.isEmpty) return;

      final routeType = uri.pathSegments[0]; // "ad", "jobApp", "jobOpp"
      final idStr = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;

      if (idStr == null) {
        debugPrint("Deep link has no ID segment: $link");
        return;
      }

      switch (routeType) {
        case "ad":
          String adId = idStr;
          final controller = Get.isRegistered<ItemDetailsController>()
              ? Get.find<ItemDetailsController>()
              : Get.put(ItemDetailsController());
          // تحديث معرف الإعلان
          if (Get.isRegistered<ItemDetailsController>()) {
            controller.updateItemId(adId);
          }
          Get.toNamed(AppRoute.rItemDetails, arguments: {'itemsId': adId});
          break;

        case "jobApp":
          int? jobAppId = int.tryParse(idStr);
          if (jobAppId != null) {
            final controller =
                Get.isRegistered<ViewJopApplicationControllerImp>()
                    ? Get.find<ViewJopApplicationControllerImp>()
                    : Get.put(ViewJopApplicationControllerImp());

            // جلب البيانات من السيرفر إذا لم تكن موجودة
            await controller.getJobApplicationById(jobAppId);

            // الانتقال للصفحة بعد التحميل
            Get.toNamed(AppRoute.rJobApplicationDetails,
                arguments: {'jobId': jobAppId});
          } else {
            debugPrint("Invalid jobApp ID: $idStr");
          }
          break;

        case "jobOpp":
          int? jobOppId = int.tryParse(idStr);
          if (jobOppId != null) {
            final controller =
                Get.isRegistered<ViewJopOpportunityControllerImp>()
                    ? Get.find<ViewJopOpportunityControllerImp>()
                    : Get.put(ViewJopOpportunityControllerImp());

            // جلب البيانات إذا لزم الأمر
            await controller.getJobOpportunityById(jobOppId);

            Get.toNamed(AppRoute.rJobOpportunityDetails,
                arguments: {'jobId': jobOppId});
          } else {
            debugPrint("Invalid jobOpp ID: $idStr");
          }
          break;

        default:
          debugPrint("Unknown deep link type: $routeType");
      }
    } catch (e) {
      debugPrint("Error handling deep link: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    AppScale.init(context);
    LocalController localController = Get.put(LocalController());
    Get.lazyPut(() => CRUD());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTraslation(),
      title: 'SyriaSell',
      locale: localController.language,
      theme: localController.themeData,
      initialBinding: MyBinding(),
      //home: HomeUser(),
      getPages: [
        // ------------beginning--------------
        GetPage(
          name: AppRoute.rBeginning,
          page: () => Beginning(),
          middlewares: [MiddPageBeginnig()],
        ),
        GetPage(name: AppRoute.rWelcome, page: () => Welcome()),
        GetPage(name: AppRoute.rGreenpage, page: () => Greenpage()),
        GetPage(name: AppRoute.rOnBoarding, page: () => OnBoarding()),
        // --------------Auth:------------
        GetPage(name: AppRoute.rSignIn, page: () => SignIn()),
        GetPage(name: AppRoute.rSignUp, page: () => SignUp()),
        GetPage(
            name: AppRoute.rVerificationCodeSignUp,
            page: () => VerificationCodeSignUp()),
        GetPage(name: AppRoute.rSuccessSignUpAuth, page: () => SuccessSignUp()),
        //-------------ForGetPassWord-------------
        GetPage(
            name: AppRoute.rCheckEmailGetPass, page: () => ForgetPassword()),
        GetPage(
            name: AppRoute.rVerificationCodeRePass,
            page: () => VerificationCodeRePass()),
        GetPage(name: AppRoute.rResetPassword, page: () => ResetPassword()),
        GetPage(
            name: AppRoute.rSuccessResetPassword,
            page: () => SuccessResetPassword()),
        // ------------------Home---------------
        GetPage(name: AppRoute.rHomeUser, page: () => HomeUser()),

        // ------------------Ads---------------
        GetPage(name: AppRoute.rAddNewAd, page: () => AddNewAd()),
        GetPage(name: AppRoute.rAddAd, page: () => AddAd()),
        GetPage(name: AppRoute.rPublishedAds, page: () => PublishedAds()),
        GetPage(name: AppRoute.rReviewAds, page: () => ReviewAds()),
        GetPage(
            name: AppRoute.rItemDetails,
            page: () => ItemDetails(
                // قيمة افتراضية، سيتم استبدالها عند استقبال deep link
                )),
        GetPage(name: AppRoute.rItemsCategId, page: () => ItemsCategId()),

        // ------------------More Page---------------
        GetPage(name: AppRoute.rMore, page: () => More()),
        GetPage(name: AppRoute.rAbout, page: () => About()),
        GetPage(name: AppRoute.rPrivacy, page: () => Privacy()),
        GetPage(name: AppRoute.rTerms, page: () => Terms()),
        GetPage(name: AppRoute.rChangeLang, page: () => ChangeLang()),
        GetPage(name: AppRoute.rMydata, page: () => Mydata()),
        GetPage(
            name: AppRoute.rSuccessChagedMydata,
            page: () => SuccessChagedMydata()),
        GetPage(name: AppRoute.rSupport, page: () => Support()),
        GetPage(name: AppRoute.rFavorite, page: () => Favorite()),

        //-----------rBidding-------
        GetPage(name: AppRoute.rBidding, page: () => Bidding()),

        //-----------AddJob-------
        GetPage(
            name: AppRoute.rAddJobOpportunity, page: () => AddJobOpportunity()),
        GetPage(
            name: AppRoute.rAddJobApplication, page: () => AddJobApplication()),

        GetPage(
            name: AppRoute.rViewJopOpportunity,
            page: () => ViewJopOpportunity()),
        GetPage(
            name: AppRoute.rViewJopApplication,
            page: () => ViewJopApplication()),

        GetPage(
          name: AppRoute.rJobOpportunityDetails,
          page: () {
            final args = Get.arguments as Map<String, dynamic>;
            return JobOpportunityDetails(jobId: args["jobId"]);
          },
        ),

        GetPage(
          name: AppRoute.rJobApplicationDetails,
          page: () {
            final args = Get.arguments as Map<String, dynamic>;
            return JobApplicationDetails(jobId: args["jobId"]);
          },
        ),

        //----------MyJobs--------------
        GetPage(
            name: AppRoute.rMyApplicationjobs, page: () => MyApplicationjobs()),
        GetPage(name: AppRoute.rMyOppjobs, page: () => MyOppjobs()),
      ],
    );
  }
}

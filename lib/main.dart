import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wholesell_shop/all_bindings/get_di.dart';
import 'package:wholesell_shop/res/app_routes/app_routes.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/languages.dart';
import 'package:wholesell_shop/utils/app_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, __) {
          return GetMaterialApp(
            translations: Languages(),
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            theme: ThemeData(
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                // useMaterial3: true,
                scaffoldBackgroundColor: AppColors.whiteBg,

                // colorScheme.colo: whiteBg,
                fontFamily: AppConstant.manrope),
            // home: const SplashView(),
            getPages: AppRoutes.appRoutes(),
            initialRoute: AppRoutesName.splashView,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

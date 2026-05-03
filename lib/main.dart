import 'package:ecommercecourse/binding/initbinding.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/core/localization/translation.dart';
import 'package:ecommercecourse/core/services/services.dart';
import '../routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    MyServices myServices = Get.find();

    String? step = myServices.sharedPreferences.getString("step");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      fallbackLocale: const Locale("en"),
      title: 'Home',
      theme: controller.appTheme,

      // 🔥 هنا التعديل
      initialRoute: step == "2"
          ? AppRoute.homepage
          : step == "1"
          ? AppRoute.login
          : AppRoute.onBoarding,

      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}

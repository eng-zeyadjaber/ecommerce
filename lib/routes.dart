import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/middleware/mymiddleware.dart';
// import 'package:ecommercecourse/test.dart';
import 'package:ecommercecourse/test_view.dart';
import 'package:ecommercecourse/view/screen/auth/ForgotPassword/forgot_password.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/successcreen.dart';
import 'package:ecommercecourse/view/screen/auth/login.dart';
import 'package:ecommercecourse/view/screen/auth/ForgotPassword/reset_password.dart';
import 'package:ecommercecourse/view/screen/auth/signup.dart';
import 'package:ecommercecourse/view/screen/auth/ForgotPassword/verifycode.dart';
import 'package:ecommercecourse/view/screen/onbording.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.onBoarding,
    page: () => const OnBording(),
    middlewares: [MyMiddleWare()],
  ),
  // Auth
  GetPage(name: "/", page: () => const TestView()),
  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
    middlewares: [MyMiddleWare()],
  ),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.success, page: () => const SuccessScreen()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBording()),

  // Home
  GetPage(
    name: AppRoute.homepage,
    page: () => const Home(),
    middlewares: [MyMiddleWare()],
  ),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   AppRoute.login: (context) => const Login(),

//   AppRoute.signup: (context) => const SignUp(),

//   AppRoute.forgotPassword: (context) => const ForgotPassword(),

//   AppRoute.verifyCode: (context) => const VerifyCode(),

//   AppRoute.resetPassword: (context) => const ResetPassword(),

//   AppRoute.success: (context) => const SuccessScreen(),

//   AppRoute.onBoarding: (context) => const OnBording(),
// };

import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/function/handlingdatactrl.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/source/remote/home_data.dart';
import 'package:get/get.dart';

class HomeControllerImp extends GetxController {
  MyServices myServices = Get.find();

  bool isSearchOpen = false;
  int currentIndex = 2;
  String? username;
  String? email;
  String? phone;
  String? id;
  HomeData homeData = HomeData(Get.find());
  // List data = [];
  List categories = [];
  List items = [];
  StatusRequest statusRequest = StatusRequest.none;

  /// حالة المستخدم
  String? step;

  @override
  void onInit() {
    super.onInit();

    // 🔥 جلب البيانات
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getString("id");
    getData();
    // 🔥 جلب الحالة
    step = myServices.sharedPreferences.getString("step");
  }

  /// 🔥 Logout
  logout() async {
    await myServices.sharedPreferences.setString("step", "1");

    Get.offAllNamed(AppRoute.login);
  }

  /// 🔥 change Page
  changePage(int index) {
    currentIndex = index;
    update();
  }

  /// 🔥 Search
  void toggleSearch() {
    isSearchOpen = !isSearchOpen;
    update();
  }

  /// 🔥 Categories Data
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(seconds: 1));
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // // 🔥 دالة لجلب الكاتيجوري فقط
  // getCategoriesOnly() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await homeData.getCategoriesData();
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       categories.clear(); // مسح البيانات القديمة
  //       categories.addAll(response['categories']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }
}

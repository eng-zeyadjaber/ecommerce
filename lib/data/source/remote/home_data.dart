import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class HomeData {
  CRUD crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  // // 🔥 دالة لجلب الكاتيجوري فقط من قاعدة البيانات
  // getCategoriesData() async {
  //   var response = await crud.postData(AppLink.homepage, {});
  //   return response.fold((l) => l, (r) => r);
  // }
}

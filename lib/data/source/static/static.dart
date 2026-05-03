import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/data/model/onBordingmodel.dart';

List<OnBordingModel> onBordingList = [

  /// الصفحة الأولى (اختيار اللغة أو البداية)
  OnBordingModel(
    title: "",
    body: "",
    image: AppImageAsset.logo,
    width: 80,
    height: 80,
  ),

  /// الصفحة الثانية
  OnBordingModel(
    title: "onboarding_title1",
    body: "onboarding_body1",
    image: AppImageAsset.onBordingImageTwo,
    width: 330,
    height: 250,
  ),

  /// الصفحة الثالثة
  OnBordingModel(
    title: "onboarding_title2",
    body: "onboarding_body2",
    image: AppImageAsset.onBordingImageThree,
    width: 350,
    height: 260,
  ),

  /// الصفحة الرابعة
  OnBordingModel(
    title: "onboarding_title3",
    body: "onboarding_body3",
    image: AppImageAsset.onBordingImagefour,
    width: 350,
    height: 260,
  ),
];
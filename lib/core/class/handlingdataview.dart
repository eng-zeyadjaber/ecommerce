import 'package:ecommercecourse/core/class/statusRequest.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 100, height: 100),
          )
        : statusRequest == StatusRequest.offlinefilure
        ? Center(
            child: Lottie.asset(AppImageAsset.offline, width: 200, height: 200),
          )
        : statusRequest == StatusRequest.serverfalure
        ? Center(
            child: Lottie.asset(AppImageAsset.server, width: 100, height: 100),
          )
        : statusRequest == StatusRequest.failure
        ? Center(
            child: Lottie.asset(AppImageAsset.noData, width: 100, height: 100),
          )
        : widget;
  }
}

///////////////////////////////////////////////////////////////
class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 100, height: 100),
          )
        : statusRequest == StatusRequest.offlinefilure
        ? Center(
            child: Lottie.asset(AppImageAsset.offline, width: 200, height: 200),
          )
        : statusRequest == StatusRequest.serverfalure
        ? Center(
            child: Lottie.asset(AppImageAsset.server, width: 100, height: 100),
          )
        : widget;
  }
}

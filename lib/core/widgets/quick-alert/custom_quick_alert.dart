import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:two_website/config/routes/app_route_config.dart';

class CustomQuickAlert {
  Future<dynamic> userTypeAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        title: "Choose Your Type",
        width: 300,
        confirmBtnText: "Employee",
        onConfirmBtnTap: () {
          context.pushReplacementNamed(AppRouteConfig.fillEmployeeProfile);
          context.pop();
        },
        cancelBtnText: "Client",
        onCancelBtnTap: () {
          context.pushReplacementNamed(AppRouteConfig.fillClientProfile);
          context.pop();
        });
  }

  Future<dynamic> successAlert(BuildContext context) {
    return QuickAlert.show(
        context: context, type: QuickAlertType.success, width: 300);
  }

  Future<dynamic> failureAlert(BuildContext context, String? text) {
    return QuickAlert.show(
        context: context, type: QuickAlertType.error, text: text, width: 300);
  }

  Future<dynamic> loadingAlert(BuildContext context) {
    return QuickAlert.show(
        context: context, type: QuickAlertType.loading, width: 300);
  }

  Future<dynamic> passwordMatchingAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Password does not matching",
        width: 300);
  }

  Future<dynamic> addImageAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: "Please add the image",
        width: 300);
  }

  Future<dynamic> addRoleAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: "Please add the role",
        width: 300);
  }

  Future<dynamic> addCvAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: "Please add the cv file",
        width: 300);
  }
}

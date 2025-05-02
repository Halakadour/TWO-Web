import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CustomQuickAlert {
  Future<dynamic> successAlert(BuildContext context) {
    return QuickAlert.show(
        context: context, type: QuickAlertType.success, width: 300);
  }

  Future<dynamic> failureAlert(BuildContext context, String? text) {
    return QuickAlert.show(
        context: context, type: QuickAlertType.error, text: text, width: 300);
  }

  Future<dynamic> noTokenAlert(BuildContext context) {
    return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: "you need to have an account first.",
        width: 300);
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

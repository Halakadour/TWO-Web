import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/yes_text_botton.dart';

Future<dynamic> showConfirmDeletionDialog(
    BuildContext context, String deleteItemName, void Function()? onPressed) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Are you sure you want to delete $deleteItemName ?",
        style: AppTextStyle.bodyMd(color: AppColors.redShade2),
      ),
      actions: [const CancelTextButton(), YesTextBotton(onPressed: onPressed)],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/yes_text_botton.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

Future<dynamic> showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        TextStrings.wantToLogOut,
        style: AppTextStyle.bodyMd(),
      ),
      actions: [
        const CancelTextButton(),
        YesTextBotton(onPressed: () {
          context.read<AuthRoleProfileBloc>().add(LogoutUserEvent());
          context.pop();
        }),
      ],
    ),
  );
}

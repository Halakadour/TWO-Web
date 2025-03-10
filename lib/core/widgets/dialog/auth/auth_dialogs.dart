import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/layouts/buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/layouts/buttons/yes_text_botton.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class AuthDialogs {
  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Want to logout ? ",
          style: AppTextStyle.subtitle01(),
        ),
        actions: [
          const CancelTextButton(),
          BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
            listener: (context, state) {
              logoutStateHandling(state, context);
            },
            listenWhen: (previous, current) =>
                previous.authModelStatus != current.authModelStatus,
            child: YesTextBotton(onPressed: () {
              context.read<AuthRoleProfileBloc>().add(LogoutUserEvent());
              context.pop();
            }),
          )
        ],
      ),
    );
  }

  void logoutStateHandling(AuthRoleProfileState state, BuildContext context) {
    if (state.authModelStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.authModelStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      SharedPreferencesServices.deleteUserToken();
      context.pop();
    } else if (state.authModelStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.authModelStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}

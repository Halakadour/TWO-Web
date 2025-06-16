import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dialog/auth/make_an_account_dialog.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/soial_media_group.dart';

class TwoDetails extends StatefulWidget {
  const TwoDetails({super.key});

  @override
  State<TwoDetails> createState() => _TwoDetailsState();
}

class _TwoDetailsState extends State<TwoDetails> {
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PaddingConfig.h48,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: LocaleKeys.homeTitle1.tr(),
                  style: AppTextStyle.headerLg()),
              TextSpan(
                  text: LocaleKeys.homeTitle2.tr(),
                  style: AppTextStyle.headerLg(color: AppColors.greenShade2))
            ])),
        PaddingConfig.h24,
        CustomCartoonButton(
          title: LocaleKeys.orderProj.tr(),
          onTap: () {
            if (context.read<AuthRoleProfileBloc>().state.authorizedStatus ==
                CasualStatus.authorized) {
              context.pushNamed(AppRouteConfig.contactUs);
            } else {
              showMakeAccountDialog(context);
            }
          },
        ),
        PaddingConfig.h24,
        Text(
          LocaleKeys.orContactUs.tr(),
          style: AppTextStyle.bodyLg(),
        ),
        PaddingConfig.h16,
        const SoialMediaGroup()
      ],
    );
  }
}

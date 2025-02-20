import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/functions/tuggle_password.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/layouts/templates/centerd_view.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/auth/presentation/widgets/decor_box.dart';
import 'package:two_website/features/auth/presentation/widgets/google_git_row.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../core/network/enums.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isSecurePassword = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterdView(
          child: Row(
        children: [
          const Expanded(flex: 2, child: DecorBox()),
          PaddingConfig.w50,
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
                  listener: (context, state) async {
                    if (state.authModelStatus == CasualStatus.loading) {
                      CustomQuickAlert().loadingAlert(context);
                    } else if (state.authModelStatus == CasualStatus.success) {
                      await SharedPreferencesServices.setUserToken(
                          state.authModel!.token);
                      context.pop();
                      CustomQuickAlert().userTypeAlert(context);
                    } else if (state.authModelStatus == CasualStatus.failure) {
                      context.pop();
                      CustomQuickAlert().failureAlert(context);
                    } else {
                      const SizedBox();
                    }
                  },
                  listenWhen: (previous, current) =>
                      previous.authModelStatus != current.authModelStatus,
                  child: Column(
                    children: [
                      PaddingConfig.h30,
                      SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Log in",
                              style: AppTextStyle.heading00(),
                            ),
                            PaddingConfig.h30,
                            Text(
                              "Log in with open account",
                              style: AppTextStyle.subtitle02(
                                  color: AppColors.fontDarkColor),
                            ),
                            PaddingConfig.h10,
                            const GoogleGitRow(),
                            PaddingConfig.h20,
                            const SizedBox(
                              child: Divider(
                                color: AppColors.grayColor,
                                thickness: 1,
                              ),
                            ),
                            PaddingConfig.h20,
                            Text(
                              "Or continue with email address",
                              style: AppTextStyle.subtitle02(
                                  color: AppColors.fontDarkColor),
                            ),
                            PaddingConfig.h20,
                            CustomTextFormField(
                                validator: (email) {
                                  if (email != null && email.isValidEmail()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _emailController,
                                prefixIconPath: IconsPath.email,
                                labelText: "email*"),
                            PaddingConfig.h20,
                            CustomTextFormField(
                                validator: (password) {
                                  if (password != null &&
                                      password.isValidPassword()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _passwordController,
                                prefixIconPath: IconsPath.lock,
                                postfixIconPath:
                                    togglePassword(_isSecurePassword, () {
                                  setState(() {
                                    _isSecurePassword = !_isSecurePassword;
                                  });
                                }),
                                labelText: "password*"),
                            PaddingConfig.h40,
                            CustomCartoonButton(
                              isHover: isHover,
                              title: "Log In",
                              width: double.infinity,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthRoleProfileBloc>().add(
                                      LoginUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

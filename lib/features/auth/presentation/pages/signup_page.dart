import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/functions/tuggle_password.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/layouts/templates/centerd_view.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/features/auth/presentation/widgets/already_have_count_row.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/auth/presentation/widgets/decor_box.dart';
import 'package:two_website/features/auth/presentation/widgets/google_git_row.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';

import '../../../../config/constants/padding_config.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool _isSecurePassword = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
                      const AlreadyHaveCountRow(),
                      PaddingConfig.h30,
                      SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.signup.tr(),
                              style: AppTextStyle.heading00(),
                            ),
                            PaddingConfig.h30,
                            Text(
                              "Sign up with open account",
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
                                validator: (fullname) {
                                  if (fullname != null &&
                                      fullname.isNotShortText()) {
                                    return null;
                                  } else {
                                    return "error";
                                  }
                                },
                                controller: _fullnameController,
                                prefixIconPath: IconsPath.user,
                                labelText: "full name*"),
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
                              labelText: "password*",
                              obscureText: _isSecurePassword,
                              hintText: "+8 characters",
                            ),
                            PaddingConfig.h20,
                            CustomTextFormField(
                              validator: (password) {
                                if (password != null &&
                                    password == _passwordController.text) {
                                  return null;
                                } else {
                                  return "error";
                                }
                              },
                              controller: _confirmPasswordController,
                              prefixIconPath: IconsPath.lock,
                              postfixIconPath:
                                  togglePassword(_isSecurePassword, () {
                                setState(() {
                                  _isSecurePassword = !_isSecurePassword;
                                });
                              }),
                              labelText: "Confirm password*",
                              hintText: "Rewrite your password",
                              obscureText: _isSecurePassword,
                            ),
                            PaddingConfig.h40,
                            CustomCartoonButton(
                              isHover: isHover,
                              title: "Sign Up",
                              width: double.infinity,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_confirmPasswordController.text !=
                                      _passwordController.text) {
                                    CustomQuickAlert()
                                        .passwordMatchingAlert(context);
                                  } else {
                                    context.read<AuthRoleProfileBloc>().add(
                                        RegisteNewUserEvent(
                                            name: _fullnameController.text,
                                            email: _emailController.text,
                                            password:
                                                _passwordController.text));
                                  }
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

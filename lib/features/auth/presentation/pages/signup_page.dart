import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/functions/tuggle_password.dart';
import 'package:two_website/core/network/enum_status.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
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
  bool _isHovered = false;

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
          w50,
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
                  listener: (context, state) async {
                    if (state.authModelStatus == CasualStatus.loading) {
                      const CircularProgressIndicator();
                    } else if (state.authModelStatus == CasualStatus.success) {
                      await SharedPreferencesServices.setUserToken(
                          state.authModel!.token);
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Choose Your Type",
                        confirmBtnText: "Employee",
                        width: 300,
                        onConfirmBtnTap: () => context.pushReplacementNamed(
                            AppRouteConfig.fillEmployeeProfile),
                        cancelBtnText: "Client",
                        onCancelBtnTap: () => context.pushReplacementNamed(
                            AppRouteConfig.fillClientProfile),
                      );
                    } else if (state.authModelStatus == CasualStatus.failure) {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          width: 300);
                    } else {
                      const SizedBox();
                    }
                  },
                  listenWhen: (previous, current) =>
                      previous.authModelStatus != current.authModelStatus,
                  child: Column(
                    children: [
                      const AlreadyHaveCountRow(),
                      h30,
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
                            h30,
                            Text(
                              "Sign up with open account",
                              style: AppTextStyle.subtitle02(
                                  color: AppColors.fontDarkColor),
                            ),
                            h10,
                            const GoogleGitRow(),
                            h20,
                            const SizedBox(
                              child: Divider(
                                color: AppColors.grayColor,
                                thickness: 1,
                              ),
                            ),
                            h20,
                            Text(
                              "Or continue with email address",
                              style: AppTextStyle.subtitle02(
                                  color: AppColors.fontDarkColor),
                            ),
                            h20,
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
                            h20,
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
                            h20,
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
                            h20,
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
                                labelText: "re-enter password*"),
                            h40,
                            MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _isHovered = true;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _isHovered = false;
                                  });
                                },
                                child: CustomCartoonButton(
                                  isHovered: _isHovered,
                                  title: "Sign Up",
                                  width: double.infinity,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (_confirmPasswordController.text !=
                                          _passwordController.text) {
                                        QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.error,
                                            title: "Password does not matching",
                                            width: 300);
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
                                )),
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
